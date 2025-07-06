module extractor.BaseEmitter;

import ctools.all;
import extractor;

class BaseEmitter {
protected:
    Emitter emitter;
    Emitter.Flag flags;
    StringBuffer buf;
    Emitter.CharBytePlugin charBytePlugin;

    string tab(Node n) {
        if(n.nid==Nid.STRUCTDEF || n.nid==Nid.UNION) {
            return tab(n.parent) ~ "\t";
        }
        if(n.nid==Nid.ROOT) {
            return "";
        }
        return tab(n.parent);
    }
    bool flag(Emitter.Flag f) {
        return (flags&f) != 0;
    }
public:
    this(Emitter emitter) {
        this.emitter = emitter;
        this.flags = emitter.getFlags();
        this.buf = emitter.getStringBuffer();
        this.charBytePlugin = emitter.getCharBytePlugin();
    }
    final void emit(Node n) {
        final switch(n.nid) with(Nid) {
            case VAR: emit(n.as!Var); break;
            case BINARY: emit(n.as!Binary); break;
            case UNARY: emit(n.as!Unary); break;
            case IDENTIFIER: emit(n.as!Identifier); break;
            case NUMBER: emit(n.as!Number); break;
            case PARENS: emit(n.as!Parens); break;
            case ARRAYTYPE: emit(n.as!ArrayType); break;
            case ENUM: emit(n.as!Enum); break;
            case FUNCDECL: emit(n.as!FuncDecl, true); break;
            case FUNCDEF: emit(n.as!FuncDef); break;
            case PRIMITIVETYPE: emit(n.as!PrimitiveType); break;
            case PTRTYPE: emit(n.as!PtrType); break;
            case STRUCTDEF: emit(n.as!StructDef); break;
            case TYPEREF: emit(n.as!TypeRef, true); break;
            case UNION: emit(n.as!Union); break;
            case STRING:
            case TERNARY:
            case INDEX:
            case MEMBER:
            case CALL:
            case CAST:
            case CHAR:
            case ADDRESSOF:
            case DEREF:
            case IF:
            case FOR:
            case RETURN:
            case SCOPE:
            case TYPEDEF:
            case ROOT:
                throwIf(true, "Unhandled Node %s", n.nid);
                break;
        }
    }
    //──────────────────────────────────────────────────────────────────────────────────────────────
    void emit(StructDef sd) {
        buf.add("struct %s {\n", sd.name);
        string t = tab(sd);

        if(sd.hasBitfields()) {   
            writefln("[NOTE] bitfields detected in %s", sd);

            struct BF {
                Var v;
                string fieldName;
                uint startBit;
                uint numBits;
                string storageFieldName;

                string toString() {
                    return format("%s: bits %s..%s -> %s", fieldName, startBit, startBit+(numBits-1), storageFieldName);
                }
            }

            Var[] variables = sd.variables();
            uint numStorageVars = 0;
            string storageVarName;
            Var storageVar;
            int storageVarIndex = -1;
            uint size;
            uint bitOffset;
            BF[] bitfields;

            foreach(i, st; sd.statements()) {
                if(Var v = st.as!Var) {
                    if(v.hasBitfieldBits) {
                        if(v.hasInitialiser) {
                            writefln(("[WARN] struct %s has bitfields with initialisers. " ~
                                "This is not currently supported and the emitted struct will need to be manually repaired."), sd.name);
                            return;
                        }
                        if(v.type().size() != 4) {
                            writefln(("[WARN] struct %s has bitfields that are not 32 bits. " ~
                                "This is not currently supported and the emitted struct will need to be manually repaired."), sd.name);
                            return;
                        }

                        string fieldName = v.name;

                        if(storageVarIndex == -1) {
                            // this is the start of 1 or more bitfields
                            storageVarIndex = i.as!int;
                            storageVar = v;
                            size = v.type().size() * 8;
                            bitOffset = 0;
                            storageVarName = v.name;
                            v.name = "_bf%s".format(numStorageVars++);

                            buf.add(t);
                            emit(v);

                        } else {
                            // This is a subsequent bitfield

                            if(bitOffset > size) {
                                // Spans multiple storage vars
                                writefln(("[WARN] struct %s has bitfields that span multiple storage variables. " ~
                                    "This is not currently supported and the emitted struct will need to be manually repaired."), sd.name);
                                return;
                            }

                            if(bitOffset == size) {
                                // Output the next storage var
                                storageVarIndex++;
                                storageVar = variables[storageVarIndex];
                                storageVarName = storageVar.name;
                                storageVar.name = "_bf%s".format(numStorageVars++);
                                size = storageVar.type().size() * 8;
                                bitOffset = 0;

                                buf.add(t);
                                emit(storageVar);
                            }
                        }

                        uint numBits = v.getBitfieldValue();
                        bitfields ~= BF(v, fieldName, bitOffset, numBits, storageVar.name);
                        bitOffset += numBits;

                    } else {
                        // Reset
                        storageVarIndex = -1;

                        buf.add(t);
                        emit(v);
                    }
                } else {
                    buf.add(t);
                    emit(st);
                }
            }

            if(bitfields.length > 0) {
                import std.string : toUpper;
                buf.add("\n");
                buf.add(t);
                buf.add("// bitfield getters\n");
                foreach(bf; bitfields) {
                    string name = Emitter.dname(bf.fieldName);
                    string storageName = Emitter.dname(bf.storageFieldName);
                    uint shr = bf.startBit;
                    uint and = (1 << bf.numBits) - 1;
                    name = "%s%s".format(name[0..1].toUpper(), name[1..$]);

                    buf.add(t);
                    emit(bf.v.type());
                    buf.add(" get%s", name);
                    buf.add("() { return (%s >>> %s) & 0x%08x; }\n", storageName, shr, and);
                }
                buf.add("\n");
                buf.add(t);
                buf.add("// bitfield setters\n");
                foreach(bf; bitfields) {
                    string name = Emitter.dname(bf.fieldName);
                    string storageName = Emitter.dname(bf.storageFieldName);
                    uint shr = bf.startBit;
                    uint and = (1 << bf.numBits) - 1;
                    name = "%s%s".format(name[0..1].toUpper(), name[1..$]);

                    buf.add(t);
                    buf.add("void set%s(", name);
                    emit(bf.v.type());

                    buf.add(" value) { %s = (%s & 0x%08x) | ((value & 0x%x) << %s); }\n", 
                        storageName, storageName, ~(and << shr), and, shr);  
                }
            }
        } else {
            foreach(st; sd.statements()) {
                buf.add(t);
                emit(st);
            }
        }
        buf.add("%s}\n", tab(sd.parent));
    }
    void emit(Typedef td) {
        buf.add("alias %s = ", td.name);
        emit(td.type());
        buf.add(";\n");
    }
    void emit(PrimitiveType t) {
        string s = t.unsigned ? "u" : "";
        switch(t.kind) with(TKind) {
            case BOOL: s = "bool"; break;
            case CHAR: s ~= charBytePlugin.eval(t); break;
            case SHORT: s ~= "short"; break;
            case INT: s ~= "int"; break;
            case LONG: s ~= "int"; break;
            case LONG_LONG: s ~= "long"; break;
            case FLOAT: s = "float"; break;
            case DOUBLE: s = "double"; break;
            case VOID: s = "void"; break;
            default: throwIf(true, "Unhandled PrimitiveType %s", t); break;
        }
        buf.add("%s", s);
    }
    void emit(PtrType pt) {
        int depth = pt.ptrDepth;
        if(pt.type().isA!FuncDecl) depth--;
        emit(pt.type());
        buf.add("*".repeat(depth));
    }
    void emit(TypeRef tr, bool isType) {
        if(!isType) {
            if(auto e = tr.type.as!Enum) {
                auto temp = e.name;
                e.name = tr.name;
                emit(e);
                e.name = temp;
                return;
            }
            if(auto sd = tr.type.as!StructDef) {
                auto temp = sd.name;
                sd.name = tr.name;
                emit(sd);
                sd.name = temp;
                return;
            }
            if(auto u = tr.type.as!Union) {
                auto temp = u.name;
                u.name = tr.name;
                emit(u);
                u.name = temp;
                return;
            }

            buf.add("alias %s = ", tr.name);
            emit(tr.type);
            buf.add(";\n");
        } else {
            if(tr.hasName()) {
                buf.add(tr.name);
            } else {
                emit(tr.type);
            }
        }
    }
    void emit(ArrayType at) {
        emit(at.type());

        // Note:
        //  Multidimensional arrays are reversed eg.
        //  float matrix[3][4] becomes float matrix[4][3]

        if(Var v = at.parent.as!Var) {
            if(FuncDecl fd = v.parent.as!FuncDecl) {

            } 
        }

        foreach_reverse(dim; at.dimensions()) {
            Number n = dim.as!Number;
            if(n && n.stringValue=="-1") {
                // Convert this into a ptr
                buf.add("*");
            } else {
                buf.add("[");
                //if(n && n.stringValue=="-1") {
                    // Don't emit empty array dimension
                //} else {
                    emit(dim);
                //}
                buf.add("]");
            }
        }
    }

    void emit(Enum e) {
        if(flag(Emitter.Flag.QUALIFIED_ENUM)) {
            // QUALIFIED enums
            buf.add("enum %s {\n", e.name);

            auto firstIdentifier = e.first().hasChildren() ? getDescendent!Identifier(e.first().first()) : null;
            // We need the type of this firstIdentifier if it is not null

            foreach(id; e.getIdentifiers()) {
                buf.add("\t%s", id.name);
                if(id.hasChildren()) {
                    buf.add(" = ");

                    if(firstIdentifier) {
                        //buf.add("cast(%s)(", firstIdentifier.type());
                    }
                    emit(id.first());
                    if(firstIdentifier) {
                        //buf.add(")");
                    }
                }
                buf.add(",\n");
            }
            buf.add("}\n");

            // Both QUALIFIED and UNQUALIFIED enums
            if(flag(Emitter.Flag.UNQUALIFIED_ENUM)) {
                buf.add("enum : %s {\n", e.name);
                foreach(id; e.getIdentifiers()) {
                    buf.add("\t%s = %s.%s,\n", id.name, e.name, id.name);
                }
                buf.add("}\n");
            }
        } else if(flag(Emitter.Flag.UNQUALIFIED_ENUM)) {
            // Only UNQUALIFIED enums
            buf.add("enum {\n");
            foreach(id; e.getIdentifiers()) {
                buf.add("\t%s", id.name);
                if(id.hasChildren()) {
                    buf.add(" = ");
                    emit(id.first());
                }
                buf.add(",\n");
            }
            buf.add("}\n");
        }
    }
    void emit(Union u) {
        if(u.hasName()) {
            buf.add("union %s {\n", u.name);
        } else {
            buf.add("union {\n");
        }
        string t = tab(u);
        foreach(v; u.vars()) {
            buf.add(t);
            emit(v);
        }
        buf.add("%s}\n", tab(u.parent));
    }
    void emit(FuncDef fd) {
        todo("Emit FuncDef not implemented");
    }
    void emit(FuncDecl fd, bool isType) {

        if(isType) {
            bool isVarType = fd.hasAncestor!Var;
            bool isParam = fd.parent.hasAncestor!FuncDecl;

            if(isParam) {

            } else if(isVarType) {
                buf.add("extern(C) ");
            } else if(fd.cconv == CConv.STDCALL) {
                buf.add("extern(Windows) ");
            } else {
                buf.add("extern(C) ");
            }
        }

        emit(fd.returnType());

        buf.add(" function(");
        foreach(i, v; fd.parameterVars()) {

            emit(v.type());

            if(ArrayType at = v.type().as!ArrayType) {
                if(!at.isPtr()) {
                    // Assume an array decays to a pointer argument
                    buf.add("*");
                }
            }

            buf.add(" %s", Emitter.dname(v.name));
            if(i < fd.numParameters-1) buf.add(", ");
        }
        if(fd.hasElipsis) {
            if(fd.numParameters>0) buf.add(", ");
            buf.add("...");
        }

        if(isType) {
            buf.add(") nothrow");
        } else {
            // declaration
            buf.add(")\n\t%s;\n\n", fd.name);
        }
        if(isType) {
            // Add a psuedo method for anything that looks like it should
            // be a struct method.
            // eg.
            // bool function(ImGuiTextFilter* self) ImGuiTextFilter_IsActive;
            //
            // pragma(inline,true) bool isActive(ImGuiTextFilter* self) {
            //    return ImGuiTextFilter_IsActive(self);
            // }
            //
            if(flag(Emitter.Flag.UFCS_STRUCT_METHODS) &&
                fd.numParameters > 0 &&
                fd.firstParameterType().isA!PtrType)
            {
                if(auto base = getStructDef(fd.firstParameterType())) {
                    if(fd.name.startsWith(base.name ~ "_")) {
                        emitter.addUFCS(fd);
                    }
                }
            }
        }
    }
    void emit(Var v) {

        emit(v.type());
        buf.add(" %s", Emitter.dname(v.name));
        if(v.hasInitialiser) {
            buf.add(" = ");
            emit(v.initialiser());
        }
        if(!v.type().isA!Union && !v.type().isA!StructDef) {
            buf.add(";\n");
        }
    }
    void emit(Identifier id) {
        buf.add(id.name);
    }
    void emit(Number n) {
        import std.string : toUpper;
        string s = n.stringValue;

        if(s.toUpper.endsWith("ULL")) {
            s = s[0..$-1];
        } 
        buf.add(s);
    }
    void emit(Binary b) {
        emit(b.left());
        buf.add(" %s ", stringOf(b.op));
        emit(b.right());
    }
    void emit(Unary u) {
        buf.add("%s", stringOf(u.op));
        emit(u.expr());
    }
    void emit(Parens p) {
        buf.add("(");
        emit(p.expr());
        buf.add(")");
    }
}

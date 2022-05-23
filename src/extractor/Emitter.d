module extractor.Emitter;

import ctools.all;
import extractor;

final class Emitter {
private:
    File file;
    Extractor extractor;
    string moduleName;
    Plugin[] plugins;
public:
    interface Plugin {
        void emit(File);
    }

    this(Extractor extractor) {
        this.extractor = extractor;
        this.moduleName = "emit";
    }
    auto add(Plugin plugin) {
        plugins ~= plugin;
        return this;
    }
    void emitTo(string filename) {
        this.file = File(filename, "wb");
        prolog();
        foreach(p; plugins) {
            p.emit(file);
        }
        foreach(tr; extractor.aliases) {
            emit(tr, false);
        }
        file.writeln();
        foreach(e; extractor.enums) {
            emit(e);
        }
        file.writeln();
        foreach(sd; extractor.structDefs) {
            emit(sd);
        }
        file.writeln();
        foreach(v; extractor.vars) {
            emit(v);
        }
        file.writeln();
        file.writefln("extern(Windows) { __gshared {");
        foreach(fd; extractor.funcDecls) {
            emit(fd, false);
        }
        file.writefln("}}");
        file.writeln();
        foreach(fd; extractor.funcDefs) {
            emit(fd);
        }
        epilog();
        file.close();
    }
private:
    void prolog() {
        file.writefln("module %s;\n",moduleName);
        file.writefln("public:\n");
    }
    void epilog() {

    }
    string dname(string name) {
        switch(name) {
            case "scope":
            case "module":
            case "version":
            case "out":
                return name ~ "_";
            default: return name;
        }
        assert(false);
    }
    void emit(Node n) {
        final switch(n.nid) with(Nid) {
            case VAR: emit(n.as!Var); break;
            case BINARY: emit(n.as!Binary); break;
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
            case UNARY:
            case INDEX:
            case MEMBER:
            case CALL:
            case CAST:
            case CHAR:
            case ADDRESSOF:
            case DEREF:
            case IF:
            case RETURN:
            case SCOPE:
            case TYPEDEF:
            case ROOT:
                throwIf(true, "Unhandled Node %s", n.nid);
                break;
        }
    }
    void emit(PrimitiveType t) {
        string s = t.unsigned ? "u" : "";
        switch(t.kind) with(TKind) {
            case BOOL: s = "bool"; break;
            case CHAR: s ~= "byte"; break;
            case SHORT: s ~= "short"; break;
            case INT: s ~= "int"; break;
            case LONG: s ~= "int"; break;
            case LONG_LONG: s ~= "long"; break;
            case FLOAT: s = "float"; break;
            case DOUBLE: s = "double"; break;
            case VOID: s = "void"; break;
            default: throwIf(true, "Unhandled PrimitiveType %s", t); break;
        }
        file.writef("%s", s);
    }
    void emit(PtrType pt) {
        int depth = pt.ptrDepth;
        if(pt.type().isA!FuncDecl) depth--;
        emit(pt.type());
        file.write("*".repeat(depth));
    }
    void emit(TypeRef tr, bool isType) {
        if(isType) {
            if(tr.hasName()) {
                file.write(tr.name);
            } else {
                emit(tr.type);
            }
        } else {
            if(auto e = tr.type.as!Enum) {
                e.name = tr.name;
                emit(e);
                return;
            }
            if(auto sd = tr.type.as!StructDef) {
                sd.name = tr.name;
                emit(sd);
                return;
            }

            file.writef("alias %s = ", tr.name);
            emit(tr.type);
            file.writeln(";");
        }
    }
    void emit(ArrayType at) {
        emit(at.type());
        foreach(dim; at.dimensions()) {
            file.write("[");
            emit(dim);
            file.write("]");
        }
    }
    void emit(Enum e) {
        file.writef("enum %s {\n", e.name);
        foreach(id; e.getIdentifiers()) {
            file.writef("\t%s", id.name);
            if(id.hasChildren()) {
                file.write(" = ");
                emit(id.first());
            }
            file.write(",\n");
        }
        file.write("}\n");
    }
    void emit(StructDef sd) {
        this.log("StructDef %s", sd.name);
        file.writefln("struct %s {", sd.name);
        foreach(st; sd.statements()) {
            file.write("\t");
            emit(st);
        }
        file.writeln("}");
    }
    void emit(Union u) {
        file.writefln("union %s {", u.name);
        foreach(v; u.vars()) {
            file.write("\t");
            emit(v);
        }
        file.write("}");
    }
    void emit(FuncDef fd) {
        todo("Emit FuncDef not implemented");
    }
    void emit(FuncDecl fd, bool isType) {
        emit(fd.returnType());
        file.write(" function(");

        foreach(i, v; fd.parameterVars()) {
            emit(v.type());
            file.writef(" %s", dname(v.name));
            if(i < fd.numParameters-1) file.write(", ");
        }
        if(fd.hasElipsis) {
            if(fd.numParameters>0) file.write(", ");
            file.write("...");
        }
        if(isType) {
            file.write(")");
        } else {
            file.writefln(") %s;", fd.name);
        }
    }
    void emit(Var v) {
        emit(v.type());
        file.writef(" %s", dname(v.name));
        if(v.hasInitialiser) {
            file.write(" = ");
            emit(v.initialiser());
        }
        file.writeln(";");
        this.log("end");
    }
    void emit(Identifier id) {
        file.write(id.name);
    }
    void emit(Number n) {
        file.write(n.stringValue);
    }
    void emit(Binary b) {
        emit(b.left());
        file.writef(" %s ", stringOf(b.op));
        emit(b.right());
    }
    void emit(Parens p) {
        file.write("(");
        emit(p.expr());
        file.write(")");
    }
}
module extractor.Emitter;

import ctools.all;
import extractor;

final class Emitter {
private:
    enum DEFAULT_FLAGS = Flag.QUALIFIED_ENUM;
    enum Stage { PLUGINS, ALIASES, ENUMS, STRUCT_DEFS, VARS, FUNC_DECLS, FUNC_DEFS }
    File file;
    Extractor extractor;
    string moduleName;
    Plugin[] plugins;
    Flag flags;
    Stage stage;
    string[] pvtImports;
    string[] pubImports;
    FuncDecl[] addUFCS;
public:
    interface Plugin {
        void emit(File);
    }
    enum Flag {
        NONE                = 0,
        QUALIFIED_ENUM      = 1<<0,
        UNQUALIFIED_ENUM    = 1<<1,
        UFCS_STRUCT_METHODS = 1<<2,
    }

    this(Extractor extractor, string moduleName, Flag flags = DEFAULT_FLAGS) {
        this.extractor = extractor;
        this.flags = flags;
        this.moduleName = moduleName;
    }
    auto add(Plugin plugin) {
        plugins ~= plugin;
        return this;
    }
    auto privateImports(string[] imports) {
        this.pvtImports = imports;
        return this;
    }
    auto publicImports(string[] imports) {
        this.pubImports = imports;
        return this;
    }
    void emitTo(string filename) {
        this.file = File(filename, "wb");
        prolog();
        stage = Stage.PLUGINS;
        foreach(p; plugins) {
            p.emit(file);
        }
        stage = Stage.ALIASES;
        foreach(tr; extractor.getOrderedValues(extractor.aliases)) {
            emit(tr, false);
        }
        file.writeln();
        stage = Stage.ENUMS;
        foreach(e; extractor.getOrderedValues(extractor.enums)) {
            emit(e);
        }
        file.writeln();
        stage = Stage.STRUCT_DEFS;
        foreach(sd; extractor.getOrderedValues(extractor.structDefs)) {
            emit(sd);
        }
        file.writeln();
        stage = Stage.VARS;
        foreach(v; extractor.getOrderedValues(extractor.vars)) {
            emit(v);
        }
        file.writeln();
        stage = Stage.FUNC_DECLS;
        file.writefln("extern(Windows) { __gshared {\n");
        foreach(fd; extractor.getOrderedValues(extractor.funcDecls)) {
            emit(fd, false);
        }
        file.writefln("}} // extern(Windows), __gshared");
        file.writeln();
        addUFCSStructMethods();
        stage = Stage.FUNC_DEFS;
        foreach(fd; extractor.getOrderedValues(extractor.funcDefs)) {
            emit(fd);
        }
        epilog();
        file.close();
    }
private:
    bool flag(Flag f) {
        return (flags&f) != 0;
    }
    string tab(Node n) {
        if(n.nid==Nid.STRUCTDEF || n.nid==Nid.UNION) {
            return tab(n.parent) ~ "\t";
        }
        if(n.nid==Nid.ROOT) {
            return "";
        }
        return tab(n.parent);
    }
    void prolog() {
        file.writefln("module %s;",moduleName);
        file.writeln();
        if(pvtImports.length>0) {
            file.writefln("private:");
            file.writeln();
            foreach(i; pvtImports) {
                file.writefln("import %s;", i);
            }
            file.writeln();
        }
        file.writefln("public:");
        if(pubImports.length>0) {
            file.writeln();
        }
        foreach(i; pubImports) {
            file.writefln("import %s;", i);
        }
        file.writeln();
    }
    void epilog() {

    }
    string dname(string name) {
        switch(name) {
            case "scope":
            case "module":
            case "version":
            case "out":
            case "ref":
            case "in":
            case "align":
            case "function":
                return name ~ "_";
            default: return name;
        }
        assert(false);
    }
    void addUFCSStructMethods() {
        import std.string : indexOf, toLower;
        if(addUFCS.length==0) return;

        file.writeln("// UFCS camel case struct methods");
        file.writeln("pragma(inline,true) {\n");

        foreach(fd; addUFCS) {
            auto us = fd.name.indexOf('_');
            string sub = toLower(fd.name[us+1]).as!char ~ fd.name[us+2..$];

            emit(fd.returnType());
            file.writef(" %s(", sub);

            foreach(i, v; fd.parameterVars()) {
                emit(v.type());
                file.writef(" %s", dname(v.name));
                if(i < fd.numParameters-1) file.write(", ");
            }
            if(fd.hasElipsis) {
                if(fd.numParameters>0) file.write(", ");
                file.write("...");
            }

            file.writefln(") {");
            if(!isVoidValue(fd.returnType())) {
                file.write("\treturn ");
            } else {
                file.write("\t");
            }
            file.writef("%s(", fd.name);
            foreach(i, v; fd.parameterVars()) {
                file.writef("%s", dname(v.name));
                if(i < fd.numParameters-1) file.write(", ");
            }
            file.writeln(");\n}");
        }
        file.writeln("} // pragma\n");
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
        if(flag(Flag.QUALIFIED_ENUM)) {
            // QUALIFIED enums
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

            // Both QUALIFIED and UNQUALIFIED enums
            if(flag(Flag.UNQUALIFIED_ENUM)) {
                file.writef("enum : %s {\n", e.name);
                foreach(id; e.getIdentifiers()) {
                    file.writefln("\t%s = %s.%s,", id.name, e.name, id.name);
                }
                file.write("}\n");
            }
        } else if(flag(Flag.UNQUALIFIED_ENUM)) {
            // Only UNQUALIFIED enums
            file.write("enum {\n");
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
    }
    void emit(StructDef sd) {
        file.writefln("struct %s {", sd.name);

        string t = tab(sd);
        foreach(st; sd.statements()) {
            file.write(t);
            emit(st);
        }
        file.writefln("%s}", tab(sd.parent));
    }
    void emit(Union u) {
        if(u.hasName()) {
            file.writefln("union %s {", u.name);
        } else {
            file.writeln("union {");
        }
        string t = tab(u);
        foreach(v; u.vars()) {
            file.write(t);
            emit(v);
        }
        file.writefln("%s}", tab(u.parent));
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
            file.writefln(")\n\t%s;\n", fd.name);
        }
        if(stage == Stage.FUNC_DECLS) {
            // Add a psuedo method for anything that looks like it should
            // be a struct method.
            // eg.
            // bool function(ImGuiTextFilter* self) ImGuiTextFilter_IsActive;
            //
            // pragma(inline,true) bool isActive(ImGuiTextFilter* self) {
            //    return ImGuiTextFilter_IsActive(self);
            // }
            //
            if(flag(Flag.UFCS_STRUCT_METHODS) &&
                fd.numParameters > 0 &&
                fd.firstParameterType().isA!PtrType)
            {
                if(auto base = getStructDef(fd.firstParameterType())) {
                    if(fd.name.startsWith(base.name ~ "_")) {
                        addUFCS ~= fd;
                    }
                }
            }
        }
    }
    void emit(Var v) {
        emit(v.type());
        file.writef(" %s", dname(v.name));
        if(v.hasInitialiser) {
            file.write(" = ");
            emit(v.initialiser());
        }
        if(!v.type().isA!Union && !v.type().isA!StructDef) {
            file.writeln(";");
        }
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
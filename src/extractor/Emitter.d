module extractor.Emitter;

import extractor.all;

final class Emitter {
private:
    File file;
    Extractor extractor;
    string moduleName;
public:
    this(Extractor extractor) {
        this.extractor = extractor;
        this.moduleName = "emit";
    }
    void emitTo(string filename) {
        this.file = File(filename, "wb");
        prolog();
        foreach(tr; extractor.aliases) {
            emit(tr);
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
        foreach(fd; extractor.funcDecls) {
            emit(fd);
        }
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
    }
    void epilog() {

    }
    void emit(Stmt stmt) {
        if(auto v = stmt.as!Var) {
            emit(v);
        } else {

            throwIf(true, "Unhandled emit %s", stmt);
        }
    }
    void emit(TypeRef tr) {
        file.writefln("alias %s = %s;", tr.name, convert(tr.type));
    }
    void emit(Enum e) {
        string s = "enum %s {\n".format(e.name);
        foreach(id; e.getIdentifiers()) {
            s ~= "\t%s".format(id.name);
            if(id.hasChildren()) {
                s ~= " = " ~ convert(id.first());
            }
            s ~= ",\n";
        }
        s ~= "}\n";
        file.write(s);
    }
    void emit(StructDef sd) {
        file.writefln("struct %s {", sd.name);
        foreach(st; sd.statements()) {
            file.write("\t");
            emit(st);
        }
        file.writeln("}");
    }
    void emit(FuncDef fd) {

    }
    void emit(FuncDecl fd) {

    }
    void emit(Var v) {
        file.writef("%s %s", convert(v.type()), v.name);
        if(v.hasInitialiser) {
            file.write(" = ");
            emit(v.initialiser());
        }
        file.writeln(";");
    }

    string convert(Node n) {
        if(auto nu = n.as!Number) return convert(nu);
        if(auto id = n.as!Identifier) return convert(id);
        throwIf(true, "Unhandled convert %s", n);
        return null;
    }
    string convert(Type t) {
        if(auto pt = t.as!PtrType) { return convert(pt); }
        if(auto pt = t.as!PrimitiveType) { return convert(pt); }
        if(auto tr = t.as!TypeRef) { return convert(tr); }
        if(auto fd = t.as!FuncDecl) { return convert(fd); }
        throwIf(true, "handle %s", t);
        return t.toString();
    }
    string convert(PtrType pt) {
        int depth = pt.ptrDepth;
        if(pt.type().isA!FuncDecl) depth--;
        return convert(pt.type()) ~ "*".repeat(depth);
    }
    string convert(TypeRef tr) {
        return tr.name;
    }
    /**
     * float function(int a) name;
     */
    string convert(FuncDecl fd) {
        string s = convert(fd.returnType()) ~ " function(";
        foreach(i, Var v; fd.parameterVars()) {
            if(i>0) s ~= ", ";
            s ~= convert(v.type());
            if(v.name) s ~= " " ~ v.name;
        }
        return s ~ ")";
    }
    string convert(PrimitiveType t) {
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
        return s;
    }
    string convert(Identifier id) {
        return id.name;
    }
    string convert(Number n) {
        return n.stringValue;
    }
}
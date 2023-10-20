module extractor.JavaEmitter;

import ctools.all;
import extractor;

final class JavaEmitter {
private:
    Extractor extractor;
    string packageName;

    Callback callback;
public:
    interface Callback {
        void begin();
        void structDef(StructDef sd);
        void enum_(Enum e);
        void func(FuncDecl fd);
        void union_(Union u);
        void end();
    }

    this(Extractor extractor, string packageName) {
        this.extractor = extractor;
        this.packageName = packageName;
    }
    auto withCallback(Callback c) {
        this.callback = c;
        return this;
    }
    void emit() {

        callback.begin();

        foreach(e; getOrderedValues(extractor.enums)) {
            emit(e);
        }

        foreach(u; extractor.unions) {
            emit(u);
        }

        foreach(sd; extractor.structDefs) {
            emit(sd);
        }

        foreach(fd; extractor.funcDecls) {
            emit(fd);
        }

        callback.end();
    }
    // static string dname(string name) {
    //     switch(name) {
    //         case "scope":
    //         case "module":
    //         case "version":
    //         case "out":
    //         case "ref":
    //         case "in":
    //         case "align":
    //         case "function":
    //         case "string":
    //             return name ~ "_";
    //         default: return name;
    //     }
    //     assert(false);
    // }
    void emit(Node n, StringBuffer buf = null) {
        //writefln("emit %s", n.nid);
        switch(n.nid) with(Nid) {
            case ENUM: callback.enum_(n.as!Enum); break;
            case STRUCTDEF: callback.structDef(n.as!StructDef); break;
            case FUNCDECL: callback.func(n.as!FuncDecl); break;
            case UNION: callback.union_(n.as!Union); break;

            case BINARY: emit(n.as!Binary, buf); break;
            case UNARY: emit(n.as!Unary, buf); break;
            case IDENTIFIER: emit(n.as!Identifier, buf); break;
            case NUMBER: emit(n.as!Number, buf); break;
            case PARENS: emit(n.as!Parens, buf); break;

            case PRIMITIVETYPE: emit(n.as!PrimitiveType, buf); break;
            case PTRTYPE: emit(n.as!PtrType, buf); break;
            case TYPEREF: emit(n.as!TypeRef, buf); break;
            case ARRAYTYPE: emit(n.as!ArrayType, buf); break;

            default:
                writefln("ignoring emit %s", n.nid);
                break;
        }
    }
private:
    //void emit(StructDef sd, StringBuffer buf) {
        //buf.add("struct %s {\n", sd.name);

        // string t;
        // foreach(st; sd.statements()) {
        //     buf.add(t);
        //     emit(st);
        // }
        //buf.add("}\n");

        // write to file here
    //}
    // void emit(Enum e, StringBuffer buf) {
    //     // Only UNQUALIFIED enums
    //     buf = enumBuf;
    //     foreach(id; e.getIdentifiers()) {
    //         assert(id.hasChildren());

    //         if(id.first().isA!Identifier) continue;

    //         buf.add("\tpublic static final int %s = ", id.name);
    //         emit(id.first(), buf);

    //         buf.add(";\n");
    //     }
    //     buf.add("\n");
    // }
    void emit(PrimitiveType t, StringBuffer buf) {
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
        buf.add("%s", s);
    }
    void emit(PtrType pt, StringBuffer buf) {
        int depth = pt.ptrDepth;
        if(pt.type().isA!FuncDecl) depth--;
        emit(pt.type(), buf);
        buf.add("*".repeat(depth));
    }
    void emit(TypeRef tr, StringBuffer buf) {
        if(tr.hasName()) {
            buf.add(tr.name);
        } else {
            emit(tr.type, buf);
        }
    }
    void emit(ArrayType at, StringBuffer buf) {
        emit(at.type(), buf);
        foreach(dim; at.dimensions()) {
            buf.add("[");
            Number n = dim.as!Number ;
            if(n && n.stringValue=="-1") {
                // Don't emit empty array dimension
            } else {
                emit(dim, buf);
            }
            buf.add("]");
        }
    }


    void emit(Identifier id, StringBuffer buf) {
        buf.add(id.name);
    }
    void emit(Number n, StringBuffer buf) {
        buf.add(n.stringValue);
    }
    void emit(Binary b, StringBuffer buf) {
        emit(b.left(), buf);
        buf.add(" %s ", stringOf(b.op));
        emit(b.right(), buf);
    }
    void emit(Unary u, StringBuffer buf) {
        buf.add("%s", stringOf(u.op));
        emit(u.expr(), buf);
    }
    void emit(Parens p, StringBuffer buf) {
        buf.add("(");
        emit(p.expr(), buf);
        buf.add(")");
    }
}

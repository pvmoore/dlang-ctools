module ctools.parse.ast.type.Type;

import ctools.all;

abstract class Type : Node {
public:
    TKind kind;
    bool isConst;
    bool isVolatile;

    final bool isVoid() { return kind == TKind.VOID; }
    final bool isFuncPtr() { return kind == TKind.FUNC && isPtr(); }

    bool isPtr() { return false; }
    bool isArray() { return false; }
    string getName() { return ""; }

    this(TKind kind) {
        this.kind = kind;
    }
}

FuncDecl getFuncDecl(Type t, bool includeTypeRefs) {
    PtrType pt = t.as!PtrType; if(pt) return getFuncDecl(pt.type(), includeTypeRefs);
    ArrayType at = t.as!ArrayType; if(at) return getFuncDecl(at.type(), includeTypeRefs);
    if(includeTypeRefs) {
        TypeRef tr = t.as!TypeRef; if(tr) return getFuncDecl(tr.type, includeTypeRefs);
    }
    FuncDecl fd = t.as!FuncDecl;
    return fd ? fd : null;
}

Type createTypeRefStripPtrAndArray(Type t) {
    if(t.isA!PtrType) {
        return createTypeRefStripPtrAndArray(t.as!PtrType.type());
    }
    if(t.isA!ArrayType) {
        return createTypeRefStripPtrAndArray(t.as!ArrayType.type());
    }
    return new TypeRef(t);
}
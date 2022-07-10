module ctools.parse.ast.type.Type;

import ctools.all;

abstract class Type : Node {
public:
    TKind kind;
    bool isConst;
    bool isVolatile;

    final bool isFuncPtr() { return kind == TKind.FUNC && isPtr(); }

    bool isPtr() { return false; }
    bool isArray() { return false; }
    string getName() { return ""; }

    this(TKind kind) {
        this.kind = kind;
    }
}

bool isVoidValue(Type t) {
    if(auto tr = t.as!TypeRef) return isVoidValue(tr.type);
    return t.kind == TKind.VOID && !t.isA!PtrType;
}

string fullString(Type t) {
    if(auto pt = t.as!PtrType) {
        return fullString(pt.type()) ~ pt.toString();
    }
    return t.toString();
}

bool isBuiltin(Type t) {
    if(t.isA!PrimitiveType) return true;
    if(t.isA!PtrType) return isBuiltin(t.as!PtrType.type());
    if(t.isA!TypeRef) return isBuiltin(t.as!TypeRef.type);
    return false;
}

Type getBaseType(Type t) {
    PtrType pt = t.as!PtrType; if(pt) return getBaseType(pt.type());
    TypeRef tr = t.as!TypeRef; if(tr) return getBaseType(tr.type);
    return t;
}

FuncDecl getFuncDecl(Type t, bool includeTypeRefs) {
    PtrType pt = t.as!PtrType; if(pt) return getFuncDecl(pt.type(), includeTypeRefs);
    ArrayType at = t.as!ArrayType; if(at) return getFuncDecl(at.type(), includeTypeRefs);
    if(includeTypeRefs) {
        TypeRef tr = t.as!TypeRef; if(tr) return getFuncDecl(tr.type, includeTypeRefs);
    }
    return t.as!FuncDecl;
}

StructDef getStructDef(Type t) {
    PtrType pt = t.as!PtrType; if(pt) return getStructDef(pt.type());
    TypeRef tr = t.as!TypeRef; if(tr) return getStructDef(tr.type);
    ArrayType at = t.as!ArrayType; if(at) return getStructDef(at.type());
    return t.as!StructDef;
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
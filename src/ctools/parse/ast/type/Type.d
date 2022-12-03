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

bool isEnum(Type t) {
    if(t.isA!Enum) return true;
    if(auto tr = t.as!TypeRef) return isEnum(tr.type);
    return false;
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

PtrType getPtrType(Type t) {
    if(auto pt = t.as!PtrType) return pt;
    if(auto tr = t.as!TypeRef) return getPtrType(tr.type);
    return null;
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

int size(Type t) {
    if(t.isA!PtrType) return 8;
    if(auto tr = t.as!TypeRef) return size(tr.type);

    if(auto array = t.as!ArrayType) {
        int s = size(array.type());
        // multiply by dimensions
        foreach(d; array.dimensions()) {
            if(Number n = d.as!Number) {
                import std;
                s *= n.stringValue.toLower().replace("u", "").to!int;
            } else throwIf(true, "Unsupported dimension type %s", d.nid);
        }
        return s;
    }

    final switch(t.kind) with(TKind) {
        case BOOL:
        case CHAR:
            return 1;
        case SHORT:
            return 2;
        case INT:
        case LONG:
        case FLOAT:
            return 4;
        case LONG_LONG:
        case DOUBLE:
            return 8;
        case FUNC:
        case FP:
        case ENUM:
            return 4;
        case UNION:
            return t.as!Union.vars().map!(it=>size(it.type)).maxElement();
        case STRUCT:
            return t.as!StructDef.variables().map!(it=>size(it.type)).sum();
        case VOID:
            throwIf(true, "Cannot size a void"); return 0;
    }
}
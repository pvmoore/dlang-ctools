module ctools.parse.ast.type.TKind;

import ctools.all;

enum TKind {
    BOOL,
    CHAR,       // signed
    SHORT,
    INT,
    LONG,
    LONG_LONG,  // __int64
    FLOAT,
    DOUBLE,
    STRUCT,
    FUNC,
    FP,
    ENUM,
    UNION,
    VOID
}

string stringOf(TKind k) {
    final switch(k) with(TKind) {
        case BOOL:  return "bool";
        case CHAR:  return "char";
        case SHORT:  return "short";
        case INT:  return "int";
        case LONG:  return "long";
        case LONG_LONG:  return "long long";
        case FLOAT:  return "float";
        case DOUBLE:  return "double";
        case STRUCT:  return "struct";
        case FUNC: return "func";
        case FP:  return "fp";
        case ENUM:  return "enum";
        case UNION: return "union";
        case VOID: return "void";
    }
}
module ctools.parse.ast.Type;

import ctools.all;

enum TKind {
    CHAR,
    SHORT,
    INT,
    LONG,
    LONG_LONG,
    FLOAT,
    DOUBLE,
    STRUCT,
    FP,
    ENUM,
    VOID
}

/**
 *
 *
 *
 */
abstract class Type : Node {
public:
    TKind kind;
    int ptrDepth;
}

final class PrimitiveType : Type {
public:
    bool unsigned;
}

final class TypedefType : Type {
public:
    Type decorated;
    string name;
}

final class Struct : Type {
public:
    string name;
    Var[] vars;
    Func[] funcs;
}

final class Enum : Type {
public:

}

final class FunctionPtr : Type {
public:

}
module ctools.parse.ast.Type;

import ctools.all;

enum TKind {
    CHAR,
    SHORT,
    INT,
    LONG,
    LONG_LONG,  // __int64
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

    this(TKind kind, int ptrDepth = 0) {
        this.kind = kind;
        this.ptrDepth = ptrDepth;
    }
}

final class PrimitiveType : Type {
public:
    bool unsigned;

    this(TKind k) {
        super(k);
    }
    auto setUnsigned() { this.unsigned = true; return this; }
}

final class TypedefType : Type {
public:
    Type decorated;
    string name;

    this(string name, Type decorated) {
        super(decorated.kind, decorated.ptrDepth);
        this.name = name;
        this.decorated = decorated;
    }
}

final class Struct : Type {
public:
    string name;
    Var[] vars;
    Func[] funcs;

    this(string name) {
        super(TKind.STRUCT);
        this.name = name;
    }
}

final class Enum : Type {
public:
    this() {
        super(TKind.ENUM);
    }
}

final class FunctionPtr : Type {
public:
    this() {
        super(TKind.FP, 1);
    }
}
module ctools.parse.ast.Type;

import ctools.all;

enum TKind {
    BOOL,
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
    Metadata meta;

    this(TKind kind, Metadata meta, int ptrDepth = 0) {
        this.kind = kind;
        this.meta = meta;
        this.ptrDepth = ptrDepth;
    }
}

final class PrimitiveType : Type {
public:
    bool unsigned;

    this(TKind k, Metadata meta) {
        super(k, meta);
    }
    auto setUnsigned() { this.unsigned = true; return this; }
}

final class TypedefType : Type {
public:
    Type decorated;
    string name;

    this(Metadata meta, string name, Type decorated) {
        super(decorated.kind, meta, decorated.ptrDepth);
        this.name = name;
        this.decorated = decorated;
    }
}

final class Struct : Type {
public:
    string name;
    Var[] vars;
    Func[] funcs;

    this(Metadata meta, string name) {
        super(TKind.STRUCT, meta);
        this.name = name;
    }
}

final class Enum : Type {
public:
    this(Metadata meta) {
        super(TKind.ENUM, meta);
    }
}

final class FunctionPtr : Type {
public:
    this(Metadata meta) {
        super(TKind.FP, meta, 1);
    }
}
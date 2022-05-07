module ctools.parse.ast.type.PtrType;

import ctools.all;

/**
 *  PtrType
 *      Type
 */
final class PtrType : Type {
private:
public:
    int ptrDepth;
    bool toConst;

    override bool isPtr() { return true; }
    override bool isArray() { return type().isArray(); }
    override string getName() { return type().getName(); }

    Type type() { return first().as!Type; }

    this(TKind kind, int ptrDepth) {
        super(kind);
        this.ptrDepth = ptrDepth;
    }
    override string toString() {
        return "%s%s".format(repeat("*", ptrDepth), toConst ? " const" : "");
    }
}
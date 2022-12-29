module ctools.parse.ast.type.PrimitiveType;

import ctools.all;

final class PrimitiveType : Type {
public:
    bool unsigned;

    this(TKind k) {
        super(k);
        this.nid = Nid.PRIMITIVETYPE;
    }
    override int alignment() {
        switch(kind) with(TKind) {
            case BOOL:
            case CHAR:
                return 1;
            case SHORT:
                return 2;
            case LONG_LONG:
            case DOUBLE:
                return 8;
            default:
                return 4;
        }
    }
    override int size() {
        switch(kind) with(TKind) {
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
            default:
                return 0;
        }
    }
    override string toString() {
        return "%s%s".format(unsigned ? "unsigned " : "", stringOf(kind));
    }
}
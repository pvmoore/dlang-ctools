module ctools.parse.ast.type.PrimitiveType;

import ctools.all;

final class PrimitiveType : Type {
public:
    bool unsigned;

    this(TKind k) {
        super(k);
        this.nid = Nid.PRIMITIVETYPE;
    }
    override string toString() {
        return "%s%s".format(unsigned ? "unsigned " : "", stringOf(kind));
    }
}
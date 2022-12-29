module ctools.parse.ast.type.ArrayType;

import ctools.all;

/**
 *  Array
 *      Type
 *      { Expr } (dimension(s))
 */
final class ArrayType : Type {
private:
public:
    Type type() { return first().as!Type; }
    Expr[] dimensions() { return children[1..$].as!(Expr[]); }

    override bool isPtr() { return type().isPtr(); }
    override bool isArray() { return true; }
    override string getName() { return type().getName(); }
    override int alignment() { return type().alignment(); }
    override int size() {
        int s = type().size();
        // multiply by dimensions
        foreach(d; dimensions()) {
            if(Number n = d.as!Number) {
                import std;
                s *= n.stringValue.toLower().replace("u", "").to!int;
            } else throwIf(true, "Unsupported dimension type %s", d.nid);
        }
        return s;
    }

    this(TKind kind) {
        super(kind);
        this.nid = Nid.ARRAYTYPE;
    }
    override string toString() {
        return "%s".format(repeat("[]", numChildren()-1));
    }
}
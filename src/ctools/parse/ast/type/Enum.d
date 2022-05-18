module ctools.parse.ast.type.Enum;

import ctools.all;

/**
 *  Enum [name]             // optional name
 *      Identifier          // 0 or more Identifiers with or with an expression
 *          Expression
 */
final class Enum : Type {
public:
    string name;

    override string getName() { return name ? name : ""; }

    Identifier[] getIdentifiers() {
        return children.as!(Identifier[]);
    }

    this(string name) {
        super(TKind.ENUM);
        this.nid = Nid.ENUM;
        this.name = name;
    }
    override string toString() {
        return "enum%s".format(name?" " ~ name:"");
    }
}
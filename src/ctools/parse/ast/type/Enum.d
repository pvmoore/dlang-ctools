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

    this(string name) {
        super(TKind.ENUM);
        this.name = name;
    }
    override string toString() {
        return "enum%s".format(name?" " ~ name:"");
    }
}
module ctools.parse.ast.expr.Identifier;

import ctools.all;

/**
 *  Identifier
 */
final class Identifier : Expr {
public:
    string name;

    this(string name) {
        this.name = name;
    }

    override int precedence() { return 16; }

    override string toString() {
        return "Identifier '%s'".format(name);
    }
}
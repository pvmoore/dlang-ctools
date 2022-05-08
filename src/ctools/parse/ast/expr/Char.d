module ctools.parse.ast.expr.Char;

import ctools.all;

/**
 *  Char
 */
final class Char : Expr {
private:

public:
    string stringValue;

    this() {
        this.nid = Nid.CHAR;
    }

    override int precedence() { return 16; }

    override string toString() {
        return "Char (%s)".format(stringValue);
    }
}
module ctools.parse.ast.expr.Binary;

import ctools.all;

/**
 *  Binary
 *      Expression
 *      Expression
 */
final class Binary : Expr {
private:

public:
    Operator op;

    this() {
        this.nid = Nid.BINARY;
    }

    override int precedence() { return precedenceOf(op); }

    override string toString() {
        return "Binary %s".format(op);
    }
}
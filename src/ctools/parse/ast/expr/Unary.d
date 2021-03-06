module ctools.parse.ast.expr.Unary;

import ctools.all;

/**
 *  Unary
 *      Expression
 */
final class Unary : Expr {
private:

public:
    Operator op;

    this() {
        this.nid = Nid.UNARY;
    }

    Expr expr() { return first().as!Expr; }

    override int precedence() { return precedenceOf(op); }

    override string toString() {
        return "Unary %s".format(op);
    }
}
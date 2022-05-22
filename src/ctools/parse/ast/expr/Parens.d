module ctools.parse.ast.expr.Parens;

import ctools.all;

/**
 *  Parens
 *      Expr
 */
final class Parens : Expr {
private:

public:
    this() {
        this.nid = Nid.PARENS;
    }

    Expr expr() { return first().as!Expr; }

    override int precedence() { return 16; }

    override string toString() {
        return "Parens";
    }
}
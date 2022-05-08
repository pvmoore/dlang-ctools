module ctools.parse.ast.expr.Parens;

import ctools.all;

final class Parens : Expr {
private:

public:
    this() {
        this.nid = Nid.PARENS;
    }

    override int precedence() { return 16; }

    override string toString() {
        return "Parens";
    }
}
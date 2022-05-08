module ctools.parse.ast.expr.Cast;

import ctools.all;

/**
 *  Cast
 *      Type
 *      Expr
 */
final class Cast : Expr {
private:

public:
    this() {
        this.nid = Nid.CAST;
    }

    override int precedence() { return 2; }

    override string toString() {
        return "Cast";
    }
}
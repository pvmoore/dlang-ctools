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

    override int precedence() { return 2; }

    override string toString() {
        return "Cast";
    }
}
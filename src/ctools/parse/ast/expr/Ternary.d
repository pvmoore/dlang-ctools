module ctools.parse.ast.expr.Ternary;

import ctools.all;

/**
 *  Ternary
 *      Expr (condition)
 *      Expr (then)
 *      Expr (else)
 */
final class Ternary : Expr {
private:
public:

    override int precedence() { return 13; }

    override string toString() {
        return "Ternary";
    }
}
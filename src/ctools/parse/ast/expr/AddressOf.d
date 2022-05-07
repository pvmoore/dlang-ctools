module ctools.parse.ast.expr.AddressOf;

import ctools.all;

/**
 *  AddressOf
 *      Expr
 */
final class AddressOf : Expr {
private:

public:

    override int precedence() { return 2; }

    override string toString() {
        return "AddressOf";
    }
}
module ctools.parse.ast.expr.Deref;

import ctools.all;

/**
 *  ValueOf
 *      Expr
 */
final class Deref : Expr {
private:

public:
    this() {
        this.nid = Nid.DEREF;
    }

    override int precedence() { return 2; }

    override string toString() {
        return "Deref";
    }
}
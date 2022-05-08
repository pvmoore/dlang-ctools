module ctools.parse.ast.expr.Index;

import ctools.all;

/**
 *  Index
 *      Expr
 *      Expression (the index)
 */
final class Index : Expr {
private:

public:
    this() {
        this.nid = Nid.INDEX;
    }

    override int precedence() { return 1; }

    override string toString() {
        return "Index";
    }
}
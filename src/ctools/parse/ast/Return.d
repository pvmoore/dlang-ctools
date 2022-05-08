module ctools.parse.ast.Return;

import ctools.all;

/**
 *  Return
 *      Expression  (optional)
 */
final class Return : Stmt {
private:

public:
    bool hasExpr() { return hasChildren(); }

    this() {
        this.nid = Nid.RETURN;
    }

    override string toString() {
        return "Return";
    }
}
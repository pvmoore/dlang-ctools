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

    override string toString() {
        return "Return";
    }
}
module ctools.parse.ast.If;

import ctools.all;

/**
 *  If
 *      Expression  (condition)
 *      { Stmt }    (then body)
 *      { Stmt }    (else body)
 */
final class If : Stmt {
private:

public:
    int elseStmtIndex = -1;

    bool hasElse() { return elseStmtIndex!=-1; }

    override string toString() {
        return "If";
    }
}
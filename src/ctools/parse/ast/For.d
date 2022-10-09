module ctools.parse.ast.For;

import ctools.all;

/**
 *  For
 *      { Var }             (INITS)
 *      [ Expression ]      (COND)
 *      { Expression }      (PEXPRS)
 *      { Stmt }            (BODY)
 */
final class For : Stmt {
private:

public:
    int condOffset;
    int pexprsOffset;
    int bodyOffset;

    bool hasInitialisers() { return condOffset != 0; }
    bool hasCondition() { return pexprsOffset != condOffset; }
    bool hasPostExpressions() { return bodyOffset != pexprsOffset; }

    Stmt[] inits() { return children[0..condOffset].as!(Stmt[]); }
    Expr cond() { return hasCondition() ? children[condOffset].as!Expr : null; }
    Expr[] pexprs() { return children[pexprsOffset..bodyOffset].as!(Expr[]); }
    Stmt[] body_() { return children[bodyOffset..$].as!(Stmt[]); }

    this() {
        this.nid = Nid.FOR;
    }

    override string toString() {
        return "For";
    }
}

module ctools.parse.ast.expr.Member;

import ctools.all;

/**
 *  Member
 *      Expr
 *      Expr
 */
final class Member : Expr {
private:

public:
    bool isArrow;   // ->

    Expr left() { return first().as!Expr; }
    Expr right() { return last().as!Expr; }

    override int precedence() { return 1; }

    override string toString() {
        return "Member (%s)".format(isArrow ? "->":".");
    }
}
module ctools.parse.ast.expr.Call;

import ctools.all;

/**
 *  Call
 *      { Expression } (args)
 */
final class Call : Expr {
private:

public:
    string name;

    override int precedence() { return 1; }

    override string toString() {
        return "Call %s".format(name);
    }
}
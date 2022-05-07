module ctools.parse.ast.expr.String;

import ctools.all;

/**
 *  String
 */
final class String : Expr {
private:

public:
    string stringValue;

    override int precedence() { return 16; }

    override string toString() {
        return "String (%s)".format(stringValue);
    }
}
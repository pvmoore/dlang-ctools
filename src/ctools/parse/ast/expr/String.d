module ctools.parse.ast.expr.String;

import ctools.all;

/**
 *  String
 */
final class String : Expr {
private:

public:
    string stringValue;

    this() {
        this.nid = Nid.STRING;
    }

    override int precedence() { return 16; }

    override string toString() {
        return "String (%s)".format(stringValue);
    }
}
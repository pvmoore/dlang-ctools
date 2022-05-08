module ctools.parse.ast.expr.Number;

import ctools.all;

/**
 *  Number
 */
final class Number : Expr {
private:

public:
    string stringValue;

    this() {
        this.nid = Nid.NUMBER;
    }

    Number withValue(string value) {
        this.stringValue = value;
        return this;
    }

    override int precedence() { return 16; }

    override string toString() {
        return "Number (%s)".format(stringValue);
    }
}
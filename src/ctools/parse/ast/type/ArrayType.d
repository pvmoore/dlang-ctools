module ctools.parse.ast.type.ArrayType;

import ctools.all;

/**
 *  Array
 *      Type
 *      { Expr } (dimenion(s)) 
 */
final class ArrayType : Type {
private:
public:

    Type type() { return first().as!Type; }

    override bool isPtr() { return type().isPtr(); }
    override bool isArray() { return true; }
    override string getName() { return type().getName(); }

    this(TKind kind) {
        super(kind);
    }
    override string toString() {
        return "%s".format(repeat("[]", numChildren()-1));
    }
}
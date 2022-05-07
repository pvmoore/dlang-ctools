module ctools.parse.ast.Typedef;

import ctools.all;

/**
 *  https://www.tutorialspoint.com/cprogramming/c_typedef.htm
 *
 *  'typedef' TYPE NAME ';'
 *
 *  TypeDef
 *      Type - underlying type
 */
final class Typedef : Stmt {
public:
    string name;

    Type type() {
        return first().as!Type;
    }

    override string toString() {
        return "Typedef '%s'".format(name);
    }
}
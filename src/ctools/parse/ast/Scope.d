module ctools.parse.ast.Scope;

import ctools.all;

/**
 *  Scope
 *      { Stmt }
 */
final class Scope : Stmt {
public:
    override string toString() {
        return "Scope";
    }
}
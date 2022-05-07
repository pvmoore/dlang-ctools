module ctools.parse.ast.type.FuncDef;

import ctools.all;

/**
 *  FuncDef
 *      FuncDecl    - the declaration
 *      { Stmt }    - body
 */
final class FuncDef : Stmt {
public:

    string getName() { return first().as!FuncDecl.name; }

    override string toString() {
        return "FuncDef";
    }
}
module ctools.parse.ast.type.FuncDef;

import ctools.all;

/**
 *  FuncDef
 *      FuncDecl    - the declaration
 *      { Stmt }    - body
 */
final class FuncDef : Stmt {
public:
    this() {
        this.nid = Nid.FUNCDEF;
    }

    string getName() { return first().as!FuncDecl.name; }

    override string toString() {
        return "FuncDef";
    }
}
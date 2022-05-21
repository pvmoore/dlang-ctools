module ctools.parse.ast.FuncDef;

import ctools.all;

/**
 *  FuncDef
 *      { Stmt }    - body
 */
final class FuncDef : Stmt {
public:
    this() {
        this.nid = Nid.FUNCDEF;
    }

    string getName() {
        throwIf(parent.as!FuncDecl is null);
        return parent.as!FuncDecl.name;
    }

    override string toString() {
        return "FuncDef";
    }
}
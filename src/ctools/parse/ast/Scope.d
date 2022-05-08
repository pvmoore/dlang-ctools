module ctools.parse.ast.Scope;

import ctools.all;

/**
 *  Scope
 *      { Stmt }
 */
final class Scope : Stmt {
public:

    this(bool isRoot = false) {
        this.nid = isRoot ? Nid.ROOT : Nid.SCOPE;
    }

    override string toString() {
        return nid==Nid.ROOT ? "Parent" : "Scope";
    }
}
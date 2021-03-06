module ctools.parse.ast.type.Union;

import ctools.all;

/**
 *  Union
 *      { Var }
 */
final class Union : Type {
public:
    string name;

    bool hasName() { return name !is null; }
    override string getName() { return name ? name : ""; }

    Var[] vars() { return children.as!(Var[]); }

    this() {
        super(TKind.UNION);
        this.nid = Nid.UNION;
    }
    override string toString() {
        return "union%s".format(name?" " ~ name:"");
    }
}
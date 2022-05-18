module ctools.parse.ast.type.StructDef;

import ctools.all;

/**
 * StructDef
 *      { Stmt } - Var|Func|Enum
 */
final class StructDef : Type {
public:
    string name;

    bool hasName() { return name !is null; }
    Stmt[] statements() { return children.as!(Stmt[]); }

    override string getName() { return name ? name : ""; }

    this() {
        super(TKind.STRUCT);
        this.nid = Nid.STRUCTDEF;
    }
    override string toString() {
        return "struct%s".format(name?" " ~ name:"");
    }
}
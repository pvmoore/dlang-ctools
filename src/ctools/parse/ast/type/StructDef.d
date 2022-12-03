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
    bool hasBody() { return hasChildren(); }
    Stmt[] statements() { return children.as!(Stmt[]); }
    Var[] variables() { return children.filter!(it=>it.isA!Var).map!(it=>it.as!Var).array; }

    bool hasVariable(string name) {
        return !variables().filter!(it=>it.name==name).empty();
    }

    override string getName() { return name ? name : ""; }

    this() {
        super(TKind.STRUCT);
        this.nid = Nid.STRUCTDEF;
    }
    override string toString() {
        return "struct%s".format(name?" " ~ name:"");
    }
}
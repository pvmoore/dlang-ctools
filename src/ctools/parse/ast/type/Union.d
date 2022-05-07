module ctools.parse.ast.type.Union;

import ctools.all;

final class Union : Type {
public:
    string name;

    bool hasName() { return name !is null; }
    override string getName() { return name ? name : ""; }

    this() {
        super(TKind.UNION);
    }
    override string toString() {
        return "union%s".format(name?" " ~ name:"");
    }
}
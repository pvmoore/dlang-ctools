module ctools.parse.ast.type.TypeRef;

import ctools.all;

final class TypeRef : Type {
private:
public:
    Type type;
    string name;

    bool hasName() { return name !is null; }
    override bool isPtr() { return type.isPtr(); }
    override bool isArray() { return type.isArray(); }
    override string getName() { return name; }
    override int alignment() { return type.alignment(); }
    override int size() { return type.size(); }

    this(Type type, string name = null) {
        super(type.kind);
        this.nid = Nid.TYPEREF;
        this.type = type;
        this.name = name;
    }
    override string toString() {
        return name ? "%s (= %s)".format(name, fullString(type)) : fullString(type);
    }
}
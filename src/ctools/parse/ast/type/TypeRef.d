module ctools.parse.ast.type.TypeRef;

import ctools.all;

final class TypeRef : Type {
private:
public:
    Type type;
    string name;

    override bool isPtr() { return type.isPtr(); }
    override bool isArray() { return type.isArray(); }
    override string getName() { return name; }

    this(Type type, string name = null) {
        super(type.kind);
        this.type = type;
        this.name = name;
    }
    override string toString() {
        return name ? name : type.toString();
    }
}
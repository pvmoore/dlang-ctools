module ctools.parse.ast.Node;

import ctools.all;

class Node {
public:
    bool isRoot;
    Node parent;
    Node[] children;

    final Node add(Node child) {
        detach(child);
        children ~= child;
        return this;
    }
    final void detach(Node child) {
        if(child.parent) {
            child.parent.children.removeAt(child.index());
            child.parent = null;
        }
    }
    final bool hasChildren() {
        return children.length > 0;
    }
    final Node first() {
        return children[0];
    }
    final Node last() {
        return children[$-1];
    }
    final int index() {
        throwIf(!parent);
        return parent.indexOf(this);
    }
    final int indexOf(Node child) {
        return children.indexOf(child);
    }
    final Typedef findTypedef(string name) {
        if(isRoot) return null;
        auto td = this.as!Typedef;
        if(td && td.name==name) return td;
        return up().findTypedef(name);
    }
    final Node up() {
        int i = index();
        if(i==0) {
            return parent;
        }
        return parent.children[i-1];
    }
}
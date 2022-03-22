module ctools.parse.ast.Node;

import ctools.all;

class Node {
public:
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
    final int index() {
        throwIf(!parent);
        return parent.indexOf(this);
    }
    final int indexOf(Node child) {
        return children.indexOf(child);
    }
}
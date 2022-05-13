module ctools.parse.ast.Node;

import ctools.all;

enum Nid {
    ROOT,
    IF, RETURN, SCOPE, TYPEDEF, VAR,
    ADDRESSOF, BINARY, CALL, CAST, CHAR, DEREF, IDENTIFIER, INDEX, MEMBER, NUMBER,
    PARENS, STRING, TERNARY, UNARY,
    ARRAYTYPE, ENUM, FUNCDECL, FUNCDEF, PRIMITIVETYPE, PTRTYPE, STRUCTDEF, TYPEREF, UNION
}

__gshared int uids = 0;

abstract class Node {
public:
    Nid nid;    // node type id
    int uid;    // unique id
    Node parent;
    Node[] children;

    this() {
        this.uid = uids++;
    }

    final Node add(Node child) {
        detach(child);
        child.parent = this;
        children ~= child;
        return this;
    }
    final Node addToFront(Node child) {
        detach(child);
        child.parent = this;
        children.insertAt(0, child);
        return this;
    }
    final void detach(Node child) {
        if(child.parent) {
            child.parent.children.removeAt(child.index());
            child.parent = null;
        }
    }
    final bool hasChildren() { return children.length > 0; }
    final int numChildren() { return children.length.as!int; }
    final Node first() { return children[0]; }
    final Node last() { return children[$-1]; }
    final Node lastChildOrSelf() { return hasChildren() ? last() : this; }
    final Node getRoot() { if(parent) return parent.getRoot(); return this; }

    final int index() {
        throwIf(!parent);
        return parent.indexOf(this);
    }
    final int indexOf(Node child) {
        return children.indexOf(child);
    }
    final void iterate(void delegate(Node n) functor) {
        functor(this);
        foreach(ch; children) {
            ch.iterate(functor);
        }
    }
    final Node up() {
        int i = index();
        if(i==0) {
            return parent;
        }
        return parent.children[i-1];
    }
    final void dump(string indent = "") {
        writefln("%s%s", indent, this);
        foreach(ch; children) {
            ch.dump(indent ~ "  ");
        }
    }
    final string dumpToString(string indent = "") {
        string s = "%s%s\n".format(indent, this);
        foreach(ch; children) {
            s ~= ch.dumpToString(indent ~ "  ");
        }
        return s;
    }
}

Typedef findTypedef(Node node, string name) {

    while(node.parent) {
        auto td = node.as!Typedef;
        if(td && td.name==name) return td;

        node = node.up();
    }
    return null;
}

Node findNode(Node node, bool delegate(Node n) filter) {
    if(filter(node)) return node;
    if(node.parent is null) return null;
    return findNode(node.up(), filter);
}
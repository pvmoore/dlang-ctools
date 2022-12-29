module ctools.parse.ast.type.Union;

import ctools.all;

/**
 *  Union
 *      { Var }
 */
final class Union : Type {
private:
    int size_;
public:
    string name;

    bool hasName() { return name !is null; }
    override string getName() { return name ? name : ""; }

    Var[] vars() { return children.as!(Var[]); }

    bool hasVariable(string name) {
        return !vars().filter!(it=>it.name==name).empty();
    }

    Var largestMember() {
        Var vv;
        int largest = 0;
        foreach(v; vars()) {
            auto sz = v.type().size();
            if(sz > largest) {
                largest = sz;
                vv = v;
            }
        }
        return vv;
    }

    /**
     * The alignment of the largest member
     */
    override int alignment() {
        return vars().map!(v=>v.type().alignment()).maxElement();
    }
    override int size() {
        calculateSize();
        return size_;
    }

    this() {
        super(TKind.UNION);
        this.nid = Nid.UNION;
    }
    override string toString() {
        return "union%s".format(name?" " ~ name:"");
    }
private:
    void calculateSize() {
        if(size_ > 0) return;

        auto align_ = alignment();
        auto largest = vars().map!(it=>it.type.size()).maxElement();

        auto and = align_-1;
        this.size_ = (largest + and) & ~and;
    }
}
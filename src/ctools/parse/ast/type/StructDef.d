module ctools.parse.ast.type.StructDef;

import ctools.all;

/**
 * StructDef
 *      { Stmt } - Var|Func|Enum
 */
final class StructDef : Type {
private:
    int[] offsets;
    int size_;
public:
    string name;

    bool hasName() { return name !is null; }
    bool hasBody() { return hasChildren(); }
    int numMembers() { return numChildren; }
    Stmt[] statements() { return children.as!(Stmt[]); }
    Var[] variables() { return children.filter!(it=>it.isA!Var).map!(it=>it.as!Var).array; }

    bool hasVariable(string name) {
        return !variables().filter!(it=>it.name==name).empty();
    }

    int offsetOfMember(int memberIndex) {
        calculateOffsets();
        throwIf(memberIndex >= offsets.length, "Out of bounds %s >= %s", memberIndex, offsets.length);
        return offsets[memberIndex];
    }

    override string getName() { return name ? name : ""; }

    /**
     * The alignment of the largest member (max 8).
     */
    override int alignment() {
        if(!hasChildren()) return 0;
        return variables().map!(v=>v.type().alignment()).maxElement();
    }
    override int size() {
        calculateOffsets();
        return size_;
    }

    this() {
        super(TKind.STRUCT);
        this.nid = Nid.STRUCTDEF;
    }
    override string toString() {
        return "struct%s".format(name?" " ~ name:"");
    }
private:
    void calculateOffsets() {
        if(offsets.length > 0) return;

        int offset = 0;
        int rem = 0;
        int align_ = 0;

        foreach(v; variables()) {
            align_ = v.type().alignment();

            rem = offset & (align_>>>1);
            offset += rem;

            this.offsets ~= offset;

            offset += v.type().size();
        }

        // Pad the struct to the size of the largest member
        align_ = alignment();
        rem = offset & (align_>>>1);
        offset += rem;

        this.size_ = offset;
    }
}
module ctools.parse.ast.type.FuncDecl;

import ctools.all;

/**
 *  FuncDef
 *      Type        - return type
 *      { Var }     - parameters (numParams)
 */
final class FuncDecl : Type {
public:
    string name;
    CConv cconv = CConv.CDECL;
    bool hasElipsis;            // varargs
    bool isStatic;
    bool isExtern;

    override string getName() { return name; }

    Type returnType() {
        return first().as!Type;
    }
    Type[] parameters() {
        return children[1..$].map!(it=>it.as!Var.type()).array;
    }

    this() {
        super(TKind.FUNC);
    }

    override string toString() {
        return "FuncDecl %s".format(name);
    }
}
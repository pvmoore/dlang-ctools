module ctools.parse.ast.type.FuncDecl;

import ctools.all;

/**
 *  FuncDecl
 *      Type        - return type
 *      { Var }     - parameters (numParameters)
 *      [ FuncDef ] - Body if there is one
 */
final class FuncDecl : Type {
public:
    string name;
    CConv cconv = CConv.CDECL;
    bool hasElipsis;            // varargs
    bool isStatic;
    bool isExtern;
    bool isDefinition;          // true if there is a body
    int numParameters;

    override string getName() { return name; }

    Type returnType() {
        return first().as!Type;
    }
    Type firstParameterType() {
        return children[1].as!Var.type();
    }
    Type[] parameterTypes() {
        return children[1..numParameters+1]
                .map!(it=>it.as!Var.type()).array;
    }
    Var[] parameterVars() {
        return children[1..numParameters+1]
                .map!(it=>it.as!Var).array;
    }
    FuncDef definition() {
        throwIf(!isDefinition);
        return last().as!FuncDef;
    }

    this() {
        super(TKind.FUNC);
        this.nid = Nid.FUNCDECL;
    }

    override string toString() {
        return "FuncDecl %s".format(name);
    }
}
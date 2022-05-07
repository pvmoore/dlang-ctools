module ctools.parse.ast.Var;

import ctools.all;

/**
 *  Var
 *      Type
 *      [ Bitfield Expr ]   // if bitfield is specified
 *      [ Expr ]            // initialiser
 *
 * TYPE NAME [ ':' Bitfield Expr ] [ '=' Expr ]';'
 */
final class Var : Stmt {
public:
    string name;
    bool hasBitfieldBits;   // set if this declaration has a bitfield value eg. int name : 1;

    Type type() { return first().as!Type; }
    Expr bitfield() { return children[1].as!Expr; }
    Expr initialiser() { return last().as!Expr; }

    override string toString() {
        string b = hasBitfieldBits ? " : BITFIELD" : "";
        return "Var%s%s".format(name ? " " ~ name : "", b);
    }
}
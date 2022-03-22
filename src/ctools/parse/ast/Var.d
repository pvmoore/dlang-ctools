module ctools.parse.ast.Var;

import ctools.all;

/**
 * TYPE NAME ';'
 */
final class Var : Stmt {
public:
    Type type;
    string name;


}
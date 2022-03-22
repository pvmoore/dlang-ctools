module ctools.parse.ast.Expr;

import ctools.all;

abstract class Expr : Stmt {

    abstract int precedence();
}

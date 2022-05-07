module ctools.parse.Operator;

import ctools.all;

enum Operator {
    PLUS_PLUS_S,    // ++ suffix
    MINUS_MINUS_S,  // -- suffix
    FUNC_CALL,      // ()
    ARRAY_INDEX,    // []
    DOT,            // .
    RT_ARROW,       // ->

    PLUS_PLUS_P,    // ++ prefix
    MINUS_MINUS_P,  // -- prefix
    UNARY_PLUS,     // -
    UNARY_MINUS,    // +
    BOOL_NOT,       // !
    BIT_NOT,        // ~
    ADDRESS_OF,     // &

    MUL,            // *
    DIV,            // /
    MOD,            // %

    ADD,            // +
    SUB,            // -

    SHL,            // <<
    SHR,            // >>

    LT,             // <
    LTE,            // <=
    GT,             // >
    GTE,            // >=

    EQ,             // ==
    NEQ,            // !=

    BIT_AND,        // &

    BIT_XOR,        // ^

    BIT_OR,         // |

    BOOL_AND,       // &&

    BOOL_OR,        // ||

    TERNARY,        // ?:

    ASSIGN,         // =
    ADD_ASSIGN,     // +=
    SUB_ASSIGN,     // -=
    MUL_ASSIGN,     // *=
    DIV_ASSIGN,     // /=
    MOD_ASSIGN,     // %=
    SHL_ASSIGN,     // <<=
    SHR_ASSIGN,     // >>=
    AND_ASSIGN,     // &=
    XOR_ASSIGN,     // ^=
    OR_ASSIGN,      // |=

    COMMA           // ,
}

/**
 *  Lower numbers have higher precedence.
 */
int precedenceOf(Operator op) {
    final switch(op) with(Operator) {
        case PLUS_PLUS_S:
        case MINUS_MINUS_S:
        case FUNC_CALL:
        case ARRAY_INDEX:
        case DOT:
        case RT_ARROW:
            return 1;

        case PLUS_PLUS_P:
        case MINUS_MINUS_P:
        case UNARY_PLUS:
        case UNARY_MINUS:
        case BOOL_NOT:
        case BIT_NOT:
        case ADDRESS_OF:
            return 2;

        case MUL:
        case DIV:
        case MOD:
            return 3;

        case ADD:
        case SUB:
            return 4;

        case SHL:
        case SHR:
            return 5;

        case LT:
        case LTE:
        case GT:
        case GTE:
            return 6;

        case EQ:
        case NEQ:
            return 7;

        case BIT_AND:
            return 8;

        case BIT_XOR:
            return 9;

        case BIT_OR:
            return 10;

        case BOOL_AND:
            return 11;

        case BOOL_OR:
            return 12;

        case TERNARY:
            return 13;

        case ASSIGN:
        case ADD_ASSIGN:
        case SUB_ASSIGN:
        case MUL_ASSIGN:
        case DIV_ASSIGN:
        case MOD_ASSIGN:
        case SHL_ASSIGN:
        case SHR_ASSIGN:
        case AND_ASSIGN:
        case XOR_ASSIGN:
        case OR_ASSIGN:
            return 14;

        case COMMA:
            return 15;
    }
    assert(false);
}

Operator toUnaryOperator(TK kind) {
    switch(kind) with(Operator) {
        case TK.EXCLAMATION: return BOOL_NOT;
        case TK.TILDE: return BIT_NOT;
        case TK.AMP: return ADDRESS_OF;

        default:
            throw new Exception("Can't convert from TK %s to Operator".format(kind));
    }
    assert(false);
}

Operator toBinaryOperator(TK kind) {
    // assume prefix/suffix inc/dec is handled elsewhere

    switch(kind) with(Operator) {
        case TK.STAR: return MUL;
        case TK.SLASH: return DIV;
        case TK.PERCENT: return MOD;
        case TK.PLUS: return ADD;
        case TK.MINUS: return SUB;
        case TK.DLT: return SHL;
        case TK.DGT: return SHR;
        case TK.LT: return LT;
        case TK.LTE: return LTE;
        case TK.GT: return GT;
        case TK.GTE: return GTE;
        case TK.DEQ: return EQ;
        case TK.NEQ: return NEQ;
        case TK.AMP: return BIT_AND;
        case TK.HAT: return BIT_XOR;
        case TK.PIPE: return BIT_OR;
        case TK.DAMP: return BOOL_AND;
        case TK.DPIPE: return BOOL_OR;

        case TK.EQ: return ASSIGN;
        case TK.PLUS_EQ: return ADD_ASSIGN;
        case TK.MINUS_EQ: return SUB_ASSIGN;
        case TK.STAR_EQ: return MUL_ASSIGN;
        case TK.SLASH_EQ: return DIV_ASSIGN;
        case TK.PERCENT_EQ: return MOD_ASSIGN;
        case TK.DLT_EQ: return SHL_ASSIGN;
        case TK.DGT_EQ: return SHR_ASSIGN;
        case TK.AMP_EQ: return AND_ASSIGN;
        case TK.HAT_EQ: return XOR_ASSIGN;
        case TK.PIPE_EQ: return OR_ASSIGN;

        default:
            throw new Exception("Can't convert from TK %s to Operator".format(kind));
    }
    assert(false);
}
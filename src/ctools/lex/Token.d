module ctools.lex.Token;

import ctools.all;

__gshared Token NO_TOKEN = Token(TK.NONE, null);

struct Token {
private:
     enum { F_MARKED = 1, F_BLUE = 2 }
public:
    TK kind;
    int start;
    int length;
    int line;
    int column;
    string value;
    int flags;

    this(TK kind, int start, int length, int line, int column, string value = null) {
        this.kind = kind; this.start = start; this.length = length;
        this.line = line; this.column = column; this.value = value;
    }
    this(TK kind, string value) {
        this(kind, 0, 0, 0, 0, value);
    }

    bool marked() { return (flags&F_MARKED)!=0; }
    void marked(bool f) { if(f) flags |= F_MARKED; else flags &= ~F_MARKED; }
    bool blue() { return (flags&F_BLUE)!=0; }
    void blue(bool f) { if(f) flags |= F_BLUE; else flags &= ~F_BLUE; }

    string toString() {
        string e;
        if(lengthOf(kind)==0) {
            e = " '%s'".format(value);
        }
        if(marked()) {
            e ~= "¹";
        }
        if(blue()) {
            e ~= "º";
        }
        return "Token(%s%s, %s..%s L%s C%s)".format(stringOf(kind), e, start, start+length, line, column);
    }
}

Token[] toTokens(string str) {
    import std.string : split;
    import std.range: array;
    return str.split().map!(it=>Token(TK.ID, it)).array;
}

string stringOf(Token[] tokens) {
    string s;
    foreach(t; tokens) {
        s ~= "\n";
        s ~= t.toString();
    }
    return s;
}

string simpleStringOf(Token[] tokens, bool includeMarks = true) {
    string s;
    foreach(i, t; tokens) {
        string v;
        if(lengthOf(t.kind)==0) {
            v ~= t.value;
        } else {
            v ~= stringOf(t.kind);
        }
        if(includeMarks && t.marked()) {
            v ~= "(m)";
        }
        if(includeMarks && t.blue()) {
            v ~= "(b)";
        }
        s ~= v;
        if(i<tokens.length-1) s ~= " ";
    }
    return s;
}

string debugStringOf(Token[] tokens) {
    string s = "Tokens {\n";
    foreach(i, t; tokens) {
        s ~= "\t%s\n".format(t.toString());
    }
    return s ~ "}";
}

void paintBlue(Token[] tokens, string name) {
    foreach(ref t; tokens) {
        if(t.kind==TK.ID && t.value == name) {
            t.blue(true);
        }
    }
}

enum TK {
    NONE,
    ID,
    NUMBER,
    STRING,
    CHAR,

    LBRACKET,       // (
    RBRACKET,       // )
    LBRACE,         // {
    RBRACE,         // }
    LSQUARE,        // [
    RSQUARE,        // ]

    PLUS,           // +
    MINUS,          // -
    STAR,           // *
    PERCENT,        // %
    SLASH,          // /
    BSLASH,         // \
    AMP,            // &
    PIPE,           // |

    PLUS_EQ,        // +=
    MINUS_EQ,       // -=
    STAR_EQ,        // *=
    SLASH_EQ,       // /=
    PERCENT_EQ,     // %=
    AMP_EQ,         // &=
    PIPE_EQ,        // |=
    HAT_EQ,         // ^=
    DLT_EQ,         // <<=
    DGT_EQ,         // >>=

    DPIPE,          // ||
    DAMP,           // &&

    TILDE,          // ~
    EXCLAMATION,    // !
    HAT,            // ^
    EQ,             // =
    DEQ,            // ==
    NEQ,            // !=
    LT,             // <
    GT,             // >
    LTE,            // <=
    GTE,            // >=
    DLT,            // <<
    DGT,            // >>
    HASH,           // #
    DHASH,          // ##
    QMARK,          // ?
    DOT,            // .
    COMMA,          // ,
    SEMICOLON,      // ;
    COLON,          // :
}

int lengthOf(TK tk) {
    final switch(tk) with(TK) {
        case LBRACKET: case RBRACKET:
        case LBRACE: case RBRACE:
        case LSQUARE: case RSQUARE:
        case HASH: case PLUS: case MINUS: case STAR: case PERCENT: case SLASH: case BSLASH:
        case AMP: case PIPE: case TILDE: case EXCLAMATION: case HAT:
        case EQ: case LT: case GT: case QMARK: case DOT: case COMMA:
        case SEMICOLON: case COLON:
            return 1;
        case DEQ: case NEQ: case LTE: case GTE: case DLT: case DGT:
        case PLUS_EQ: case MINUS_EQ: case STAR_EQ: case SLASH_EQ:
        case PERCENT_EQ: case AMP_EQ: case PIPE_EQ: case HAT_EQ:
        case DAMP: case DPIPE: case DHASH:
            return 2;
        case DLT_EQ: case DGT_EQ:
            return 3;
        case NONE: case ID: case NUMBER: case STRING: case CHAR:
            return 0;
    }
    assert(false);
}
string stringOf(TK tk) {
    final switch(tk) with(TK) {
        case NONE:
        case ID:
        case NUMBER:
        case STRING:
        case CHAR:
            return "%s".format(tk);
        case LBRACKET: return "(";
        case RBRACKET: return ")";
        case LBRACE: return "{";
        case RBRACE: return "}";
        case LSQUARE: return "[";
        case RSQUARE: return "]";
        case HASH: return "#";
        case PLUS: return "+";
        case MINUS: return "-";
        case STAR: return "*";
        case PERCENT: return "%";
        case SLASH: return "/";
        case BSLASH: return "\\";
        case AMP: return "&";
        case PIPE: return "|";
        case TILDE: return "~";
        case EXCLAMATION: return "!";
        case HAT: return "^";
        case EQ: return "=";
        case LT: return "<";
        case GT: return ">";
        case QMARK: return "?";
        case DOT: return ".";
        case COMMA: return ",";
        case SEMICOLON: return ";";
        case COLON: return ":";
        case DEQ: return "==";
        case NEQ: return "!=";
        case LTE: return "<=";
        case GTE: return ">=";
        case DLT: return "<<";
        case DGT: return ">>";
        case PLUS_EQ: return "+=";
        case MINUS_EQ: return "-=";
        case STAR_EQ: return "*=";
        case SLASH_EQ: return "/=";
        case PERCENT_EQ: return "%=";
        case AMP_EQ: return "&=";
        case PIPE_EQ: return "|=";
        case HAT_EQ: return "^=";
        case DLT_EQ: return "<<=";
        case DGT_EQ: return ">>=";
        case DAMP: return "&&";
        case DPIPE: return "||";
        case DHASH: return "##";
    }
    assert(false);
}

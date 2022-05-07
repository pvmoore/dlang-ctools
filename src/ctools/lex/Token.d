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

    string file;

    this(TK kind, int start, int length, int line, int column, string value, string file = null) {
        this.kind = kind; this.start = start; this.length = length;
        this.line = line; this.column = column; this.value = value;
        this.file = file;
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
        string f;
        if(kind==TK.NONE) {
            e = " NONE";
        } else if(lengthOf(kind)==0) {
            e = " '%s'".format(value);
        }
        if(marked()) {
            e ~= "¹";
        }
        if(blue()) {
            e ~= "º";
        }
        if(file) {
            f = ", " ~ file;
        }
        return "Token(%s%s, %s..%s L%s C%s%s)".format(stringOf(kind), e, start, start+length, line, column, f);
    }
}

// Serialisation ───────────────────────────────────────────────────────────────────────────────────
void serialise(Token t, ByteWriter w) {
    w.write!int(t.kind);
    w.write!int(t.start);
    w.write!int(t.length);
    w.write!int(t.line);
    w.write!int(t.column);
    Serialiser.serialise(t.value, w);
    w.write!int(t.flags);
}
void serialise(Token[] tokens, ByteWriter w) {
    w.write!uint(tokens.length.as!uint);
    foreach(t; tokens) {
        serialise(t, w);
    }
}
Token deserialise(ByteReader r) {
    Token t = Token(
        r.read!int.as!TK,
        r.read!int,
        r.read!int,
        r.read!int,
        r.read!int,
        Serialiser.deserialiseString(r)
    );
    t.flags = r.read!int;
    return t;
}
//──────────────────────────────────────────────────────────────────────────────────────────────────

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

string simpleStringOfTrunc(Token[] tokens, bool includeNone, bool includeMarks) {
    if(tokens.length>8) {
        return simpleStringOf(tokens[0..8], includeNone, includeMarks) ~ "...";
    }
    return simpleStringOf(tokens, includeNone, includeMarks);
}

string simpleStringOf(Token[] tokens, bool includeNone, bool includeMarks) {
    string s;
    foreach(i, t; tokens) {
        string v;
        if(t.kind==TK.NONE) {
            if(!includeNone) continue;
            v ~= "NONE";
        } else if(lengthOf(t.kind)==0) {
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
    STRING,         // "string"
    ANGLE_STRING,   // <path>
    CHAR,           // 'c'

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
    RT_ARROW,       // ->
    ELIPSIS         // ...
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
        case DAMP: case DPIPE: case DHASH: case RT_ARROW:
            return 2;
        case DLT_EQ: case DGT_EQ: case ELIPSIS:
            return 3;
        case NONE: case ID: case NUMBER: case STRING: case ANGLE_STRING: case CHAR:
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
        case ANGLE_STRING:
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
        case RT_ARROW: return "->";
        case ELIPSIS: return "...";
    }
    assert(false);
}

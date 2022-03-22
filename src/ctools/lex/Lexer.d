module ctools.lex.Lexer;

import ctools.all;

final class Lexer {
private:
    enum DEBUG = false;
    string src;
    Token[] tokens;
    int pos;
    int line;
    int lineStart;
    int tokenStart;
public:
    this(string src) {
        this.src = src;
    }
    Token[] lex() {
        while(pos<src.length) {
            char ch = peek(0);
            if(ch<33) {
                addToken();
                skipWhitespace();
            } else switch(ch) {
                case '/':
                    if(peek(1)=='/') {
                        addToken();
                        skipLineComment();
                    } else if(peek(1)=='*') {
                        addToken();
                        skipMultiLineComment();
                    } else if(peek(1)=='=') {
                        addToken(TK.SLASH_EQ);
                    } else {
                        addToken(TK.SLASH);
                    }
                    break;
                case '<':
                    if(prevToken(0).value=="include" && prevToken(1).kind==TK.HASH) {
                        addToken();
                        angleString();
                    } else if(peek(1)=='<' && peek(2)=='=') {
                        addToken(TK.DLT_EQ);
                    } else if(peek(1)=='<') {
                        addToken(TK.DLT);
                    } else if(peek(1)=='=') {
                        addToken(TK.LTE);
                    } else {
                        addToken(TK.LT);
                    }
                    break;
                case '>':
                    if(peek(1)=='>' && peek(2)=='=') {
                        addToken(TK.DGT_EQ);
                    } else if(peek(1)=='>') {
                        addToken(TK.DGT);
                    } else if(peek(1)=='=') {
                        addToken(TK.GTE);
                    } else {
                        addToken(TK.GT);
                    }
                    break;
                case '!':
                    if(peek(1)=='=') {
                        addToken(TK.NEQ);
                    } else {
                        addToken(TK.EXCLAMATION);
                    }
                    break;
                case '=':
                    if(peek(1)=='=') {
                        addToken(TK.DEQ);
                    } else {
                        addToken(TK.EQ);
                    }
                    break;
                case '*':
                    if(peek(1)=='=') {
                        addToken(TK.STAR_EQ);
                    } else {
                        addToken(TK.STAR);
                    }
                    break;
                case '+':
                    if(peek(1)=='=') {
                        addToken(TK.PLUS_EQ);
                    } else {
                        addToken(TK.PLUS);
                    }
                    break;
                case '-':
                    if(peek(1)=='=') {
                        addToken(TK.MINUS_EQ);
                    } else {
                        addToken(TK.MINUS);
                    }
                    break;
                case '%':
                    if(peek(1)=='=') {
                        addToken(TK.PERCENT_EQ);
                    } else {
                        addToken(TK.PERCENT);
                    }
                    break;
                case '&':
                    if(peek(1)=='&') {
                        addToken(TK.DAMP);
                    } else if(peek(1)=='=') {
                        addToken(TK.AMP_EQ);
                    } else {
                        addToken(TK.AMP);
                    }
                    break;
                case '|':
                    if(peek(1)=='|') {
                        addToken(TK.DPIPE);
                    } else if(peek(1)=='=') {
                        addToken(TK.PIPE_EQ);
                    } else {
                        addToken(TK.PIPE);
                    }
                    break;
                case '^':
                    if(peek(1)=='=') {
                        addToken(TK.HAT_EQ);
                    } else {
                        addToken(TK.HAT);
                    }
                    break;
                case '\'':
                    addToken();
                    squote();
                    break;
                case '"':
                    addToken();
                    dquote();
                    break;
                case 'L':
                    if(peek(1)=='"') {
                        // Lstring
                        addToken();
                        dquote();
                    } else if(peek(1)=='\'') {
                        // Lchar
                        addToken();
                        squote();
                    } else {
                        pos++;
                    }
                    break;
                case '.':
                    if(isDigit(peek(-1)) || isDigit(peek(1))) {
                        // float literal
                        pos++;
                    } else {
                        addToken(TK.DOT);
                    }
                    break;
                case '#':
                    if(peek(1)=='#') {
                        addToken(TK.DHASH);
                    } else {
                        addToken(TK.HASH);
                    }
                    break;
                case '~': addToken(TK.TILDE); break;
                case '\\': addToken(TK.BSLASH); break;
                case '?': addToken(TK.QMARK); break;
                case ',': addToken(TK.COMMA); break;
                case ';': addToken(TK.SEMICOLON); break;
                case ':': addToken(TK.COLON); break;
                case '(': addToken(TK.LBRACKET); break;
                case ')': addToken(TK.RBRACKET); break;
                case '{': addToken(TK.LBRACE); break;
                case '}': addToken(TK.RBRACE); break;
                case '[': addToken(TK.LSQUARE); break;
                case ']': addToken(TK.RSQUARE); break;

                default:
                    pos++;
                    break;
            }
        }
        addToken();

        static if(DEBUG) dbg("%s", debugStringOf(tokens));

        return tokens;
    }
private:
    Token prevToken(int offset = 0) {
        return tokens.length.as!int-offset <= 0 ? NO_TOKEN : tokens[$-(1+offset)];
    }
    char peek(int offset) {
        return pos+offset < src.length ? src[pos+offset] : 0;
    }
    bool isEol() {
        return peek(0).isOneOf(10, 13);
    }
    void eol() {
        // can be 13,10 or just 10
        if(peek(0)==13) pos++;
        if(peek(0)==10) pos++;
        line++;
        lineStart = pos;
    }
    void skipWhitespace() {
        while(pos<src.length) {
            if(isEol()) {
                eol();
            } else if(peek(0) < 33) {
                pos++;
            } else {
                break;
            }
        }
        tokenStart = pos;
    }
    void skipLineComment() {
        while(pos<src.length) {
            if(isEol()) {
                eol();
                break;
            }
            pos++;
        }
        tokenStart = pos;
    }
    void skipMultiLineComment() {
        while(pos<src.length) {
            if(isEol()) {
                eol();
            } else if(peek(0)=='*' && peek(1)=='/') {
                pos+=2;
                break;
            } else {
                pos++;
            }
        }
        tokenStart = pos;
    }
    void squote() {
        // 'c'
        // L'c'
        if(peek(0)=='L') pos++;
        pos++;
        while(pos<src.length) {
            if(peek(0)=='\\' && peek(1)=='\\') {
                pos+=2;
            } else if(peek(0)=='\\' && peek(1)=='\'') {
                pos+=2;
            } else if(peek(0)=='\'') {
                pos++;
                addToken();
                break;
            } else {
                pos++;
            }
        }
    }
    void dquote() {
        // " string "
        // L" string "
        if(peek(0)=='L') pos++;
        pos++;
        while(pos<src.length) {
            if(peek(0)=='\\' && peek(1)=='\\') {
                pos+=2;
            } else if(peek(0)=='\\' && peek(1)=='"') {
                pos+=2;
            } else if(peek(0)=='"') {
                pos++;
                addToken();
                break;
            } else {
                pos++;
            }
        }
    }
    void angleString() {
        // < string >
        pos++;
        while(pos<src.length) {
            if(peek(0)=='>') {
                pos++;
                addToken();
                break;
            } else {
                pos++;
            }
        }
    }
    TK determineKind(string s) {
        if(s.length==0) return TK.ID;
        if(s[0]=='\'' || s.startsWith("L'")) return TK.CHAR;
        if(s[0]=='"' || s.startsWith("L\"")) return TK.STRING;
        if(s[0]=='<') return TK.ANGLE_STRING;
        if(isDigit(s[0])) return TK.NUMBER;
        return TK.ID;
    }
    void addToken(TK tk = TK.NONE) {
        if(tokenStart < pos) {
            string value = src[tokenStart..pos];
            TK tk2 = determineKind(value);
            int column = tokenStart-lineStart;
            tokens ~= Token(tk2, tokenStart, pos-tokenStart, line, column, value);
        }
        if(tk!=TK.NONE) {
            int column = pos-lineStart;
            tokens ~= Token(tk, pos, lengthOf(tk), line, column);
            pos += lengthOf(tk);
        }
        tokenStart = pos;
    }

}
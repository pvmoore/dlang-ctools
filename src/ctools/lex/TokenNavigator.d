module ctools.lex.TokenNavigator;

import ctools.all;

final class TokenNavigator {
public:
    Token[] tokens;
    int pos;

    this(Token[] tokens) {
        this.tokens = tokens;
    }
    void rewind() {
        pos = 0;
    }
    TK kind(int offset = 0) {
        return peek(offset).kind;
    }
    string value(int offset = 0) {
        auto t = peek(offset);
        return t.value;
    }
    int line(int offset = 0) {
        return peek(offset).line;
    }
    Token peek(int offset) {
        if(pos+offset < 0 || pos+offset >= tokens.length) return NO_TOKEN;
        return tokens[pos+offset];
    }
    bool isEof() {
        return pos >= tokens.length;
    }
    bool isAdjacent(int offset = 0) {
        int prev = peek(offset-1).column + peek(offset-1).length;
        int col = peek(offset).column;
        return col == prev;
    }
    override string toString() {
        return simpleStringOf(tokens);
    }
    void removeAll() {
        tokens.length = 0;
    }
    void removeNext(int count) {
        tokens = tokens[0..pos] ~ tokens[pos+count..$];
    }
    void removePrev(int count) {
        pos -= count;
        removeNext(count);
    }
    void skip(int count) {
        pos += count;
    }
    void insert(Token[] toks) {
        tokens = tokens[0..pos] ~ toks ~ tokens[pos..$];
    }
}

Tuple!(Token[],int) currentLine(TokenNavigator nav, bool includeSplicedLines) {
        Token[] toks;
        int line = nav.peek(0).line;
        int offset = 0;
        int count = 0;
        while(true) {
            Token t = nav.peek(offset);
            if(includeSplicedLines && t.kind==TK.BSLASH) {
                count++;
                line++;
            } else if(t.line!=line) {
                break;
            } else {
                toks ~= t;
                count++;
            }
            offset++;
        }
        return tuple(toks, count);
    }
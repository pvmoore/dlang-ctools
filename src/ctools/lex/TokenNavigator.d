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

        // Remove all empty tokens
        Token[] temp;
        foreach(t; tokens) {
            if(t.kind!=TK.NONE) {
                temp ~= t;
            }
        }
        tokens = temp;
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
        return simpleStringOf(tokens, false, true);
    }
    void skip(int count) {
        pos += count;
    }
    void skip(TK k) {
        throwIf(kind()!=k, "Expecting %s", k);
        skip(1);
    }
    void skip(string val) {
        throwIf(value()!=val, "Expecting %s", val);
        skip(1);
    }
    int skipAll(TK kind, int offset = 0) {
        int count = 0;
        while(isKind(kind, offset+count)) { count++; }
        skip(count);
        return count;
    }
    void skipToNextValidToken() {
        while(pos<tokens.length) {
            if(peek(0).kind!=TK.NONE) return;
            skip(1);
        }
        throwIf(true, "No valid next token found");
        assert(false);
    }
    int prevValidTokenPos() {
        for(int i=-1; pos+i >= 0; i--) {
            Token t = peek(i);
            if(t.kind!=TK.NONE) return pos+i;
        }
        throwIf(true, "No valid previous token found");
        assert(false);
    }
    bool isKind(TK k, int offset = 0) {
        return peek(offset).kind == k;
    }
    bool isValue(string s, int offset = 0) {
        auto t = peek(offset);
        return t.kind==TK.ID && s==t.value;
    }

    // modifiers
    void removeAll() {
        tokens.length = 0;
    }
    void removeNext(int count) {
        foreach(ref t; tokens[pos..pos+count]) {
            t.kind = TK.NONE;
            t.value = null;
        }
        pos += count;
    }
    void removePrev(int count) {
        pos -= count;
        removeNext(count);
    }
    void removeLine() {
        auto l = line();
        int o = 0;
        while(peek(o).line==l) o++;
        removeNext(o);
    }
    void insert(Token[] toks) {
        //if(toks.length == 0) { writefln("EMPTY"); }
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

bool matches(TokenNavigator nav, int offset, const TK[] kinds...) {
    foreach(k; kinds) {
        if(!nav.isKind(k, offset++)) return false;
    }
    return true;
}
bool matchesAny(TokenNavigator nav, int offset, const TK[][] kinds...) {
    foreach(k; kinds) {
        if(!matches(nav, offset, k)) return false;
    }
    return true;
}

/**
 *  Skip all tokens between startKind and endKind. These are expected to be
 *  opening and closing bracket of some variety eg '[' and ']'
 *  We expect to start on 'startKind' and skip past 'endKind'.
 */
void skipBetween(TokenNavigator nav, TK startKind, TK endKind) {
    throwIf(!nav.isKind(startKind));
    nav.skip(1);
    int count = 1;
    while(!nav.isEof()) {
        auto k = nav.kind();
        if(k==startKind) {
            count++;
        } else if(k==endKind) {
            count--;
            if(count==0) {
                nav.skip(1);
                return;
            }
        }
        nav.skip(1);
    }
}
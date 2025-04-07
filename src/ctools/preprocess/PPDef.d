module ctools.preprocess.PPDef;

import ctools.all;

struct PPDef {
    string name;
    string[] params;    // empty if this is not a function
    Token[] tokens;
    bool isFunc;

    this(string name, Token[] tokens) {
        this.name = name;
        this.tokens = tokens;
    }
    this(string name, string[] params, Token[] tokens) {
        this(name, tokens);
        this.params = params;
    }
    bool isEmpty() {
        return tokens.length == 0;
    }
    int numParameters() {
        return cast(int)params.length;
    }
    string toString() {
        return (isFunc ? "fn(%s) ".format(params.joiner(",")) : "") ~ simpleStringOf(tokens, true, true);
    }
}

string toString(PPDef[string] definitions) {
    string s = "Definitions {\n";
    foreach(e; definitions.byKeyValue()) {
        s ~= "\t%s = %s\n".format(e.key, e.value);
    }
    return s ~ "}";
}

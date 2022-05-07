module ctools.preprocess.directive.PPDefine;

import ctools.all;

private {
    enum DEBUG = false;

    void log(A...)(ParseState state, string fmt, A args) {
        static if(DEBUG) {
            if(state.currentFile().filename.value=="test.h") {
                writefln("PPDefine: " ~ format(fmt, args));
            }
        }
    }
}

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-define-directive-c-cpp?view=msvc-170
 */
final class PPDefine {
private:
public:
    /**
     * '#define' NAME
     * '#define' NAME                TOKENS  [ '\' ]
     * '#define' NAME '(' PARAMS ')' TOKENS  [ '\' ]
     */
    static void process(ParseState state, TokenNavigator file) {

        int line = file.line();

        // # define
        file.removeNext(2);

        // name
        string name = file.value();
        bool isFunc = file.kind(1)==TK.LBRACKET && file.isAdjacent(1);

        file.removeNext(1);

        string[] params;
        PPDef def;

        // ( PARAMS )
        if(isFunc) {
            // (
            file.removeNext(1);

            // Extract params
            while(file.kind()!=TK.RBRACKET) {
                if(file.isKind(TK.BSLASH)) {
                    line++;
                } else if(file.kind()==TK.COMMA) {
                } else {
                    params ~= file.value();
                }
                file.removeNext(1);
            }

            // )
            file.removeNext(1);

            log(state, "params = %s", params);
        }

        Token[] lineTokens;

        if(file.line()==line) {
            // TOKENS
            auto tup = file.currentLine(true);
            lineTokens = tup[0];
            auto numTokens = tup[1];

            log(state,"lineTokens = %s", simpleStringOf(lineTokens, true, true));

            file.removeNext(numTokens);

            lineTokens.paintBlue(name);
        }

        if(params) {
            log(state, "%s(%s) = %s", name, params, simpleStringOf(lineTokens, true, true));

            def = PPDef(name, params, lineTokens);

        } else {
            log(state, "%s = %s", name, simpleStringOf(lineTokens, true, true));
            def = PPDef(name, lineTokens);
        }

        def.isFunc = isFunc;

        state.definitions[name] = def;
    }
}
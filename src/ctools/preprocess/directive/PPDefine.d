module ctools.preprocess.directive.PPDefine;

import ctools.all;

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-define-directive-c-cpp?view=msvc-170
 */
final class PPDefine {
private:
    enum DEBUG = false;
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
            file.removeNext(1);

            // Extract params
            while(file.kind()!=TK.RBRACKET) {
                params ~= file.value();
                file.removeNext(1);
                if(file.kind()==TK.COMMA) file.removeNext(1);
            }
            file.removeNext(1);
        }

        if(file.line()==line) {
            // TOKENS
            auto tup = file.currentLine(true);
            auto lineTokens = tup[0];
            auto numTokens = tup[1];

            file.removeNext(numTokens);

            lineTokens.paintBlue(name);

            if(params) {
                static if(DEBUG) writefln("%s(%s) = %s", name, params, simpleStringOf(lineTokens));

                def = PPDef(name, params, lineTokens);
            } else {
                static if(DEBUG) writefln("%s = %s", name, simpleStringOf(lineTokens));
                def = PPDef(name, lineTokens);
            }
        }

        state.definitions[name] = def;
    }
}
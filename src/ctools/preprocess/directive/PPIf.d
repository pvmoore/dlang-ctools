module ctools.preprocess.directive.PPIf;

import ctools.all;

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=msvc-170
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-ifdef-and-hash-ifndef-directives-c-cpp?view=msvc-170
 */
final class PPIf {
private:
    enum DEBUG = false;
public:
    /**
     * '#if' EXPRESSION ...
     * '#elif' EXPRESSION ...
     * '#ifdef' IDENTIFIER
     * 'ifndef' IDENTIFIER
     */
    static bool process(ParseState state, TokenNavigator file) {

        // #
        file.removeNext(1);

        // if/ifdef/ifndef/elif
        string directive = file.value();
        file.removeNext(1);

        bool result;

        if("ifdef"==directive) {
            // NAME
            string name = file.value();
            file.removeNext(1);

            result = state.definitions.containsKey(name);

        } else if("ifndef"==directive) {
            // NAME
            string name = file.value();
            file.removeNext(1);

            result = !state.definitions.containsKey(name);

        } else {
            // if/elif

            // Expression
            auto tup = file.currentLine(true);
            auto lineTokens = tup[0];
            auto numTokens = tup[1];

            file.removeNext(numTokens);

            static if(DEBUG) writefln("lineTokens = %s", simpleStringOf(lineTokens));

            // replace macros/definitions within the expression tokens
            auto tnav = new TokenNavigator(lineTokens);

            static if(DEBUG) writefln("tnav (before) = %s", tnav);
            PPMacroExpander.expandAll(state, tnav, true, "");
            static if(DEBUG) writefln("tnav (after) = %s", tnav);

            result = 0 != PPExpressionParser.parse(tnav);
        }

        return result;
    }
}
module ctools.preprocess.directive.PPError;

import ctools.all;

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-error-directive-c-cpp?view=msvc-170
 */
final class PPError {
public:
    /**
     * '#error'
     */
    static void process(ParseState state, TokenNavigator file) {
        throw new Exception("#error directive encountered");
    }
}
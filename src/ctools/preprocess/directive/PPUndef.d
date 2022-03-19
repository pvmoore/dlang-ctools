module ctools.preprocess.directive.PPUndef;

import ctools.all;

final class PPUndef {
public:
    /**
     * '#undef' NAME
     */
    static void process(ParseState state, TokenNavigator file) {
        // # undef
        file.removeNext(2);

        // NAME
        string name = file.value();
        file.removeNext(1);

        state.definitions.remove(name);
    }
}
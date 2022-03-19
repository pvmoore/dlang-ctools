module ctools.preprocess.directive.PPPragma;

import ctools.all;

final class PPPragma {
public:
    /**
     * '#pragma' 'once'
     */
    static void process(ParseState state, TokenNavigator file) {
        // # pragma
        file.removeNext(2);

        // once
        if("once"==file.value()) {
            file.removeNext(1);

            if(state.isIncludeOnce(state.currentFile())) {
                // This file is already processed
                file.removeAll();
            } else {
                state.markAsIncludeOnce(state.currentFile());
            }

        } else {
            throw new Exception("Unsupported pragma %s".format(file.value()));
        }
    }
}
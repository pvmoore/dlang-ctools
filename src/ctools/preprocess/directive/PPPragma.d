module ctools.preprocess.directive.PPPragma;

import ctools.all;

final class PPPragma {
public:
    /**
     * '#pragma' 'once'
     */
    static void process(ParseState state, TokenNavigator nav) {
        // # pragma
        nav.removeNext(2);

        switch(nav.value()) {
            case "once":
                nav.removeNext(1);
                state.markAsIncludeOnce(state.currentFile());
                break;
            case "region":
            case "endregion":
            case "pack":
            case "warning":
            case "intrinsic":
            case "deprecated":
            case "push_macro":
            case "pop_macro":
            case "comment":
                nav.removeLine();
                break;
            default:
                throw new Exception("Unsupported pragma '%s' in file %s at line %s"
                    .format(nav.value(), state.currentFile(), nav.line()));
        }
    }
}
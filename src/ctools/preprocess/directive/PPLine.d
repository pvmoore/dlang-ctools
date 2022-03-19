module ctools.preprocess.directive.PPLine;

import ctools.all;
import std.conv : to;

final class PPLine {
public:
    /**
     * '#line' NUMBER
     */
    static void process(ParseState state, TokenNavigator file) {
        // # line
        file.removeNext(2);

        // NUMBER
        int number = file.value().to!int;
        file.removeNext(1);
    }
}
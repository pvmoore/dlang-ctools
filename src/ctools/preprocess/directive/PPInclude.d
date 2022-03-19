module ctools.preprocess.directive.PPInclude;

import ctools.all;

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=msvc-170
 */
final class PPInclude {
private:
     enum DEBUG = true;
public:
    /**
     * '#include' '"' PATH '"'
     * '#include' '<' PATH '>'
     */
    static void process(ParseState state, TokenNavigator nav) {
        // # include
        nav.removeNext(2);

        // file path
        string path = nav.value();
        nav.removeNext(1);

        static if(DEBUG) {
            writefln("======================------------------ - - - - - - - - - - - - - - - -");
            writefln("path = %s", path);
        }

        if(path.length < 3 || path[0] != path[$-1]) throw new Exception("Invalid path '%s'".format(path));

        bool quoted = path.startsWith("\"");

        if(quoted) {
            quotedPath(state, nav, path[1..$-1]);
        } else {
            angleBracketPath(state, nav, path[1..$-1]);
        }
    }
private:
    /**
     * 1) Directory of currently opened file
     * 2) Directories of currently opened include filed in reverse order
     * 3) Include paths
     */
    static void quotedPath(ParseState state, TokenNavigator nav, string path) {
        Filepath addPath = Filepath(path);
        Filepath newPath = addPath;

        if(addPath.isAbsolute() && !addPath.exists()) {
            throw new Exception("Include path not found %s".format(path));
        }

        if(addPath.directory.isRelative()) {
            newPath = state.currentDirectory().add(addPath);
        }

        static if(DEBUG) writefln("current dir = %s", state.currentDirectory());
        static if(DEBUG) writefln("include = %s", newPath);

        if(newPath.exists()) {
            auto srcFile = state.process(newPath);

            // add tokens to parent here


            static if(DEBUG) writefln("TOKENS = %s", simpleStringOf(srcFile.tokens()));

            nav.insert(srcFile.tokens());
            nav.skip(srcFile.tokens.length.as!int);

        } else {
            // if not found, search include directories
            angleBracketPath(state, nav, path);
        }
    }
    /**
     * 1) Include paths
     */
    static void angleBracketPath(ParseState state, TokenNavigator nav, string path) {
        throw new Exception("angle path not found %s".format(path));
    }
}
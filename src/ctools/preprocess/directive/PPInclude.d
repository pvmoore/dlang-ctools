module ctools.preprocess.directive.PPInclude;

import ctools.all;

/**
 * https://docs.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=msvc-170
 */
final class PPInclude {
private:
     enum DEBUG = false;
public:
    /**
     * '#include' '"' PATH '"'
     * '#include' '<' PATH '>'
     */
    static void process(ParseState state, TokenNavigator nav) {
        // # include
        nav.removeNext(2);

        // file path
        throwIf(!nav.kind().isOneOf(TK.STRING, TK.ANGLE_STRING));
        string path;
        bool quoted = false;
        if(nav.kind()==TK.STRING) {
            // "path"
            quoted = true;
            path = nav.value()[1..$-1];
            nav.removeNext(1);
        } else {
            // <path>
            path = nav.value()[1..$-1];
            nav.removeNext(1);
        }

        if(path.length == 0) throw new Exception("Path missing");

        static if(DEBUG) {
            writefln("======================------------------ - - - - - - - - - - - - - - - -");
            writefln("path = %s", path);
        }

        if(quoted) {
            quotedPath(state, nav, path);
        } else {
            angleBracketPath(state, nav, path);
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

        // Handle absolute path
        if(addPath.isAbsolute()) {
            if(!addPath.exists()) {
                throw new Exception("Absolute include path not found %s".format(path));
            }
            doInclude(state, newPath, nav);
            return;
        }

        // It is a relative path
        newPath = state.currentDirectory().add(addPath);

        static if(DEBUG) writefln("current dir = %s", state.currentDirectory());
        static if(DEBUG) writefln("include = %s", newPath);

        if(newPath.exists()) {
            doInclude(state, newPath, nav);

        } else {
            // if not found, search include directories
            angleBracketPath(state, nav, path);
        }
    }
    /**
     * 1) Include paths
     */
    static void angleBracketPath(ParseState state, TokenNavigator nav, string path) {

        auto addPath = Filepath(path);

        // Handle absolute path
        if(addPath.isAbsolute()) {
            if(!addPath.exists()) {
                throw new Exception("Include path not found '%s'".format(path));
            }
            doInclude(state, addPath, nav);
            return;
        }

        // It is a relative path
        foreach(dir; state.includeDirectories) {
            auto newPath = dir.add(addPath);

            static if(DEBUG) writefln("trying path '%s'", newPath);

            if(newPath.exists()) {
                doInclude(state, newPath, nav);
                return;
            }
        }

        throw new Exception("angle path not found %s".format(path));
    }
    static void doInclude(ParseState state, Filepath path, TokenNavigator nav) {

        if(state.isIncludeOnce(path)) {
            static if(DEBUG) writefln("Not including #pragma once file %s", path);
            return;
        }

        auto srcFile = state.preProcess(path);

        // add tokens to parent here

        //static if(DEBUG) writefln("TOKENS = %s", simpleStringOf(srcFile.tokens()));

        nav.insert(srcFile.tokens());
        nav.skip(srcFile.tokens.length.as!int);
    }
}
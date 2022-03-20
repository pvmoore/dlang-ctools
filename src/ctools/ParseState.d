module ctools.ParseState;

import ctools.all;

final class ParseState {
    enum DEBUG = true;
    Filepath[] directoryStack;
    bool[Filepath] pragmaOnceSourceFiles;
public:
    Directory[] includeDirectories;
    SourceFile mainSource;

    // dynamic
    Map!(string,PPDef) definitions;

    Filepath currentFile() {
        throwIf(directoryStack.length==0);
        return directoryStack[$-1];
    }
    Directory currentDirectory() {
        throwIf(directoryStack.length==0);
        return directoryStack[$-1].directory;
    }
    bool isIncludeOnce(Filepath path) {
        return (path in pragmaOnceSourceFiles) !is null;
    }
    void markAsIncludeOnce(Filepath path) {
        pragmaOnceSourceFiles[path] = true;
    }


    this(string[] includeDirectories, string[string] defines) {
        this.includeDirectories = includeDirectories.map!(i=>Directory(i)).array;
        this.definitions = new Map!(string,PPDef);

        defines["__DATE__"] = "MMM DD YYY";
        defines["__TIME__"] = "HH:MM:SS";
        defines["__STDC__"] = "1";
        defines["__FILE__"] = "TODO";   // Needs to be updated in PreProcessor
        defines["__LINE__"] = "TODO";   // Needs to be updated in PreProcessor

        foreach(e; defines.byKeyValue()) {
            definitions.add(e.key, PPDef(e.key, toTokens(e.value)));
        }
    }

    SourceFile preProcess(Filepath path) {
        auto src = new SourceFile(path);
        if(!mainSource) {
            mainSource = src;
            pragmaOnceSourceFiles[path] = true;
        }

        pushDirectory(src.path);

        static if(DEBUG) writefln("processing '%s'", src.path);
        src.nav = readAndLex(src);

        PreProcessor.process(this, src.path.filename.value, src.nav);

        popDirectory();

        return src;
    }

    void parse() {

    }

    override string toString() {
        return "ParseState {\n" ~
            "\tmainSource: '%s'\n".format(mainSource?mainSource.path.value:"null") ~
            "\tincludeDirectories: %s\n".format(includeDirectories) ~
            "}";
    }
private:
    void pushDirectory(Filepath path) {
        directoryStack ~= path;
    }
    void popDirectory() {
        directoryStack.length--;
    }
    TokenNavigator readAndLex(SourceFile src) {
        string raw = cast(string)fs.read(src.path.value);
        Token[] tokens = new Lexer(raw).lex();
        return new TokenNavigator(tokens);
    }
}
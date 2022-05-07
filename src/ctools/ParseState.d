module ctools.ParseState;

import ctools.all;

final class ParseState {
private:
    Filepath[] directoryStack;
    bool[Filepath] pragmaOnceSourceFiles;
public:
    Directory[] includeDirectories;
    Set!Filepath allSourceFiles;
    StopWatch preprocessTime, parseTime;
    Map!(string,PPDef) definitions;


    // Debugging
    string dumpDirectory = "target";
    bool dumpIncludeFilenames = false;
    bool dumpIncludeTokens = false;
    string log;

    this(string[] includeDirectories, string[string] defines) {
        this.includeDirectories = includeDirectories.map!(i=>Directory(i)).array;
        this.definitions = new Map!(string,PPDef);
        this.allSourceFiles = new Set!Filepath;

        defines["__DATE__"] = "MMM DD YYY";
        defines["__TIME__"] = "HH:MM:SS";
        defines["__STDC__"] = "1";
        defines["__FILE__"] = "TODO";   // Needs to be updated in PreProcessor
        defines["__LINE__"] = "TODO";   // Needs to be updated in PreProcessor

        foreach(e; defines.byKeyValue()) {
            definitions.add(e.key, PPDef(e.key, toTokens(e.value)));
        }
    }
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

    Token[] preProcess(Filepath path) {
        preprocessTime.start();

        bool isFirst = !allSourceFiles.contains(path);
        allSourceFiles.add(path);

        if(isFirst && dumpIncludeFilenames) {
            writefln("%s%s", repeat("|  ", directoryStack.length), path.toString());
        }

        if(isMainFile()) {
            pragmaOnceSourceFiles[path] = true;
        }

        pushDirectory(path);

        auto nav = readAndLex(path);

        PreProcessor.process(this, path.filename.value, nav);
        nav.rewind();
        Token[] tokens = nav.tokens;

        popDirectory();

        if(isFirst && dumpIncludeTokens) {
            string s;
            foreach(t; tokens) {
                s ~= simpleStringOf([t], false, false) ~ " ";
                //s ~= t.toString() ~ " ";
                if(t.kind == TK.SEMICOLON) s ~= "\n";
            }
            From!"std.file".write(dumpDirectory ~ "/preprocessed_" ~ path.filename.value, s);
        }

        preprocessTime.stop();
        return tokens;
    }

    Node parse(Token[] tokens) {
        parseTime.start();

        Node parent = new StmtParser(new TokenNavigator(tokens)).process();

        parseTime.stop();
        return parent;
    }
private:
    bool isMainFile() {
        return directoryStack.length==0;
    }
    void pushDirectory(Filepath path) {
        directoryStack ~= path;
    }
    void popDirectory() {
        directoryStack.length--;
    }
    TokenNavigator readAndLex(Filepath path) {
        string raw = cast(string)fs.read(path.value);
        Token[] tokens = new Lexer(raw, path.filename.value).lex();
        return new TokenNavigator(tokens);
    }
}
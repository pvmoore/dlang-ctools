module ctools.ParseState;

import ctools.all;

final class ParseState {
private:
    Filepath[] directoryStack;
    bool[Filepath] pragmaOnceSourceFiles;
public:
    Directory[] includeDirectories;
    SourceFile mainSource;
    Set!Filepath allSourceFiles;

    string dumpDirectory = "target";
    bool dumpIncludeFiles = false;
    bool dumpIncludeTokens = false;

    string log;

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

    SourceFile preProcess(Filepath path) {
        auto src = new SourceFile(path);

        bool isFirst = !allSourceFiles.contains(path);
        allSourceFiles.add(path);

        if(isFirst && dumpIncludeFiles) {
            writefln("%s%s", repeat("|  ", directoryStack.length), path.toString());
        }

        if(!mainSource) {
            mainSource = src;
            pragmaOnceSourceFiles[path] = true;
        }

        pushDirectory(src.path);

        src.nav = readAndLex(src);

        PreProcessor.process(this, src.path.filename.value, src.nav);

        popDirectory();

        if(isFirst && dumpIncludeTokens) {
            string s;
            foreach(t; src.tokens()) {
                s ~= simpleStringOf([t], false) ~ " ";
                if(t.kind == TK.SEMICOLON) s ~= "\n";
            }
            From!"std.file".write(dumpDirectory ~ "/preprocessed_" ~ path.filename.value, s);
        }

        return src;
    }

    void parse() {
        auto nav = mainSource.nav;
        nav.rewind();

        Parser.process(this, nav);
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
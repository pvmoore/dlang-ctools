module processor_common;

public:

import ctools;
import extractor;

import std.stdio : writefln;

abstract class Processor {
private:
protected:
    ParseState parseState;
    Token[] tokens;
    Node parent;
public:
    void prepare() {
        auto defines = WIN64_DEFINES.dup;
        adjustDefines(defines);

        writefln("Defines:");
        foreach(e; defines.byKeyValue()) {
            writefln("\t%s = %s", e.key, e.value);
        }

        auto includeDirs = getWindowsSDKIncludeDirs().dup;
        adjustIncludes(includeDirs);

        writefln("Include dirs:");
        foreach(d; includeDirs) {
            writefln("\t%s", d);
        }

        this.parseState = new ParseState(includeDirs,defines);

        parseState.dumpDirectory = "target";
        parseState.dumpIncludeFilenames = true;
        parseState.dumpIncludeTokens = false;
    }
protected:
    void adjustDefines(ref string[string] defines) {

    }
    void adjustIncludes(ref string[] includeDirs) {

    }
    void parse(Filepath path) {

        this.tokens = parseState.preProcess(path);
        this.parent = parseState.parse(tokens);

        writefln("Preprocess time %s seconds", parseState.preprocessTime.peek().total!"nsecs"/1_000_000_000.0);
        writefln("Parse time %s seconds", parseState.parseTime.peek().total!"nsecs"/1_000_000_000.0);
    }
}

final class Comment : Emitter.Plugin {
private:
    string[] lines;
public:
    this(string[] lines) {
        this.lines = lines;
    }
    override void emit(File file) {
        foreach(line; lines) {
            file.writefln("// %s", line);
        }
        file.writeln();
    }
}

final class DefineEmitter : Emitter.Plugin {
private:
    Map!(string,PPDef) definitions;
    Regex!char[] includes;
public:
    this(Map!(string,PPDef) definitions, Regex!char[] includes) {
        this.definitions = definitions;
        this.includes = includes;
    }
    override void emit(File file) {
        string[] keys;

        foreach(e; definitions.byKeyValue()) {
            if(accept(e.key)) {
                keys ~= e.key;
            }
        }

        if(!keys) return;

        import std.algorithm.sorting : sort;
        keys.sort();

        file.writefln("// Definitions");

        foreach(k; keys) {
            file.writefln("enum %s = %s;", k, *definitions[k]);
        }
        file.writefln("// End Definitions");
    }
private:
    bool accept(string key) {
        foreach(r; includes) {
            auto c = matchFirst(key, r);
            if(!c.empty) return true;
        }
        return false;
    }
}
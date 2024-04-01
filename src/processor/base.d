module processor.base;

public:

import ctools;
import extractor;

import std.stdio             : writeln, writefln;
import std.format            : format;
import std.array             : replace;
import std.algorithm.sorting : sort;
import std.typecons          : Tuple, tuple;

abstract class Processor {
private:
protected:
    ParseState parseState;
    Node parent;
public:
    abstract void process();
    
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
    void parse(Filepath[] paths...) {

        Token[] tokens;

        foreach(path; paths) {
            tokens ~= parseState.preProcess(path);
        }

        writefln("Parsing...");

        this.parent = parseState.parse(tokens);

        writefln("Preprocess time %s seconds", parseState.preprocessTime.peek().total!"nsecs"/1_000_000_000.0);
        writefln("Parse time %s seconds", parseState.parseTime.peek().total!"nsecs"/1_000_000_000.0);
    }
}

//══════════════════════════════════════════════════════════════════════════════════════════════════

final class Comment : Emitter.AppenderPlugin {
private:
    string[] lines;
public:
    this(string[] lines) {
        this.lines = lines;
    }
    override void emit(StringBuffer buf) {
        foreach(line; lines) {
            buf.add("// %s\n", line);
        }
        buf.add("\n");
    }
}

//──────────────────────────────────────────────────────────────────────────────────────────────────

final class DefineEmitter : Emitter.AppenderPlugin {
private:
    Map!(string,PPDef) definitions;
    Regex!char[] includes;
public:
    this(Map!(string,PPDef) definitions, Regex!char[] includes) {
        this.definitions = definitions;
        this.includes = includes;
    }
    override void emit(StringBuffer buf) {
        string[] keys;

        foreach(e; definitions.byKeyValue()) {
            if(accept(e.key)) {
                keys ~= e.key;
            }
        }

        if(!keys) return;

        keys.sort();

        buf.add("// Definitions\n");

        foreach(k; keys) {
            buf.add("enum %s = %s;\n", k, *definitions[k]);
        }
        buf.add("// End Definitions\n\n");
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

//──────────────────────────────────────────────────────────────────────────────────────────────────

/**
 * Emit some code into the output
 */
final class CodeEmitter : Emitter.AppenderPlugin {
private:

public:
    override void emit(StringBuffer buf) {

    }
}

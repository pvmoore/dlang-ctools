module test_preprocess;

import std.file : read;
import std.stdio : writefln;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;

import ctools.all;
import test : normaliseWhitespace;

void testPreProcessor() {
    testPreProcessor("test/pp/define0.h");
    testPreProcessor("test/pp/define1.h");
    testPreProcessor("test/pp/define2.h");
    testPreProcessor("test/pp/define3.h");
    testPreProcessor("test/pp/define4.h");
    testPreProcessor("test/pp/define5.h");
    testPreProcessor("test/pp/example1.h");
    testPreProcessor("test/pp/example2.h");
    testPreProcessor("test/pp/example3.h");
    testPreProcessor("test/pp/example4.h");
    testPreProcessor("test/pp/if_expr1.h");
    testPreProcessor("test/pp/if_expr2.h");
    testPreProcessor("test/pp/if.h");
    testPreProcessor("test/pp/ifdef.h");
    testPreProcessor("test/pp/ifndef.h");
    testPreProcessor("test/pp/recursion1.h");
    testPreProcessor("test/pp/recursion2.h");
    testPreProcessor("test/pp/include1.h");
    testPreProcessor("test/pp/pragma.h");
    testPreProcessor("test/pp/test.h");
}

void testPreProcessor(string filename) {

    dbg("Testing PreProcessor on file %s", filename);
    dbg("~~~~~~~~~~~~~~~~~~~~~~~");

    string[string] defines;
    string[] includeDirs = ["c:/pvmoore/d/libs/ctools/test/pp/incpath"];

    auto parseState = new ParseState(includeDirs, defines);

    auto tokens = parseState.preProcess(Filepath(filename));

    string src = cast(string)read(filename);
    auto expectedTokens = extractExpectedTokens(src);
    auto actualTokens = simpleStringOf(tokens, false, false);
    auto actualDefinitions = parseState.definitions;

    if(actualTokens != expectedTokens) {
        writefln("=======================================");
        writefln("Expected Tokens:\n\t%s\n", expectedTokens);
        writefln("Actual tokens:\n\t%s", actualTokens);
        writefln("=======================================\n");

        throw new Exception("Tokens are not correct");
    }
    writefln("PASS - %s", filename);

    //writefln("%s", .toString(actualDefinitions));
}
string extractExpectedTokens(string src) {
    auto s = src.indexOf("TOKENS:") + 8;
    auto e = src.lastIndexOf("*/");
    string value = src[s..e];
    return normaliseWhitespace(value);
}

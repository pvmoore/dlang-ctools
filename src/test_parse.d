module test_parse;

import std.file : read;
import std.stdio : writefln;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;

import ctools.all;
import test : normaliseWhitespace;

void testParser() {
    testParse("test/parse/cast.h");
    testParse("test/parse/enums.h");
    testParse("test/parse/expr1.h");
    testParse("test/parse/functions.h");
    testParse("test/parse/index.h");
    testParse("test/parse/member.h");
    testParse("test/parse/structs.h");
    testParse("test/parse/ternary.h");
    testParse("test/parse/typedef.h");
    testParse("test/parse/typedef2.h");
    testParse("test/parse/typedef3.h");
    testParse("test/parse/typedef4.h");
    testParse("test/parse/var.h");
    testParse("test/parse/test.h");
}

void testParse(string filename) {
    writefln("Testing Parser on file %s", filename);
    writefln("~~~~~~~~~~~~~~~~~~~~~~~");

    string[string] defines;
    string[] includeDirs;

    auto parseState = new ParseState(includeDirs, defines);

    auto tokens = parseState.preProcess(Filepath(filename));

    auto parser = new StmtParser(new TokenNavigator(tokens));
    Node root = parser.process();

    root.dump();

    string src = cast(string)read(filename);
    auto expected = normaliseWhitespace(readExpected(src));
    auto actual = normaliseWhitespace(root.dumpToString());

    if(actual != expected) {
        writefln("=======================================");
        writefln("expected : %s", expected);
        writefln("actual   : %s", actual);
        writefln("=======================================\n");

        throw new Exception("Results are not correct: %s".format(filename));
    }
    writefln("PASS - %s", filename);
}
string readExpected(string src) {
    auto s = src.indexOf("EXPECT:") + 7;
    auto e = src.lastIndexOf("*/");
    return src[s..e];
}
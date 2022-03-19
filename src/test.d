module test;

import std.file : read;
import std.stdio : writefln;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import ctools.all;

void main(string[] args) {

    //string file = "C:/pvmoore/cpp/cimgui/cimgui.h";
    //string file = "C:/work/VulkanSDK/1.3.204.1/Include/vulkan/vulkan.h";

    test("test/define0.h");
    test("test/define1.h");
    test("test/define2.h");
    test("test/define3.h");
    test("test/example1.h");
    test("test/example2.h");
    test("test/example3.h");
    test("test/example4.h");
    test("test/if_expr1.h");
    test("test/if_expr2.h");
    test("test/if.h");
    test("test/ifdef.h");
    test("test/ifndef.h");
    test("test/recursion1.h");
    test("test/recursion2.h");
    test("test/include1.h");
}

void test(string filename) {

    dbg("Testing %s", filename);
    dbg("~~~~~~~~~~~~~~~~~~~~~~~");

    string[string] defines;
    string[] includeDirs;

    auto parseState = new ParseState("test", includeDirs, defines);

    parseState.process(Filepath(filename));

    string src = cast(string)read(filename);
    auto expectedTokens = extractExpectedTokens(src);
    auto actualTokens = simpleStringOf(parseState.mainSource.tokens, false);
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
string normaliseWhitespace(string s) {
    string result;
    long start = 0, end = s.length-1;
    while(start<=end && s[start]<33) start++;
    while(end>=start && s[end]<33) end--;

    bool prevToken = true;

    while(start<=end) {
        if(s[start] < 33) {
            if(prevToken) {
                result ~= " ";
            }
            prevToken = false;
        } else {
            result ~= s[start];
            prevToken = true;
        }
        start++;
    }
    return result;
}
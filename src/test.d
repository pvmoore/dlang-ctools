module test;

import std.file : read;
import std.stdio : writefln;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;
import ctools.all;

void main(string[] args) {

    //string file = "C:/pvmoore/cpp/cimgui/cimgui.h";

    bool doTestPreProcessor = false;
    bool doParseVulkan      = true;

    if(doTestPreProcessor) {
        testPreProcessor("test/pp/define0.h");
        testPreProcessor("test/pp/define1.h");
        testPreProcessor("test/pp/define2.h");
        testPreProcessor("test/pp/define3.h");
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

        testPreProcessor("test/pp/define4.h");
    }
    if(doParseVulkan) {
        parseVulkan();
    }

    if(false) {
        auto a = environment.toAA();
        writefln("Environment:");
        foreach(e; a.byKeyValue()) {
            writefln("\t%s = %s", e.key, e.value);
        }
    }
}

void parseVulkan() {
    dbg("\nParsing vulkan");
    dbg("~~~~~~~~~~~~~~~~");

    string[string] defines = [
        "__STDC__" : "1",
        "_MSC_VER" : "1920",            // VS 2019
        "_WIN32" : "1",
        "_WIN64" : "1",
        "_AMD64_" : "",
        "_M_AMD64" : "100",
        "VK_USE_PLATFORM_WIN32_KHR": "1",
        "WIN32_LEAN_AND_MEAN" : "1",
    ];
    string[] includeDirs;
    //  = [
    //     "C:/Program Files (x86)/Windows Kits/10/Include/10.0.22000.0/ucrt",
    //     "C:/Program Files (x86)/Windows Kits/10/Include/10.0.22000.0/um",
    //     "C:/Program Files (x86)/Windows Kits/10/Include/10.0.22000.0/shared",
    //     "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.31.31103/include"
    // ];

    string windowsSdkDir = environment.get("WINDOWSSDKDIR");
    string windowsSdkVer = environment.get("WINDOWSSDKVERSION");
    string vcToolsInstallDir = environment.get("VCTOOLSINSTALLDIR");
    string vulkanSdk = environment.get("VULKAN_SDK");

    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/ucrt";
    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/um";
    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/shared";
    includeDirs ~= vcToolsInstallDir ~ "include";

    writefln("Include dirs:");
    foreach(d; includeDirs) {
        writefln("\t%s", d);
    }

    auto parseState = new ParseState(includeDirs, defines);

    parseState.dumpDirectory = "target";
    parseState.dumpIncludeFiles = true;
    parseState.dumpIncludeTokens = true;

    string vulkanH = vulkanSdk ~ "/Include/vulkan/vulkan.h";

    auto tokens = parseState.preProcess(Filepath(vulkanH));

    {   // Serialise tokens
        auto fw = new FileByteWriter("target/tokens.dat");
        scope(exit) fw.close();
        auto hash = "%s-%s".format(tokens.length, (Clock.currTime().as!Date).toISOExtString());
        writefln("hash = %s", hash);
        Serialiser.begin(fw, hash);
    }

    if(false) {
        writefln("Definitions:");
        foreach(e; parseState.definitions.byKeyValue()) {
            writefln("\t%s = %s", e.key, e.value);
        }
    }

    // tokens = 148,265

    writefln("Preprocess time %s seconds", parseState.preprocessTime.peek().total!"nsecs"/1_000_000_000.0);

    writefln("\nstate.log = \n%s", parseState.log);
    //writefln("_Field_range_ = %s", parseState.definitions.get("_Field_range_").toString());
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
    auto actualTokens = simpleStringOf(tokens, false);
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
module test;

import std.file : read;
import std.stdio : writefln;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;

import ctools.all;
import test_parse;
import test_preprocess;
import test_extractor;

///
/// Show GC stats after program exits
///
// extern(C) __gshared string[] rt_options = [
//     "gcopt=profile:1"
// ];

void main(string[] args) {
    // C:\Program Files (x86)\Windows Kits\10\include\10.0.22000.0\ucrt
    // C:\Program Files (x86)\Windows Kits\10\include\10.0.22000.0\um
    // C:\Program Files (x86)\Windows Kits\10\include\10.0.22000.0\shared
    // C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.31.31103\include

    //string file = "C:/pvmoore/cpp/cimgui/cimgui.h";

    // if(true) {
    //     parseSingleFile();
    //     float aa = 0; if(aa < 1) return;
    // }

    if(true) {
        testPreProcessor();
    }
    if(true) {
        testParse();
    }
    if(true) {
        parseVulkan();

        if(true) {
            testExtractor();
        }
    }

    if(false) {
        auto a = environment.toAA();
        writefln("Environment:");
        foreach(e; a.byKeyValue()) {
            writefln("\t%s = %s", e.key, e.value);
        }
    }
}

void parseSingleFile() {
    string dir = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.31.31103\\include\\";

    string[string] defines;
    string[] includeDirs;

    string windowsSdkDir = environment.get("WINDOWSSDKDIR");
    string windowsSdkVer = environment.get("WINDOWSSDKVERSION");
    string vcToolsInstallDir = environment.get("VCTOOLSINSTALLDIR");

    string shared_ = windowsSdkDir ~ "include\\" ~ windowsSdkVer ~ "shared";

    includeDirs ~= windowsSdkDir ~ "include\\" ~ windowsSdkVer ~ "ucrt";
    includeDirs ~= windowsSdkDir ~ "include\\" ~ windowsSdkVer ~ "um";
    includeDirs ~= shared_;
    includeDirs ~= vcToolsInstallDir ~ "include";

    writefln("Include dirs:");
    foreach(d; includeDirs) {
        writefln("\t%s", d);
    }

    auto parseState = new ParseState(includeDirs, defines);
    parseState.dumpDirectory = "target";
    parseState.dumpIncludeFilenames = true;
    parseState.dumpIncludeTokens = true;

    auto tokens = parseState.preProcess(Filepath(shared_ ~ "\\driverspecs.h"));


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

    string windowsSdkDir = environment.get("WINDOWSSDKDIR");
    string windowsSdkVer = environment.get("WINDOWSSDKVERSION");
    string vcToolsInstallDir = environment.get("VCTOOLSINSTALLDIR");
    string vulkanSdk = environment.get("VULKAN_SDK");

    string[] includeDirs;
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
    parseState.dumpIncludeFilenames = true;
    parseState.dumpIncludeTokens = false;

    string vulkanH = vulkanSdk ~ "/Include/vulkan/vulkan.h";

    auto tokens = parseState.preProcess(Filepath(vulkanH));

    {   // Serialise tokens
        auto fw = new FileByteWriter("target/tokens.dat");
        scope(exit) fw.close();
        auto hash = "%s-%s".format(tokens.length, (Clock.currTime().as!Date).toISOExtString());
        writefln("hash = %s", hash);
        Serialiser.begin(fw, hash);
    }

    if(true) {
        auto f = File("target/defs.txt", "w");
        f.writefln("Definitions:");
        foreach(e; parseState.definitions.byKeyValue()) {
            f.writefln("\t%s = %s", e.key, e.value);
        }
    }

    writefln("\nstate.log = \n%s", parseState.log);
    //writefln("_Field_range_ = %s", parseState.definitions.get("_Field_range_").toString());

    auto parent = parseState.parse(tokens);

    // auto parser = new StmtParser(new TokenNavigator(tokens));
    // parser.process();

    writefln("Preprocess time %s seconds", parseState.preprocessTime.peek().total!"nsecs"/1_000_000_000.0);
    writefln("Parse time %s seconds", parseState.parseTime.peek().total!"nsecs"/1_000_000_000.0);

    // 250 seconds
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
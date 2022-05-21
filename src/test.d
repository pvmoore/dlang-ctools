module test;

import std.file : read;
import std.stdio : writefln, File;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;

import common;
import ctools;
import test_parse;
import test_preprocess;
import processor_vulkan;
import processor_glfw;

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
        testParser();
    }

    // Extract Vulkan
    if(true) {
        import extractor;

        auto vulkanProcessor = new VulkanProcessor();
        vulkanProcessor.process();
    }

    // Extract GLFW
    if(true) {

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
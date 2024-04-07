module test;

import std.file : read;
import std.stdio : writefln, File;
import std.format : format;
import std.string : indexOf, lastIndexOf;
import std.datetime : Date, DateTime, Clock;
import std.process : environment;

import common;
import ctools;
import extractor;

import test_parse;
import test_preprocess;
import processor.base;
import processor.cimgui;
import processor.vulkan;
import processor.java.glfw_to_java;
import processor.java.vulkan_to_java;
import processor.glfw;

///
/// Show GC stats after program exits
///
// extern(C) __gshared string[] rt_options = [
//     "gcopt=profile:1"
// ];

void main(string[] args) {

    enum : int {
        D_VULKAN, D_GLFW, D_CIMGUI,
        J_VULKAN, J_GLFW,
        TESTS, 
        ENV
    }

    int p = J_VULKAN;
    //int p = J_GLFW;
    //int p = D_GLFW;

    Processor processor; 

    final switch(p) {
        case D_VULKAN: processor = new VulkanProcessor(); break;
        case D_GLFW: processor = new GLFWProcessor(); break;
        case D_CIMGUI: processor = new CImguiProcessor(); break;
        case J_VULKAN: processor = new VulkanToJavaProcessor(); break;
        case J_GLFW: processor = new GlfwToJavaProcessor(); break;
        case TESTS:
            testPreProcessor();
            testParser();
            break;
        case ENV:
            auto a = environment.toAA();
            writefln("Environment:");
            foreach(e; a.byKeyValue()) {
                writefln("\t%s = %s", e.key, e.value);
            }
            break;
    }

    if(processor) processor.process();

    writefln("Done");
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

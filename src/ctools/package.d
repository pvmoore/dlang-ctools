module ctools;

public:

import common;

import ctools.ParseState;
import ctools.Serialiser;
import ctools.version_;

import ctools.lex;
import ctools.preprocess;
import ctools.parse;

enum string[string] WIN64_DEFINES = [
    "__STDC__" : "1",
    "_MSC_VER" : "1920",            // VS 2019
    "_WIN32" : "1",
    "_WIN64" : "1",
    "_AMD64_" : "",
    "_M_AMD64" : "100",
    "VK_USE_PLATFORM_WIN32_KHR": "1",
    "WIN32_LEAN_AND_MEAN" : "1",
];

string[] getWindowsSDKIncludeDirs() {
    import std.process : environment;
    import std.stdio: writefln;

    string windowsSdkDir = environment.get("WINDOWSSDKDIR");
    string windowsSdkVer = environment.get("WINDOWSSDKVERSION");
    string vcToolsInstallDir = environment.get("VCTOOLSINSTALLDIR");

    string[] includeDirs;
    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/ucrt";
    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/um";
    includeDirs ~= windowsSdkDir ~ "include/" ~ windowsSdkVer ~ "/shared";
    includeDirs ~= vcToolsInstallDir ~ "include";

    writefln("Include dirs:");
    foreach(d; includeDirs) {
        writefln("\t%s", d);
    }
    return includeDirs;
}
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
    "_M_X64" : "100",
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

    return includeDirs;
}
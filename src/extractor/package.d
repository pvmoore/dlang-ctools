module extractor;

public:

import std.stdio    : File;
import std.regex    : Regex, regex, matchFirst;
import std.process  : environment;

import extractor.CharByteEval;
import extractor.EConfig;
import extractor.EmitDLLLoader;
import extractor.Emitter;
import extractor.Extractor;

T[] getOrderedValues(T)(T[string] map) {
    import std : sort,array;
    static if(__traits(compiles, map[""].name)) {
        alias cmp = (a,b)=>a.name<b.name;
    } else {
        alias cmp = (a,b)=>a.getName()<b.getName();
    }
    return map.values().sort!cmp().array;
}
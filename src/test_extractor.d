module test_extractor;

import std.stdio : writefln;
import extractor.all;

void testExtractor(Node parent) {
    writefln("Testing Extractor");

    auto config = new EConfig();
    config.requiredFunctionNames.add("vkEnumerateInstanceVersion");


    auto extractor = new Extractor(config);
    extractor.process(parent);
}
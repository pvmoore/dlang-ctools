module test_extractor;

import std.stdio : writefln;
import extractor.all;

void testExtractor(Node parent) {
    writefln("Testing Extractor");

    auto vulkanExtractor = new VulkanExtractor();
    vulkanExtractor.process(parent);
}
module processor_cimgui;

import processor_common;

final class CImguiProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
public:
    void process() {
        prepare();

        parseState.dumpIncludeTokens = true;

        string base = "C:/pvmoore/cpp/cimgui/";
        string cimguiH = base ~ "cimgui.h";

        parse(Filepath(cimguiH));

        extract();
    	emit();
    }
protected:
    override void adjustDefines(ref string[string] defines) {
        //defines["GLFW_INCLUDE_VULKAN"] = "1";
        defines["CIMGUI_FREETYPE"] = "1";
        defines["CIMGUI_DEFINE_ENUMS_AND_STRUCTS"] = "1";
    }
    override void adjustIncludes(ref string[] includeDirs) {
        //string vulkanSdk = environment.get("VULKAN_SDK");
        //string vulkanH = vulkanSdk ~ "/I";

        //includeDirs ~= "c:/pvmoore/cpp/cimgui/imgui/";
    }
private:
    void extract() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= regex(r"^(ImGui|ig).*$");
        config.requiredTypeRegexes ~= regex(r"^ImGui.*$");

        config.excludeRegexes ~= regex(r"^(FILE|_iobuf)$");
        //config.excludeRegexes ~= regex(r"^_iobuf.*$");

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {

        enum string[] COMMENTS = [
            "CImgui include files converted to D (This is a generated file)",
            "",
            "Usage:",
            "  ** Start program",
            "  CImguiLoader.load();",
            "  ** ",
            "  CImguiLoader.unload();",
            "  ** Exit program"
        ];

        enum string[] INCLUDES = [
            "core.stdc.stdio"
        ];

        auto flags = Emitter.Flag.UNQUALIFIED_ENUM;

        this.emitter = new Emitter(extractor, flags);

        import std : map, array;
        auto loader = new EmitDLLLoader("CImguiLoader", "cimgui.dll")
            .loadFunctions(extractor.getOrderedValues(extractor.funcDecls)
                                              .map!(it=>it.name)
                                              .array);

        emitter.add(new Comment(COMMENTS));
        emitter.add(new Includes(INCLUDES));
        emitter.add(loader);

        emitter.emitTo("_emit_cimgui.d");
    }
}

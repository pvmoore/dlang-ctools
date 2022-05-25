module processor_glfw;

import processor_common;

final class GLFWProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
public:
    void process() {
        prepare();

        parseState.dumpIncludeTokens = false;

        string base = "C:/work/glfw-3.3.7.bin.WIN64/";
        string glfwH = base ~ "include/GLFW/glfw3.h";

        parse(Filepath(glfwH));
        extract();
    	emit();
    }
protected:
    override void adjustDefines(ref string[string] defines) {
        defines["GLFW_INCLUDE_VULKAN"] = "1";
        defines["VK_USE_PLATFORM_WIN32_KHR"] = "1";
    }
    override void adjustIncludes(ref string[] includeDirs) {
        string vulkanSdk = environment.get("VULKAN_SDK");
        string vulkanH = vulkanSdk ~ "/Include/";

        includeDirs ~= vulkanH;
    }
private:
    void extract() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= regex(r"^glfw.*");

        config.excludeRegexes ~= regex(r"^(Vk|vk).*");

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {

        enum string[] COMMENTS = [
            "GLFW include files converted to D (This is a generated file)",
            "",
            "Usage:",
            "  ** Start program",
            "  GLFWLoader.load();",
            "  ** ",
            "  GLFWLoader.unload();",
            "  ** Exit program"
        ];

        auto de = new DefineEmitter(
            parseState.definitions,
            [regex(r"^GLFW_.*")]
        );
        enum string[] INCLUDES = [
            "vulkan_api"
        ];

        this.emitter = new Emitter(extractor, "glfw_api");

        emitter.add(new Includes(INCLUDES));
        emitter.add(de);

        emitter.emitTo("generated/glfw_api.d");
    }
}
module processor.glfw;

import processor.base;
/** 
 * Updating:
 *
 * 1) Download latest windows package -> https://www.glfw.org/download.html
 * 2) Copy glfw.dll to location accessible in %PATH%
 * 3) Update enums below.
 */
final class GLFWProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
    enum glfwVersion = "3.4";
    enum glfwPath = "C:/work/glfw-3.4.bin.WIN64/";
    enum dllName = "glfw3.4.dll";
public:
    override void process() {
        prepare();

        parseState.dumpIncludeTokens = true;

        string glfwH = glfwPath ~ "include/GLFW/glfw3.h";
        string glfwNativeH = glfwPath ~ "include/GLFW/glfw3native.h";

        parse(Filepath(glfwH), Filepath(glfwNativeH));
        extract();
    	emit();
    }
protected:
    override void adjustDefines(ref string[string] defines) {
        defines["GLFW_INCLUDE_VULKAN"] = "1";
        defines["VK_USE_PLATFORM_WIN32_KHR"] = "1";
        defines["GLFW_EXPOSE_NATIVE_WIN32"] = "1";
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

        config.requiredTypeRegexes ~= [
            regex(r"^GLFW.*")
        ];

        config.excludeRegexes ~= regex(r"^(Vk|vk).*");
        config.excludeRegexes ~= regex(r"HWND");
        config.excludeRegexes ~= regex(r"^GUID$");

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {

        enum string[] COMMENTS = [
            "GLFW %s Include files converted to D (This is a generated file)".format(glfwVersion),
            "",
            "Usage:",
            "  ** Start program",
            "  GLFWLoader.load();",
            "  ** ",
            "  GLFWLoader.unload();",
            "  ** Exit program"
        ];

        enum string[] INCLUDES = [
            "vulkan_api",
            "core.sys.windows.windows : HWND"
        ];

        auto de = new DefineEmitter(
            parseState.definitions,
            [regex(r"^GLFW_.*")]
        );
        
        import std : map, array;
        auto loader = new EmitDLLLoader("GLFWLoader", dllName)
            .loadFunctions(getOrderedValues(extractor.funcDecls)
                                              .map!(it=>it.name)
                                              .array);

        auto flags = Emitter.Flag.QUALIFIED_ENUM;

        this.emitter = new Emitter(extractor, "glfw_api", flags);

        emitter.privateImports(INCLUDES);

        emitter.add(new Comment(COMMENTS));
        emitter.add(loader);
        emitter.add(de);

        emitter.emitTo("generated/glfw_api.d");
    }
}

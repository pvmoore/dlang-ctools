module processor_vulkan;

import processor_common;

final class VulkanProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
    enum vulkanVersion = "1.3.211.0";
public:
    void process() {
        prepare();

        string vulkanSdk = environment.get("VULKAN_SDK");
        string vulkanH = vulkanSdk ~ "/Include/vulkan/vulkan.h";

        parse(Filepath(vulkanH));
        extract();
    	emit();
    }
protected:
    override void adjustDefines(ref string[string] defines) {
        defines["VK_USE_PLATFORM_WIN32_KHR"] = "1";
    }
    override void adjustIncludes(ref string[] includeDirs) {

    }
private:
    void extract() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= [
            regex(r"^vk.*$")];
        config.requiredTypeRegexes ~= [
            regex(r"^Vk.*$")
        ];
        config.requiredTypedefRegexes ~= regex(r"^PFN_vk.*$");

        config.excludeRegexes ~= [
            regex(r"^(HINSTANCE|HMONITOR|HWND)$")
        ];

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {
        enum string[] COMMENTS = [
            "Vulkan %s Include files converted to D (This is a generated file)".format(vulkanVersion),
            "",
            "Usage:",
            "  ** Start program",
            "  VulkanLoader.load();",
            "  vkLoadGlobalCommandFunctions();",
            "  ** Create your VkInstance here",
            "  vkLoadInstanceFunctions(instance);",
            "  ** ",
            "  VulkanLoader.unload();",
            "  ** Exit program"
        ];

        auto flags = Emitter.Flag.UNQUALIFIED_ENUM |
                     Emitter.Flag.QUALIFIED_ENUM;

        auto extraDefs = [
            "VK_NULL_HANDLE" : "null",
            "VK_TRUE" : "1",
            "VK_FALSE" : "0",
            "VK_QUEUE_FAMILY_IGNORED" : "(~0U)",
            "VK_REMAINING_MIP_LEVELS" : "(~0U)",
            "VK_REMAINING_ARRAY_LAYERS" : "(~0U)",
            "VK_SUBPASS_EXTERNAL" : "(~0U)",
            "VK_WHOLE_SIZE" : "(~0UL)",
        ];

        auto funcDecls = getOrderedValues(extractor.funcDecls);

        writefln("emitting...");

        this.emitter = new Emitter(extractor, "vulkan_api", flags)
            .privateImports(["core.sys.windows.windows"])
            .extraDefinitions(extraDefs);

        emitter.add(new Comment(COMMENTS));

        emitter.add(new EmitDLLLoader("VulkanLoader", "vulkan-1.dll")
                        .loadFunctions("vkGetInstanceProcAddr"));

        emitter.add(new LoadGlobalCommandFunctions(funcDecls));
        emitter.add(new LoadInstanceFunctions(funcDecls));

        emitter.emitTo("generated/vulkan_api.d");
    }
}

private __gshared string[] GLOBAL_CMD_FUNCS = [
    "vkEnumerateInstanceVersion",
    "vkEnumerateInstanceExtensionProperties",
    "vkEnumerateInstanceLayerProperties",
    "vkCreateInstance",
];

class LoadGlobalCommandFunctions : Emitter.Plugin {
protected:
    FuncDecl[] funcDecls;
public:
    this(FuncDecl[] funcDecls) {
        this.funcDecls = funcDecls;
    }
    bool accept(FuncDecl fd) {
        return fd.name.isOneOf(GLOBAL_CMD_FUNCS);
    }
    override void emit(File file) {
        prolog(file);
        foreach(fd; funcDecls) {
            if(accept(fd)) {
                load(file, fd);
            }
        }
        epilog(file);
    }
    void prolog(File file) {
        file.writefln("// Load Global Command Functions");
        file.writefln("void vkLoadGlobalCommandFunctions() {");
        file.writefln("\timport std.string : toStringz;");
        file.writefln("\timport common : throwIf;");
    }
    void epilog(File file) {
        file.writefln("}");
    }
    void load(File file, FuncDecl fd) {
        file.writef("\t*(cast(void**)&%s) = vkGetInstanceProcAddr(null, toStringz(\"%s\"));", fd.name, fd.name);
        file.writefln(" throwIf(!%s);", fd.name);
    }
}

final class LoadInstanceFunctions : LoadGlobalCommandFunctions {
private:
public:
    this(FuncDecl[] funcDecls) {
        super(funcDecls);
    }
    override bool accept(FuncDecl fd) {
        return !fd.name.isOneOf(GLOBAL_CMD_FUNCS) &&
            fd.name!="vkGetInstanceProcAddr" &&
            !fd.name.startsWith("PFN_");
    }
protected:
    override void prolog(File file) {
        file.writefln("// Load Instance Functions");
        file.writefln("void vkLoadInstanceFunctions(VkInstance instance) {");
        file.writefln("\timport std.string : toStringz;");
        file.writefln("\timport common : throwIf;");
    }
    override void load(File file, FuncDecl fd) {
        file.writef("\t*(cast(void**)&%s) = vkGetInstanceProcAddr(instance, toStringz(\"%s\"));", fd.name, fd.name);
    }
}
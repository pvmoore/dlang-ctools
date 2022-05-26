module processor_vulkan;

import processor_common;

final class VulkanProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
    enum vulkanVersion = "1.2.141.2";
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

        config.requiredFunctionRegexes ~= regex(r"^vk.*");
        config.requiredTypeRegexes ~= regex(r"^Vk.*");

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
            "  ** Create your VkInstance here",
            "  vkLoadInstanceFunctions(instance);",
            "  ** ",
            "  VulkanLoader.unload();",
            "  ** Exit program"
        ];

        auto flags = Emitter.Flag.UNQUALIFIED_ENUM |
                     Emitter.Flag.QUALIFIED_ENUM;

        this.emitter = new Emitter(extractor, "vulkan_api", flags);
        emitter.add(new Comment(COMMENTS));
        emitter.add(new EmitDLLLoader("VulkanLoader", "vulkan-1.dll")
                        .loadFunctions("vkGetInstanceProcAddr"));

        emitter.add(new LoadInstanceFunctions(extractor.getOrderedValues(extractor.funcDecls)));
        emitter.emitTo("generated/vulkan_api.d");
    }
}


final class LoadInstanceFunctions : Emitter.Plugin {
private:
    FuncDecl[] funcDecls;
public:
    this(FuncDecl[] funcDecls) {
        this.funcDecls = funcDecls;
    }
    override void emit(File file) {
        prolog(file);
        foreach(fd; funcDecls) {
            if(fd.name!="vkGetInstanceProcAddr" && !fd.name.startsWith("PFN_")) {
                load(file, fd);
            }
        }
        epilog(file);
    }
private:
    void prolog(File file) {
        file.writefln("// Load Instance Functions");
        file.writefln("void vkLoadInstanceFunctions(VkInstance instance) {");
        file.writefln("\timport common : throwIf;");
    }
    void epilog(File file) {
        file.writefln("}");
        file.writefln("// End Load Instance Functions\n");
    }
    void load(File file, FuncDecl fd) {
        file.writef("\t*(cast(void**)&%s) = vkGetInstanceProcAddr(instance, \"%s\");", fd.name, fd.name);
        file.writefln(" throwIf(!%s);", fd.name);
    }
}
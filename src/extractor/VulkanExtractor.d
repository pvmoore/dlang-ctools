module extractor.VulkanExtractor;

import extractor.all;

final class VulkanExtractor {
private:
    EConfig config;
public:
    this() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= regex("vk.*");

        config.requiredFunctionNames.add([
            "vkCreateInstance",
            "vkGetInstanceProcAddr",
            "vkGetPhysicalDeviceQueueFamilyProperties",
            "vkEnumerateInstanceVersion",
            "vkEnumeratePhysicalDevices",
            "vkDestroyInstance"
        ]);
        // config.requiredStructNames.add([

        // ]);
        config.requiredEnumNames.add([
            "VkQueueFlagBits"
        ]);
    }
    void process(Node parent) {

        auto extractor = new Extractor(config);
        extractor.process(parent);

        auto emitter = new Emitter(extractor);
        emitter.add(new Comment());
        emitter.add(new EmitDLLLoader("VulkanLoader", "vulkan-1.dll")
                        .loadFunctions("vkGetInstanceProcAddr"));
        emitter.add(new LoadInstanceFunctions(extractor.funcDecls.values()));
        emitter.emitTo("_emit.d");
    }
}

final class Comment : Emitter.Plugin {
private:
    enum string[] LINES = [
        "Vulkan include files converted to D (This is a generated file)",
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

public:
    override void emit(File file) {
        foreach(line; LINES) {
            file.writefln("// %s", line);
        }
        file.writeln();
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
    }
    void epilog(File file) {
        file.writefln("}");
        file.writefln("// End Load Instance Functions\n");
    }
    void load(File file, FuncDecl fd) {
        file.writefln("\t*(cast(void**)&%s) = vkGetInstanceProcAddr(instance, \"%s\");", fd.name, fd.name);
    }
}
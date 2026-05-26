module processor.vma;

import processor.base;

/**
 *  Create loader for Vulkan Memory Allocator.   
 *  @see https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator
 *
 *  1) Where to get the vm_alloc.h header file:
 *
 *     a) Download from https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator 
 *
 *        or
 *
 *     b) Enable the Vulkan Memory Allocator option when installing the VulkanSDK and the vk_alloc.h header should
 *        be in the %VULKAN_SDK%\include\vma folder.
 *
 *  2) How to generate the vma shared lib:
 *
 *  Create a c++ project with a vma.h header containing:
 *
 *    #include <vulkan/vulkan.h>
 *    #define VMA_CALL_PRE extern "C" __declspec(dllexport)
 *    #define VMA_CALL_POST
 *    #include "vk_mem_alloc.h"
 *
 *  Create a vma.cpp containing:
 *
 *    // Vulkan 1.4
 *    #define VMA_VULKAN_VERSION 1004000  
 *
 *    #define VMA_DEDICATED_ALLOCATION 1
 *    #define VMA_BIND_MEMORY2 1
 *    #define VMA_MEMORY_BUDGET 1
 *    #define VMA_EXTERNAL_MEMORY 1
 *    #define VMA_EXTERNAL_MEMORY_WIN32 1
 *    #define VMA_BUFFER_DEVICE_ADDRESS 1
 *    #define VMA_MEMORY_PRIORITY 1
 *    #define VMA_KHR_MAINTENANCE4 1
 *    #define VMA_KHR_MAINTENANCE5 1
 *    #define VMA_STATIC_VULKAN_FUNCTIONS 0
 *    #define VMA_DYNAMIC_VULKAN_FUNCTIONS 0
 *    #define VK_USE_PLATFORM_WIN32_KHR 1
 *    #define VMA_IMPLEMENTATION
 *    #include "vma.h"
 *
 *  Adjust VMA_CALL_PRE and VMA_CALL_POST to match your OS. The above example is for windows.
 *  Adjust the defines above to match your Vulkan version and desired features. I have enabled everything.
 *
 *  Build the shared library:
 *
 *    clang -O3 -I%VULKAN_SDK%\include vma.cpp --target=x86_64-pc-windows-msvc -shared -o vma-3.4.0.dll
 *
 *  Other compilers and operating systems are available.
 *
 *  3) Run this processor to generate vma_api.d and include that and the shared lib in your project.
 *     a) Set the vulkanVersion and vmaVersion enums appropriately.
 */
final class VmaProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
    enum vulkanVersion = "1.4.350.0";
    enum vmaVersion    = "3.4.0";
    enum dllName       = "vma-%s.dll".format(vmaVersion);
    enum dllNameDebug  = "vma-%s-debug.dll".format(vmaVersion);
public:
    override void process() {
        prepare();

        string vk_mem_alloc_h = getVulkanSdkDirectory() ~ "/Include/vma/vk_mem_alloc.h";

        parse(Filepath(vk_mem_alloc_h));
        extract();
    	emit();
    }
protected:
    override void adjustDefines(ref string[string] defines) {
        defines["VMA_VULKAN_VERSION"] = "1004000";  // 1.4

        // Vulkan 1.1
        defines["VMA_DEDICATED_ALLOCATION"] = "1";  // VK_KHR_get_memory_requirements2 && VK_KHR_dedicated_allocation
        defines["VMA_BIND_MEMORY2"] = "1";          // VK_KHR_bind_memory2
        defines["VMA_MEMORY_BUDGET"] = "1";         // VK_EXT_memory_budget && (VK_KHR_get_physical_device_properties2 || VMA_VULKAN_VERSION >= 1001000)
        defines["VMA_EXTERNAL_MEMORY"] = "1";       // VK_KHR_external_memory
        defines["VMA_EXTERNAL_MEMORY_WIN32"] = "1"; // VK_KHR_external_memory_win32

        // Vulkan 1.2
        defines["VMA_BUFFER_DEVICE_ADDRESS"] = "1"; // VK_KHR_buffer_device_address || VMA_VULKAN_VERSION >= 1002000

        // Not guaranteed but Probably available :)
        defines["VMA_MEMORY_PRIORITY"] = "1";       // VK_EXT_memory_priority

        // Vulkan 1.3
        defines["VMA_KHR_MAINTENANCE4"] = "1";      // VK_KHR_maintenance4

        // Vulkan 1.4
        defines["VMA_KHR_MAINTENANCE5"] = "1";      // VK_KHR_maintenance5

        defines["VK_USE_PLATFORM_WIN32_KHR"] = "1";
    }
    override void adjustIncludes(ref string[] includeDirs) {
        string vulkanH = getVulkanSdkDirectory() ~ "/Include/";
        includeDirs ~= vulkanH;
    }
private:
    string getVulkanSdkDirectory() {
        string vulkanSdk = environment.get("VULKAN_SDK");
        if(vulkanSdk is null) {
            vulkanSdk = "C:\\work\\VulkanSDK\\%s".format(vulkanVersion);
        }
        return vulkanSdk;
    }
    void extract() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= [
            regex(r"^vma.*$")
        ];
        config.requiredTypeRegexes ~= [
            regex(r"^Vma.*$")
            //regex(r"^Std.*")
        ];
        config.requiredTypedefRegexes = [
            regex(r"^(PFN_vma|Vk).*$")
        ];
        // config.excludeRegexes ~= [
        //     regex(r"^(HINSTANCE|HMONITOR|HWND)$"),
        //     regex(r".*(__security_cookie|GUID).*")
        // ];

        config.excludeRegexes = [ 
            regex(r"^(Vk|vk).*"),
            regex(r"HWND"),
            regex(r"^GUID$")
        ];

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {
        enum string[] COMMENTS = [
            "Vulkan Memory Allocator %s Include file converted to D (This is a generated file)".format(vmaVersion),
            "",
            "Generated by CTools (https://github.com/pvmoore/dlang-CTools)",
            "",
            "Usage:",
            "  ** Start program",
            "  VMALoader.load();",
            "  ** ",
            "  VMALoader.unload();",
            "  ** Exit program"
        ];


        string[] privateImports =[
            "vulkan.api.vulkan_api"
        ];

        string[string] extraDefs; 
        string[string] extraAliases;

        writefln("emitting...");

        import std : map, array;
        auto loader = new EmitDLLLoader("VMALoader", dllName, false)
            .setDebugLibraryName(dllNameDebug)
            .loadFunctions(getOrderedValues(extractor.funcDecls)
                                              .map!(it=>it.name)
                                              .array);

        auto flags = Emitter.Flag.UNQUALIFIED_ENUM | Emitter.Flag.QUALIFIED_ENUM;

        this.emitter = new Emitter(extractor, "vma_api", flags)
            .privateImports(privateImports)
            .extraDefinitions(extraDefs)
            .extraAliases(extraAliases);

        emitter.add(new Comment(COMMENTS));

        emitter.add(loader);

        emitter.emitTo("generated/vma_api.d");
    }
}

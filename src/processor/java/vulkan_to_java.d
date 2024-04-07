module processor.java.vulkan_to_java;

import processor.base;
import processor.java._helper;

final class VulkanToJavaProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    JavaEmitter emitter;
    enum vulkanVersion = "1.3.275.0";
public:
    override void process() {
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
        string vulkanSdk = environment.get("VULKAN_SDK");
        includeDirs ~= vulkanSdk ~ "/Include";
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
        writefln("Emitting...");

        //auto funcDecls = getOrderedValues(extractor.funcDecls);

        this.emitter = new JavaEmitter(extractor);

        auto targetModuleRoot = "C:/pvmoore/JVM/libs/ffi/vulkan/src/main/java/";

        emitter.withCallback(new VulkanToJavaCallback(emitter, vulkanVersion, targetModuleRoot));

        emitter.emit();
    }
}
//══════════════════════════════════════════════════════════════════════════════════════════════════
private:

__gshared string[] GLOBAL_CMD_FUNCS = [
    "vkEnumerateInstanceVersion",
    "vkEnumerateInstanceExtensionProperties",
    "vkEnumerateInstanceLayerProperties",
    "vkCreateInstance",
];
// __gshared string[] OPAQUE_HANDLES = [
//     "VkDevice",
//     "VkPhysicalDevice"
// ];
//══════════════════════════════════════════════════════════════════════════════════════════════════
final class VulkanToJavaCallback : JavaEmitter.Callback {
private:
    JavaEmitter emitter;
    string vulkanVersion;
    string targetModuleRoot;
    StringBuffer enumsBuf, loaderBuf, loaderHandles;
    StringBuffer[string] opaqueHandleBuffers;

    enum FUNCTIONS_IMPORTS =
        "import lombok.extern.slf4j.Slf4j;\n" ~
        "import java.lang.foreign.*;\n" ~
        "import java.lang.invoke.MethodHandle;\n" ~
        "import pvmoore.ffi.vulkan.opaque.*;\n" ~
        "import pvmoore.ffi.common.*;\n" ~
        "import static pvmoore.ffi.common.NativeMemory.*;\n" ~
        "import static pvmoore.ffi.common.Utils.isNULL;\n" ~
        "import static java.lang.foreign.ValueLayout.*;\n" ~
        //"import static java.lang.foreign.MemorySegment.NULL;\n\n" ~
        "\n";
    enum FUNCTIONS_PREFIX_1 =        
        "@Slf4j\n" ~
        "public final class Functions {\n";
    enum FUNCTIONS_PREFIX_2 =
        "\n" ~
        "\tpublic static void vkLoadInstanceFunctions(MethodHandle vkGetInstanceProcAddr, VkInstance instance) {\n" ~
        "\t\ttry{\n" ~
        "\n" ~
        "\t\t\tLinker linker = Linker.nativeLinker();\n";

    enum FUNCTIONS_SUFFIX =
        "\t\t} catch(Throwable t) {\n" ~
        "\t\t\tthrow new RuntimeException(t);\n" ~
        "\t\t}\n" ~
        "\t}\n" ~
        "}\n";
    enum OPAQUE_IMPORTS =
        //"import lombok.extern.slf4j.Slf4j;\n" ~
        "import pvmoore.ffi.common.Pointer;\n" ~
        "import pvmoore.ffi.vulkan.Functions;\n" ~
        "import pvmoore.ffi.vulkan.structs.*;\n" ~
        "import java.lang.foreign.*;\n" ~
        "import static java.lang.foreign.MemorySegment.NULL;\n" ~
        "\n";
    enum OPAQUE_SUFFIX =
        "}\n";
public:
    this(JavaEmitter emitter, string vulkanVersion, string targetModuleRoot) {
        this.emitter = emitter;
        this.vulkanVersion = vulkanVersion;
        this.targetModuleRoot = targetModuleRoot;
        this.enumsBuf = new StringBuffer();
        this.loaderBuf = new StringBuffer();
        this.loaderHandles = new StringBuffer();
    }
    override void begin() {
        enumsBuf.add("package pvmoore.ffi.vulkan;\n\n");
        enumsBuf.add(getHeaderComment());
        enumsBuf.add("public final class Enums {\n");
    }
    override void end() {
        enumsBuf.add("}\n");

        auto enumsFile = File(targetModuleRoot ~ "pvmoore/ffi/vulkan/Enums.java", "wb");
        enumsFile.write(enumsBuf.toString());
        enumsFile.close();

        auto functionsFile = File(targetModuleRoot ~ "pvmoore/ffi/vulkan/Functions.java", "wb");
        functionsFile.write("package pvmoore.ffi.vulkan;\n\n");
        functionsFile.write(FUNCTIONS_IMPORTS);
        functionsFile.write(getHeaderComment());
        functionsFile.write(FUNCTIONS_PREFIX_1);
        functionsFile.write(loaderHandles.toString());
        functionsFile.write(FUNCTIONS_PREFIX_2);        
        functionsFile.write(loaderBuf.toString());
        functionsFile.write(FUNCTIONS_SUFFIX);
        functionsFile.close();

        foreach(e; opaqueHandleBuffers.byKeyValue()) {
            string name = e.key;
            auto buf = e.value;
            auto opaqueFile = File(targetModuleRoot ~ "pvmoore/ffi/vulkan/opaque/%s.java".format(name), "wb");

            opaqueFile.write("package pvmoore.ffi.vulkan.opaque;\n\n");
            opaqueFile.write(OPAQUE_IMPORTS);
            opaqueFile.writefln("public final class %s extends OpaqueHandle {", name);

            // opaqueFile.writefln("\tpublic %s() {", name);
            // opaqueFile.writefln("\t\tsuper();");
            // opaqueFile.writefln("\t}");

            // opaqueFile.writefln("\tpublic %s(SegmentAllocator allocator) {", name);
            // opaqueFile.writefln("\t\tsuper(allocator);");
            // opaqueFile.writefln("\t}");

            opaqueFile.writefln("\tpublic %s(MemorySegment memory) {", name);
            opaqueFile.writefln("\t\tsuper(memory);");
            opaqueFile.writefln("\t}");


            opaqueFile.write(buf.toString());
            opaqueFile.write(OPAQUE_SUFFIX);
            opaqueFile.close();
        }
    }
    override void structDef(StructDef sd) {
        commonStructOrUnion(sd, null);
    }
    override void union_(Union u) {
        commonStructOrUnion(null, u);
    }
    override void func(FuncDecl fd) {
        if(fd.name.isOneOf(GLOBAL_CMD_FUNCS) || fd.name=="vkGetInstanceProcAddr" || fd.name.startsWith("PFN_")) {
            return;
        }

        auto firstParamType = fd.numParameters > 0 ? fd.firstParameterType() : null;
        auto firstParamName = firstParamType && firstParamType.isA!TypeRef ? firstParamType.as!TypeRef.name : "";

        if(isOpaque(firstParamType)) {
            handleFuncDeclOpaque(fd, firstParamName);
        }

        handleFuncDecl(fd);
    }
    override void enum_(Enum e) {
        foreach(id; e.getIdentifiers()) {
            assert(id.hasChildren());

            if(id.first().isA!Identifier) continue;

            enumsBuf.add("\tpublic static final int %s = ", id.name);
            emitter.emit(id.first(), enumsBuf);

            enumsBuf.add(";\n");
        }
        enumsBuf.add("\n");
    }
private:
    string getHeaderComment() {
        return "/**\n" ~
            format(" * This file was generated from Vulkan SDK version %s\n", vulkanVersion) ~
            " */\n";
    }
    void commonStructOrUnion(StructDef sdef, Union un) {
        string name;
        Var[] vars;
        bool hassTypeAndpNext;
        bool isUnion;
        bool isDeviceFeatures;

        if(sdef) {
            name = sdef.name;
            vars = sdef.variables();
            hassTypeAndpNext = sdef.hasVariable("sType") && sdef.hasVariable("pNext") &&
                               sdef.name!="VkBaseInStructure" && sdef.name!="VkBaseOutStructure";
        } else {
            isUnion = true;
            name = un.name;
            vars = un.vars();
        }

        if(name.endsWith("_T")) {
            getOpaqueBuffer(name[0..$-2]);
            return;
        }

        if(name.isOneOf("_SECURITY_ATTRIBUTES", "HINSTANCE__", "HMONITOR__", "HWND__")) return;

        auto buf = new StringBuffer();

        buf.add("package pvmoore.ffi.vulkan.structs;\n\n");

        buf.add("import java.lang.foreign.*;\n");
        buf.add("import pvmoore.ffi.common.*;\n");
        buf.add("import pvmoore.ffi.vulkan.misc.*;\n");
        buf.add("import static java.lang.foreign.ValueLayout.*;\n");
        buf.add("import static pvmoore.ffi.vulkan.Enums.*;\n");
        buf.add("import static pvmoore.ffi.common.Constants.*;\n");
        buf.add("import static pvmoore.ffi.common.Utils.stringOf;\n");
        buf.add("import static pvmoore.ffi.common.Utils.throwIf;\n");
        buf.add("import static pvmoore.ffi.common.NativeMemory.*;\n\n");

        if(isUnion) {
            buf.add("// This is actually a Union\n");
        }
        isDeviceFeatures = name.startsWith("VkPhysicalDevice") && 
                           name.contains("Features") &&
                           name != "VkPhysicalDeviceFeatures";

        string implements = isDeviceFeatures ? "implements IDeviceFeatures " : "";

        buf.add("public final class %s extends Struct %s{\n", name, implements);

        buf.add(createLayout(sdef, un, emitter));

        // Constructor
        buf.add("\tprivate %s(MemorySegment mem, int count) {\n", name);
        buf.add("\t\tsuper(mem, count);\n");
        buf.add("\t}\n\n");

        // Alloc(SegmentAllocator, int)
        buf.add("\tpublic static %s alloc(SegmentAllocator session, int count) {\n", name);
        buf.add("\t\tvar mem = count == 1 ? session.allocate(LAYOUT) : session.allocate(LAYOUT, count);\n");

        if(hassTypeAndpNext) {
            auto e = getStructureType(name);
            // buf.add("\t\tvar mem = count == 1 ? MemorySegment.allocateNative(LAYOUT, session)\n");
            // buf.add("\t\t\t : MemorySegment.allocateNative(MemoryLayout.sequenceLayout(count, LAYOUT), session);\n");

            buf.add("\t\tvar obj = wrap(mem, count);\n");
            buf.add("\t\tfor(int i=0; i<count; i++) {\n");
            buf.add("\t\t\tNativeMemory.set(mem, i*LAYOUT.byteSize(), %s);\n", e);
            buf.add("\t\t\tNativeMemory.setNull(mem, 8 + i*LAYOUT.byteSize());\n");
            buf.add("\t\t}\n");

            buf.add("\t\treturn obj;\n");
        } else {
            buf.add("\t\treturn wrap(mem, count);\n");
        }
        buf.add("\t}\n");

        // Alloc(SegmentAllocator)
        buf.add("\tpublic static %s alloc(SegmentAllocator session) {\n", name);
        buf.add("\t\treturn alloc(session, 1);\n");
        buf.add("\t}\n");

        // Alloc()
        buf.add("\tpublic static %s alloc() {\n", name);
        buf.add("\t\treturn alloc(GLOBAL_ARENA, 1);\n");
        buf.add("\t}\n");

        // Wrap
        buf.add("\tpublic static %s wrap(MemorySegment mem, int count) {\n", name);
        buf.add("\t\treturn new %s(mem, count);\n", name);
        buf.add("\t}\n");

        // getStruct
        buf.add("\tpublic %s getStruct(int i) {\n", name);
        buf.add("\t\tthrowIf(i>=count, String.format(\"%s >= %s\", i, count));\n");
        buf.add("\t\tthis.mem = startMem.asSlice(LAYOUT.byteSize()*i);\n");
        buf.add("\t\treturn this;\n");
        buf.add("\t}\n\n");

        // Getters
        buf.add("\t// Getters\n");
        buf.add("\t@Override public MemoryLayout getLayout() {\n");
        buf.add("\t\treturn LAYOUT;\n");
        buf.add("\t}\n");

        foreach(i, v; vars) {
            auto offset = isUnion ? 0 : sdef.offsetOfMember(i.as!int);
            buf.add(createGetter(name, offset, v));
        }
        buf.add("\n");

        // Setters
        buf.add("\t// Setters\n");
        foreach(i, v; vars) {
            auto offset = isUnion ? 0 : sdef.offsetOfMember(i.as!int);
            buf.add(createSetter(name, offset, v));
        }

        // toString()
        buf.add("\n");
        if(!isUnion) {
            buf.add(createToString(sdef));
        } else {
            buf.add(createToString(un));
        }

        buf.add("}\n");

        //writeln(buf.toString());

        auto file = File(targetModuleRoot ~ "pvmoore/ffi/vulkan/structs/" ~ name ~ ".java", "wb");
        file.writeln(buf.toString());
        file.close();
    }
    void handleFuncDecl(FuncDecl fd) {
        loaderBuf.add("\t\t\tvar %sAddr = (MemorySegment)vkGetInstanceProcAddr\n", fd.name);
        loaderBuf.add("\t\t\t\t.invoke(instance.getAddress(), nativeStringOf(\"%s\"));\n", fd.name);

        string funcDesc = generateFunctionDescriptor(fd);

        bool vkResult = false; //isVkResult(fd.returnType());
        bool isVoid = !vkResult && isVoidValue(fd.returnType());

        loaderBuf.add("\t\t\tif(!isNULL(%sAddr)) {\n", fd.name);

        // if(vkResult) {
        //     loaderHandles.add("\tpublic static VkResultFunction %s;\n", fd.name);
        //     loaderBuf.add("\t\t\t\t%s = new VkResultFunction(linker.downcallHandle(%sAddr, %s));\n", fd.name, fd.name, funcDesc);
        // } else 
        if(isVoid) {
            loaderHandles.add("\tpublic static VoidFunction %s;\n", fd.name);
            loaderBuf.add("\t\t\t\t%s = new VoidFunction(linker.downcallHandle(%sAddr, %s));\n", fd.name, fd.name, funcDesc);
        } else {
            loaderHandles.add("\tpublic static RetFunction %s;\n", fd.name);
            loaderBuf.add("\t\t\t\t%s = new RetFunction(linker.downcallHandle(%sAddr, %s));\n", fd.name, fd.name, funcDesc);
        }

        loaderBuf.add("\t\t\t} else {\n");
        loaderBuf.add("\t\t\t\tlog.debug(\"Function '%s' not found\");\n", fd.name);
        loaderBuf.add("\t\t\t}\n");
    }
    StringBuffer getOpaqueBuffer(string name) {
        auto ptr = name in opaqueHandleBuffers;
        if(!ptr) {
            opaqueHandleBuffers[name] = new StringBuffer();
            return getOpaqueBuffer(name);
        }
        return *ptr;
    }
    /**
     * // void vkGetPrivateData(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData)
     * public void vkGetPrivateData(int objectType, long objectHandle, VkPrivateDataSlot privateDataSlot, MemorySegment pData) {
     *    Functions.vkGetPrivateData.invoke(device.getAddress(), objectType, objectHandle, privateDataSlot.getAddress(), pData);
     * }
     */
    void handleFuncDeclOpaque(FuncDecl fd, string name) {
        // This function has at least one parameter and it is one of the opaque handles:
        // - VkCommandBuffer
        // - VkQueue
        // - VkInstance
        // - VkDevice
        // - VkPhysicalDevice

        auto buf = getOpaqueBuffer(name);
        auto vars = fd.parameterVars();
        assert(vars.length > 0);


        //bool vkResult = isVkResult(fd.returnType());
        bool returnsVoid = /*vkResult ||*/ isVoidValue(fd.returnType());

        string returnStr = returnsVoid ? "void" : getJavaType(fd.returnType(), true);
        string params;
        string args = "getAddress()";
        auto origParams = new StringBuffer();
        origParams.add("%s %s", name, vars[0].name);

        foreach(i, p; vars[1..$]) {
            Type t = p.type();
            bool opaque = isOpaque(t);
            bool ptrToOpaque = isPtrToOpaque(t);
            bool structPtr = isStructPtr(t); 

            if(i>0) {
                params ~= ", ";
            }
            origParams.add(", ");
            args ~= ", ";

            emitter.emit(t, origParams);
            origParams.add(" ").add(p.name);
            //if(structPtr) origParams.add(" (structPtr) ");

            auto jt = ptrToOpaque ? "Pointer<%s>".format(t.getName()) 
                                  : structPtr ? t.getName()
                                  : opaque ? t.getName() 
                                  : getJavaType(t, true);

            params ~= "%s %s".format(jt, p.name);
            if(structPtr) {
                args ~= "%s == null ? NULL : %s.getAddress()".format(p.name, p.name);
            } else if(ptrToOpaque) {
                args ~= p.name ~ ".getAddress()";
            } else if(opaque) {
                args ~= p.name ~ ".getAddress()";
            } else {
                args ~= p.name;
            }
        }

        buf.add("\t/**\n");
        buf.add("\t * %s %s(%s)\n", returnsVoid ? "void" : fd.returnType().getName(), fd.name, origParams.toString());
        buf.add("\t */\n");
        buf.add("\tpublic %s %s(%s) {\n", returnStr, fd.name, params);

        if(!returnsVoid) {
            buf.add("\t\treturn ");
        } else {
            buf.add("\t\t");
        }

        buf.add("Functions.%s.call(%s);\n", fd.name, args);

        buf.add("\t}\n");
    }
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
bool isOpaque(Type t) {
    if(t is null) return false;

    if(auto tr = t.as!TypeRef) {
        if(auto ptr = tr.type.as!PtrType) {
            if(auto tr2 = ptr.type().as!TypeRef) {
                if(auto sd = tr2.type.as!StructDef) {
                    if(sd.name.endsWith("_T")) return true;
                }
            }
        }
    }
    return false;
}
bool isPtrToOpaque(Type t) {
    if(t is null) return false;
    if(auto ptr = t.as!PtrType) {
        return isOpaque(ptr.type());
    }
    return false;
}
bool isStructPtr(Type t) {
    if(auto ptr = t.as!PtrType) {
        if(auto tr = ptr.type().as!TypeRef) {
            if(auto sd = tr.type.as!StructDef) {
                if(!sd.name.endsWith("_T")) return true;
            }
        }
    }
    return false;
}
bool isVkResult(Type t) {
    return t !is null && t.isA!TypeRef && "VkResult"==t.as!TypeRef.name;
}
string getStructureType(string name) {
    import std;

    string st = "VK_STRUCTURE_TYPE";

    // Assume name is camel case
    if(name.startsWith("Vk")) name = name[2..$];

    const keywordsAZ = [
        "ASTC", "HDR", "D3D12", "Win32", "AABB", "Uint8",
        "Int8", "Float16", "Int64", "RGBA10X6", "H264", "H265"
    ];
    const keywords09 = ["2D", "3D", "8Bit", "16Bit"];

    for(int i=0; i<name.length; ) {
        char peek(int offset) {
            return i+offset >= name.length ? '\0' : name[i+offset];
        }
        bool isKw(string s, int offset) {
            foreach(j; 0..s.length.as!int) {
                if(peek(j+offset)!=s[j]) return false;
            }
            return true;
        }
        bool isUpper(char c) { return c >= 'A' && c <= 'Z'; }
        bool isNumber(char c) { return c >= '0' && c <= '9'; }

        string findAZKeyword() {
            return keywordsAZ.filter!(it=>isKw(it, -1)).frontOrElse!string(null);
        }
        string find09Keyword() {
            return keywords09.filter!(it=>isKw(it, -1)).frontOrElse!string(null);
        }

        auto ch = name[i];

        if(isUpper(ch)) {
            st ~= "_";
            st ~= ch;
            i++;

            if(name[i-1] == 'W' && i+7 < name.length && "Scaling"==name[i..i+7]) {
                // _W_SCALING

            } else if(auto kw = findAZKeyword()) {
                auto count = kw.length-1;
                st ~= name[i..i+count];
                i += count;

            } else if(isUpper(peek(0))) {
                while(isUpper(peek(0))) {
                    st ~= peek(0);
                    i++;
                    if(!isUpper(peek(1)) && peek(1) != 0) {
                        break;
                    }
                }
            }
        } else if(isNumber(ch)) {
            st ~= "_";
            st ~= ch;
            i++;

            if(i>7 && name[i-7..i-1] == "Vulkan") {
                // VULKAN_i_j
                st ~= "_";
                st ~= peek(0);
                i++;

            } else if(auto kw = find09Keyword()) {
                auto count = kw.length-1;
                st ~= name[i..i+count];
                i += count;

            } else if(isNumber(peek(0))) {
                while(isNumber(peek(0))) {
                    st ~= peek(0);
                    i++;
                }
            }
        } else {
            i++;
            st ~= ch;
        }
    }

    return st.toUpper();
}

module processor_vulkan_to_java;


import processor_common;

final class VulkanToJavaProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    JavaEmitter emitter;
    enum vulkanVersion = "1.3.261.1";
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
        enum string[] COMMENTS = [
            "Vulkan %s Include files converted to D (This is a generated file)".format(vulkanVersion),
            "",
            "Generated by CTools (https://github.com/pvmoore/dlang-CTools)",
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

        writefln("Emitting...");

        auto funcDecls = getOrderedValues(extractor.funcDecls);

        this.emitter = new JavaEmitter(extractor, "pvmoore.jvulkan");

        emitter.withCallback(new VulkanToJavaCallback(emitter, vulkanVersion));

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
__gshared string[] OPAQUE_HANDLES = [
    "VkDevice",
    "VkPhysicalDevice"
];
//══════════════════════════════════════════════════════════════════════════════════════════════════
final class VulkanToJavaCallback : JavaEmitter.Callback {
private:
    JavaEmitter emitter;
    string vulkanVersion;
    StringBuffer enumsBuf, loaderBuf, loaderHandles;
    StringBuffer[string] opaqueHandleBuffers;

    enum LOADER_PREFIX_1 =
        "package pvmoore.jvulkan.func;\n\n" ~
        "import lombok.extern.slf4j.Slf4j;\n" ~
        "import java.lang.foreign.*;\n" ~
        "import java.lang.invoke.MethodHandle;\n" ~
        "import pvmoore.jvulkan.opaque.*;\n" ~
        "import static pvmoore.jvulkan.misc.NativeMemory.*;\n" ~
        "import static pvmoore.jvulkan.misc.Util.isNULL;\n" ~
        "import static java.lang.foreign.ValueLayout.*;\n" ~
        //"import static java.lang.foreign.MemorySegment.NULL;\n\n" ~
        "\n" ~
        "@Slf4j\n" ~
        "public final class Functions {\n";
    enum LOADER_PREFIX_2 =
        "\n" ~
        "\tpublic static void vkLoadInstanceFunctions(MethodHandle vkGetInstanceProcAddr, VkInstance instance) {\n" ~
        "\t\ttry{\n" ~
        "\n" ~
        "\t\t\tLinker linker = Linker.nativeLinker();\n";

    enum LOADER_SUFFIX =
        "\t\t} catch(Throwable t) {\n" ~
        "\t\t\tthrow new RuntimeException(t);\n" ~
        "\t\t}\n" ~
        "\t}\n" ~
        "}\n";
    enum OPAQUE_PREFIX =
        "package pvmoore.jvulkan.opaque;\n\n" ~
        //"import lombok.extern.slf4j.Slf4j;\n" ~
        "import pvmoore.jvulkan.func.Functions;\n" ~
        "import pvmoore.jvulkan.misc.Pointer;\n" ~
        "import pvmoore.jvulkan.structs.*;\n" ~
        "import java.lang.foreign.*;\n" ~
        "import static java.lang.foreign.MemorySegment.NULL;\n" ~
        "\n";
    enum OPAQUE_SUFFIX =
        "}\n";
public:
    this(JavaEmitter emitter, string vulkanVersion) {
        this.emitter = emitter;
        this.vulkanVersion = vulkanVersion;
        this.enumsBuf = new StringBuffer();
        this.loaderBuf = new StringBuffer();
        this.loaderHandles = new StringBuffer();
    }
    void begin() {
        enumsBuf.add("package pvmoore.jvulkan;\n\n");
        enumsBuf.add("/**\n");
        enumsBuf.add(" * This file was generated from Vulkan SDK version %s\n", vulkanVersion);
        enumsBuf.add(" */\n");
        enumsBuf.add("public final class Enums {\n");
    }
    void end() {
        enumsBuf.add("}\n");

        auto file = File("C:/pvmoore/JVM/libs/jVulkan/src/main/java/pvmoore/jvulkan/Enums.java", "wb");
        file.write(enumsBuf.toString());
        file.close();

        file = File("C:/pvmoore/JVM/libs/jVulkan/src/main/java/pvmoore/jvulkan/func/Functions.java", "wb");
        file.write(LOADER_PREFIX_1);
        file.write(loaderHandles.toString());
        file.write(LOADER_PREFIX_2);
        file.write(loaderBuf.toString());
        file.write(LOADER_SUFFIX);
        file.close();

        foreach(e; opaqueHandleBuffers.byKeyValue()) {
            string name = e.key;
            auto buf = e.value;
            file = File("C:/pvmoore/JVM/libs/jVulkan/src/main/java/pvmoore/jvulkan/opaque/%s.java".format(name), "wb");

            file.write(OPAQUE_PREFIX);
            file.writefln("public final class %s extends OpaqueHandle {", name);

            // file.writefln("\tpublic %s() {", name);
            // file.writefln("\t\tsuper();");
            // file.writefln("\t}");

            // file.writefln("\tpublic %s(SegmentAllocator allocator) {", name);
            // file.writefln("\t\tsuper(allocator);");
            // file.writefln("\t}");

            file.writefln("\tpublic %s(MemorySegment memory) {", name);
            file.writefln("\t\tsuper(memory);");
            file.writefln("\t}");


            file.write(buf.toString());
            file.write(OPAQUE_SUFFIX);
            file.close();
        }
    }
    void structDef(StructDef sd) {
        commonStructOrUnion(sd, null);
    }
    void union_(Union u) {
        commonStructOrUnion(null, u);
    }
    void func(FuncDecl fd) {
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
    void enum_(Enum e) {
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
    void commonStructOrUnion(StructDef sdef, Union un) {
        string name;
        Var[] vars;
        bool hassTypeAndpNext;
        bool isUnion;

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

        buf.add("package pvmoore.jvulkan.structs;\n\n");

        buf.add("import static pvmoore.jvulkan.Enums.*;\n");
        buf.add("import java.lang.foreign.*;\n");
        buf.add("import static java.lang.foreign.ValueLayout.*;\n");
        buf.add("import static pvmoore.jvulkan.Constants.*;\n");
        buf.add("import static pvmoore.jvulkan.misc.NativeMemory.*;\n");
        buf.add("import static pvmoore.jvulkan.misc.Util.throwIf;\n\n");

        if(isUnion) {
            buf.add("// This is actually a Union\n");
        }

        buf.add("public final class %s extends Struct {\n", name);

        buf.add(createLayout(sdef, un, emitter));

        // Constructor
        buf.add("\tprivate %s(MemorySegment mem, int count) {\n", name);
        buf.add("\t\tsuper(mem, count);\n");
        buf.add("\t}\n\n");

        // Alloc(SegmentAllocator, int)
        buf.add("\tpublic static %s alloc(SegmentAllocator session, int count) {\n", name);
        buf.add("\t\tvar mem = count == 1 ? session.allocate(LAYOUT) : session.allocateArray(LAYOUT, count);\n");

        if(hassTypeAndpNext) {
            auto e = getStructureType(name);
            // buf.add("\t\tvar mem = count == 1 ? MemorySegment.allocateNative(LAYOUT, session)\n");
            // buf.add("\t\t\t : MemorySegment.allocateNative(MemoryLayout.sequenceLayout(count, LAYOUT), session);\n");

            buf.add("\t\tvar obj = wrap(mem, count);\n");
            buf.add("\t\tfor(int i=0; i<count; i++) {\n");
            buf.add("\t\t\tStruct.set(mem, i*LAYOUT.byteSize(), %s);\n", e);
            buf.add("\t\t\tStruct.setNull(mem, 8 + i*LAYOUT.byteSize());\n");
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

        buf.add("\n");
        if(!isUnion) {
            buf.add(createToString(sdef));
        } else {
            buf.add(createToString(un));
        }

        buf.add("}\n");

        //writeln(buf.toString());

        auto file = File("C:/pvmoore/JVM/libs/jVulkan/src/main/java/pvmoore/jvulkan/structs/" ~ name ~ ".java", "wb");
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


        bool vkResult = isVkResult(fd.returnType());
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
//──────────────────────────────────────────────────────────────────────────────────────────────────
string generateFunctionDescriptor(FuncDecl fd) {
    string returnType = getJavaLayout(fd.returnType(), true);
    string funcDesc;
    if(returnType) {
        funcDesc = "FunctionDescriptor.of(" ~ returnType;
    } else {
        funcDesc = "FunctionDescriptor.ofVoid(";
    }

    foreach(i, t; fd.parameterTypes()) {
        if(i>0 || returnType !is null) {
            funcDesc ~= ", ";
        }
        funcDesc ~= getJavaLayout(t, true);
    }
    funcDesc ~= ")";
    return funcDesc;
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string getJavaLayout(Type t, bool arrayAsStruct = false) {
    if(t.isPtr()) {
        return "ADDRESS";
    } else if(t.kind == TKind.VOID) {
        return null;
    } else if(t.isA!Enum) {
        return("JAVA_INT");
    } else if(t.isA!PrimitiveType) {
        switch(t.kind) with(TKind) {
            case CHAR:
                return "JAVA_BYTE";
            case SHORT:
                return "JAVA_SHORT";
            case INT:
            case LONG:
                return "JAVA_INT";
            case LONG_LONG:
                return "JAVA_LONG";
            case FLOAT:
                return "JAVA_FLOAT";
            case DOUBLE:
                return "JAVA_DOUBLE";
            default:
                throwIf(true, "unsupported kind %s", t.kind);
                break;
        }
    } else if(auto tr = t.as!TypeRef) {
        return getJavaLayout(tr.type);
    } else if(auto ar = t.as!ArrayType) {
        import std;
        int s = ar.dimensions()
                    .map!(it=>it.as!Number)
                    .map!(it=>it.stringValue.toLower().replace("u", "").to!int)
                    .reduce!((a,b)=>a*b);

        if(arrayAsStruct) {
            assert(s < 8);
            string l;
            string ly = getJavaLayout(ar.type());
            foreach(i; 0..s) {
                if(i>0) l ~= ",";
                l ~= ly;
            }
            return "MemoryLayout.structLayout(%s)".format(l);
        }

        return "MemoryLayout.sequenceLayout(%s, ".format(s) ~ getJavaLayout(ar.type()) ~ ")";

    } else if(auto sd = t.as!StructDef) {
        return sd.name ~ ".LAYOUT";
    } else if(auto u = t.as!Union) {
        return u.name ~ ".LAYOUT";
    }
    throwIf(true, "t=%s", t);
    return "?";
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string getJavaType(Type t, bool useRealStructName) {
    if(t.isA!PtrType) {
        return "MemorySegment";
    }
    if(t.isA!Enum) {
        return "int";
    }
    if(auto sd = t.as!StructDef) {
        return useRealStructName ? sd.name : "struct";
    }
    if(auto tr = t.as!TypeRef) {
        return getJavaType(tr.type, useRealStructName);
    }
    if(auto u = t.as!Union) {
        throwIf(!u.name, "union has no name");
        return useRealStructName ? u.name : "struct";
    }
    if(auto arr = t.as!ArrayType) {
        return getJavaType(arr.type(), useRealStructName) ~ "[]";
    }
    if(auto pt = t.as!PrimitiveType) {
        switch(t.kind) with(TKind) {
            case CHAR:
                return "byte";
            case SHORT:
                return "short";
            case INT:
            case LONG:
                return "int";
            case LONG_LONG:
                return "long";
            case FLOAT:
                return "float";
            case DOUBLE:
                return "double";
            default:
                break;
        }
    }
    throwIf(true, "Unsupported type %s", t);
    return "?";
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
bool isPossibleString(string name) {
    import std;

    auto lower = name.toLower();

    if(lower.containsAny("descriptor")) return false;
    return lower.containsAny("desc", "name");
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string createGetter(string structName, int offset, Var v) {
    string s;
    auto returnJavaType = getJavaType(v.type(), true);
    auto javaType = capitalised(getJavaType(v.type(), false));
    auto array = v.type().as!ArrayType;
    bool isArray = array !is null;
    bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
        (isBuiltin(array.type()) || isEnum(array.type()));

    if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
        returnJavaType = "String";
        javaType = "BytesAsString";
        isArray = false;
    }

    if(isArray) {
        javaType = "ArrayOf" ~ javaType[0..$-2];

        if(!isPrimitiveArray && "MemorySegment[]"!=returnJavaType) {
            returnJavaType = returnJavaType[0..$-2];
        }
    }

    s ~= "\tpublic %s %s() {\n".format(returnJavaType, v.name);
    s ~= "\t\treturn get%s(mem, %s".format(javaType, offset);


    if("ArrayOfStruct"==javaType) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        s ~= ", %s, %s.class)".format(arraySize / elementSize, returnJavaType);
    } else if("Struct"==javaType) {
        s ~= ", %s.class)".format(returnJavaType);
    } else if(isArray) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        s ~= ", %s)".format(arraySize / elementSize);
    } else {
        s ~= ")";
    }

    s ~= ";\n\t}\n";

    return s;
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string createSetter(string structName, int offset, Var v) {
    string s;
    auto javaType = getJavaType(v.type(), true);
    auto array = v.type().as!ArrayType;
    bool isArray = array !is null;
    bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
        (isBuiltin(array.type()) || isEnum(array.type()));

    // if("VkInstanceCreateInfo"==structName && offset==28) {
    //     writefln("array == %s, isPrimitiveType = %s", array, isPrimitiveArray);
    //     throwIf(true);
    // }

    if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
        s ~= "\tpublic %s %s(String s) {\n".format(structName, v.name);
        s ~= "\t\tset(mem, %s, s.getBytes(), %s);\n".format(offset, v.type().size());
        s ~= "\t\treturn this;\n";
        s ~= "\t}\n";
    }
    if("MemorySegment"==javaType && isPossibleString(v.name)) {
        // If we get here then v.type() must be a PtrType
        auto ptr = getPtrType(v.type());
        throwIf(!ptr, "type = %s", v.type());

        if(ptr.ptrDepth == 1) {
            s ~= "\tpublic %s %s(String s) {\n".format(structName, v.name);
            s ~= "\t\tset(mem, %s, s);\n".format(offset);
            s ~= "\t\treturn this;\n";
            s ~= "\t}\n";
        } else if(ptr.ptrDepth == 2) {
            s ~= "\tpublic %s %s(String[] s) {\n".format(structName, v.name);
            s ~= "\t\tset(mem, %s, s);\n".format(offset);
            s ~= "\t\treturn this;\n";
            s ~= "\t}\n";
        }
    }
    if(isArray && !isPrimitiveArray && "MemorySegment"!=javaType) {
        // Remove the [] at the end so that it is a single Struct type
        javaType = javaType[0..$-2];
    }

    if(isArray && !isPrimitiveArray && "MemorySegment"==javaType) {
        javaType ~= "[]";
    }

    s ~= "\tpublic %s %s(%s v) {\n".format(structName, v.name, javaType);

    if(isPrimitiveArray) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        auto numElements = arraySize / elementSize;
        s ~= "\t\tset(mem, %s, v, %s);\n".format(offset, numElements);
    } else {
        s ~= "\t\tset(mem, %s, v);\n".format(offset);
    }
    s ~= "\t\treturn this;\n";
    s ~= "\t}\n";

    return s;
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string createToString(Union un) {
    string s = "\t@Override public String toString() {\n";
    s ~= "\t\treturn \"%s{...}\";\n".format(un.name);
    s ~= "\t}\n";
    return s;
}
string createToString(StructDef sd) {

    const pattern = regex(r"pp(.*)Names");

    int _getCountVarOffset(string capture) {
        import std;
        auto findme = capture.toLower() ~ "count";
        foreach(i, v; sd.variables()) {
            if(v.name.toLower()==findme) {
                return sd.offsetOfMember(i.as!int);
            }
        }
        return -1;
    }

    string _toString() {
        string names;
        string values;

        foreach(i, v; sd.variables()) {
            auto javaType = capitalised(getJavaType(v.type(), false));
            auto array = v.type().as!ArrayType;
            bool isArray = array !is null;
            bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
                (isBuiltin(array.type()) || isEnum(array.type()));
            bool quoted = false;

            if(isArray) {
                javaType = "ArrayOf" ~ javaType[0..$-2];
            }

            if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
                javaType = "BytesAsString";
                isArray = false;
                quoted = true;
            }
            if("MemorySegment" == javaType && isPossibleString(v.name)) {
                javaType = "MemorySegmentAsString";
                quoted = true;
            }

            // Convert these to getString:
            // - XCount
			// - ppXNames
            auto countOffset = 0;
            if(auto capture = v.name.matchFirst(pattern)) {
                if(auto countVar = _getCountVarOffset(capture[1])) {
                    javaType = "ArrayOfString";
                    countOffset = countVar;
                }
            }

            int offset = sd.offsetOfMember(i.as!int);

            bool stringOf = "MemorySegment" == javaType ||
                          "ArrayOfString" == javaType;

            names ~= "\t\t\t\t\t\"%s=".format(v.name) ~ (quoted ? "'%s'" : "%s");

            if(stringOf) {
                values ~= "\t\t\t\tstringOf(get%s(startMem, offset + %s".format(javaType, offset);
            } else {
                values ~= "\t\t\t\tget%s(startMem, offset + %s".format(javaType, offset);
            }

            if("ArrayOfStruct"==javaType) {
                auto arraySize = array.size();
                auto elementSize = array.type().size();
                auto realJavaType = getJavaType(v.type(), true)[0..$-2];
                values ~= ", %s, %s.class)".format(arraySize / elementSize, realJavaType);

            } else if("Struct"==javaType) {
                auto realJavaType = getJavaType(v.type(), true);
                values ~= ", %s.class)".format(realJavaType);

            } else if("ArrayOfString"==javaType) {
                values ~= ", getInt(startMem, offset + %s))".format(countOffset);

            } else if(isArray) {
                auto arraySize = array.size();
                auto elementSize = array.type().size();
                values ~= ", %s)".format(arraySize / elementSize);

            } else {
                values ~= ")";
            }
            if(stringOf) {
                values ~= ")";
            }

            offset += v.type().size();
            if(i < sd.numMembers()-1) {
                names ~= ", \" +\n";
                values ~= ",\n";
            } else {
                names ~= "}\",\n";
                values ~= ")";
            }
        }
        return names ~ values;
    }

    string _getString() {
        string s;
        if(sd.numMembers()==0) {
            s ~= "\"%s{}\"".format(sd.name);
        } else {
            s ~= "String.format(\"%s{\" +\n%s".format(sd.name, _toString());
        }
        return s;
    }

    string s = "\t@Override public String toString() {\n";

    s ~= "\t\tvar s = new StringBuilder();\n";
    s ~= "\t\tvar offset = 0;\n";
    s ~= "\t\tif(count > 1) s.append(\"[\\n\\t\");\n";
    s ~= "\t\tfor(int i=0; i<count; i++) {\n";
    s ~= "\t\t\tif(i>0) s.append(\",\\n\\t\");\n";
    s ~= "\t\t\ts.append(";
    s ~= _getString();
    s ~= ");\n";
    s ~= "\t\t\toffset += LAYOUT.byteSize();\n";
    s ~= "\t\t}\n";
    s ~= "\t\tif(count > 1) s.append(\"\\n]\");\n";

    s ~= "\t\treturn s.toString();\n";
    return s ~ "\t}\n";
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
string createLayout(StructDef sdef, Union un, JavaEmitter emitter) {
    StringBuffer buf = new StringBuffer();
    bool isUnion = un !is null;
    auto vars = isUnion ? un.vars() : sdef.variables();

    if(isUnion) {
        buf.add("\tpublic static final MemoryLayout LAYOUT = MemoryLayout.unionLayout(");
    } else {
        buf.add("\tpublic static final MemoryLayout LAYOUT = MemoryLayout.structLayout(");
    }
    if(vars.length > 0) {
        buf.add("\n");
    }
    int offset = 0;
    int finalPad;
    int totalSize;

    if(isUnion) {
        totalSize = un.size();
        auto largestMemberSize = un.largestMember().type().size();
        finalPad = totalSize - largestMemberSize;
    } else {
        totalSize = sdef.size();
        if(totalSize > 0) {
            auto lastMember = sdef.variables()[sdef.numMembers()-1];
            auto lastMemberOffset = sdef.offsetOfMember(sdef.numMembers()-1);
            auto lastMemberSize = lastMember.type().size();
            finalPad = totalSize - (lastMemberOffset + lastMemberSize);
        }
    }

    foreach(i, v; vars) {
        auto n = v.name;
        auto t = v.type();
        auto a = t.alignment();
        auto size = t.size();

        buf.add("");

        if(!isUnion) {
            auto rem = offset & (a>>>1);
            if(rem != 0) {
                offset += rem;
                string pad = "PAD%s".format(rem);
                buf.add("% 36s,\n", pad);
            }
        }

        buf.add("% 36s", getJavaLayout(t));

        if(finalPad > 0 || i < vars.length-1) {
            buf.add(",");
        } else {
            buf.add(" ");
        }

        buf.add(" // [%0.2s] ", offset);
        emitter.emit(t, buf);
        buf.add(" %s", n);

        if(!isUnion) {
            offset += size;
        }

        buf.add("\t\n");
    }

    if(finalPad > 0) {
        buf.add("% 36s\n", "PAD%s".format(finalPad));
    }

    buf.add("\t\t// (%s bytes total)\n", totalSize);

    buf.add("\t);\n\n");

    return buf.toString();
}
//──────────────────────────────────────────────────────────────────────────────────────────────────
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

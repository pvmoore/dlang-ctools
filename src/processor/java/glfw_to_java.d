module processor.java.glfw_to_java;

import processor.base;
import processor.java._helper;

/**
 * TODO:
 *  - Functions with an int* count parameter and return non-void can probably be improved to either return
 *    a java array or a Struct with a count.
 *  - Handle functions that take or return a callback. Use FunctionalInterfaces for these.
 */
final class GlfwToJavaProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    JavaEmitter emitter;
    enum glfwVersion = "3.4";
    enum glfwPath = "C:/work/glfw-3.4.bin.WIN64/";
    enum dllName = "glfw3.4.dll";
    enum rootPackage = "pvmoore.ffi.glfw";
    enum targetModuleRoot = "C:/pvmoore/JVM/libs/ffi/glfw/src/main/java/";
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

        config.excludeRegexes ~= regex(r"^(Vk|vk).*");
        config.excludeRegexes ~= regex(r"HWND");

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {
        writefln("Emitting...");

        this.emitter = new JavaEmitter(extractor);

        emitter.withCallback(new JavaCallback(emitter, glfwVersion, rootPackage, targetModuleRoot, parseState));

        emitter.emit();
    }
}
//──────────────────────────────────────────────────────────────────────────────────────────────────

final class JavaCallback : JavaEmitter.Callback {
private:
    JavaEmitter emitter;
    string glfwVersion;
    string rootPackage;         // pvmoore.ffi.glfw 
    string rootPackageSlashed;  // pvmoore/ffi/glfw
    string targetModuleRoot;
    PPDef[string] definitions;

    StringBuffer constantsBuf;
    StringBuffer enumsBuf;
    StringBuffer functionsBuf, functionHandlesBuf;
    StringBuffer glfwBuf;

    enum ENUMS_IMPORTS = "";

    enum FUNCTIONS_IMPORTS = 
        //"import lombok.extern.slf4j.Slf4j;\n" ~
        "import java.lang.foreign.*;\n" ~
        "import java.lang.invoke.MethodHandle;\n" ~
        "import pvmoore.ffi.common.*;\n" ~
        "import static java.lang.foreign.ValueLayout.*;\n" ~
        "import static pvmoore.ffi.common.NativeMemory.GLOBAL_ARENA;\n" ~
        "\n";
public:
     this(JavaEmitter emitter, string glfwVersion, string rootPackage, string targetModuleRoot, ParseState parseState) {
        this.emitter = emitter;
        this.glfwVersion = glfwVersion;
        this.rootPackage = rootPackage;
        this.rootPackageSlashed = rootPackage.replace('.', '/');
        this.targetModuleRoot = targetModuleRoot;
        this.definitions = parseState.definitions;
        this.constantsBuf = new StringBuffer();
        this.enumsBuf = new StringBuffer();
        this.functionsBuf = new StringBuffer();
        this.functionHandlesBuf = new StringBuffer();
        this.glfwBuf = new StringBuffer();
    }
    override void begin() {

        beginConstants();

        enumsBuf.add("package %s;\n\n", rootPackage);
        enumsBuf.add(ENUMS_IMPORTS);
        enumsBuf.add(getHeaderComment());
        enumsBuf.add("public final class Enums {\n");

        functionsBuf.add("package %s;\n\n", rootPackage);
        functionsBuf.add(FUNCTIONS_IMPORTS);
        functionsBuf.add(getHeaderComment());
        functionsBuf.add("public final class Functions {\n");

        functionsBuf.add("\n//$$FUNCTION_HANDLES$$\n");

        functionsBuf.add(
            "\tpublic static void load(String sharedLibraryName) {\n" ~
            "\t\ttry{\n" ~
            "\n" ~
            "\t\t\tLinker linker = Linker.nativeLinker();\n" ~ 
            "\t\t\tSymbolLookup symbols = SymbolLookup.libraryLookup(sharedLibraryName, GLOBAL_ARENA);\n" ~
            "\t\t\tMethodHandle methodHandle;\n" ~
            "\n");

        glfwBuf.add("package %s;\n\n", rootPackage);
        glfwBuf.add("import lombok.extern.slf4j.Slf4j;\n");
        glfwBuf.add("import java.lang.foreign.*;\n");
        glfwBuf.add("import pvmoore.ffi.common.*;\n");
        glfwBuf.add("import pvmoore.ffi.glfw.structs.*;\n");
        glfwBuf.add("import pvmoore.ffi.vulkan.structs.VkAllocationCallbacks;\n");
        glfwBuf.add("import static java.lang.foreign.MemorySegment.NULL;\n");
        glfwBuf.add("import static java.lang.foreign.ValueLayout.*;\n");
        glfwBuf.add("import static pvmoore.ffi.glfw.Constants.*;\n");
        glfwBuf.add("\n");
        glfwBuf.add(getHeaderComment());
        glfwBuf.add("@Slf4j\n");
        glfwBuf.add("public final class Glfw {\n\n");
        glfwLoad();
    }
    override void structDef(StructDef sd) {
        doStructOrUnion(sd, null);
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
    override void func(FuncDecl fd) {
       doFuncDecl(fd);
    }
    override void union_(Union u) {
        doStructOrUnion(null, u);
    }
    override void end() {
        constantsBuf.add("}\n");

        enumsBuf.add("}\n");

        functionsBuf.add(
                "\t\t} catch(Throwable t) {\n" ~
                "\t\t\tthrow new RuntimeException(t);\n" ~
                "\t\t}\n" ~
                "\t}\n" ~
                "}\n");

        string functionsStr = functionsBuf.toString();

        functionsStr = functionsStr.replace("//$$FUNCTION_HANDLES$$", functionHandlesBuf.toString());

        auto constantsFile = File(targetModuleRoot ~ rootPackageSlashed ~ "/Constants.java", "wb");
        constantsFile.write(constantsBuf.toString());
        constantsFile.close();

        auto enumsFile = File(targetModuleRoot ~ rootPackageSlashed ~ "/Enums.java", "wb");
        enumsFile.write(enumsBuf.toString());
        enumsFile.close();

        auto functionsFile = File(targetModuleRoot ~ rootPackageSlashed ~ "/Functions.java", "wb");
        functionsFile.write(functionsStr);
        functionsFile.close();

        glfwBuf.add("}\n");

        auto glfwFile = File(targetModuleRoot ~ rootPackageSlashed ~ "/Glfw.java", "wb");
        glfwFile.write(glfwBuf.toString());
        glfwFile.close();
    }
private:
    string getHeaderComment() {
        return format("/**\n * This file was automatically generated from GLFW version %s\n */\n", glfwVersion);
    }  
    void glfwLoad() {
        glfwBuf.add("\tpublic static void load(Platform platform) {\n");
        glfwBuf.add("\t\tFunctions.load(platform.getGlfwSharedLibrary());\n");
        glfwBuf.add("\t\tlog.info(\"GLFW version {}\", NativeMemory.getString(Glfw.glfwGetVersionString()));\n");
        glfwBuf.add("\t}\n\n");
    }
    void beginConstants() {
        constantsBuf.add("package %s;\n\n", rootPackage);
        constantsBuf.add(getHeaderComment());
        constantsBuf.add("public final class Constants {\n");

        auto r = regex(r"^GLFW_.*");
        string[] keys;
        foreach(e; definitions.byKeyValue()) {
            if(!matchFirst(e.key, r).empty) {
                if(e.value.isEmpty()) {
                    // Ignore this one
                    //definitions[e.key].tokens ~= Token(TK.ID, "true");
                } else {
                    keys ~= e.key;
                }
            }
        }
        keys.sort();

        // Some of these keys refer to others that are further down which is not allowed.
        // Replace the token value of anything that is a forward reference with the actual value
        foreach(i, k; keys) {
            PPDef* def = k in definitions;
            foreach(ref t; def.tokens) {
                if(definitions.containsKey(t.value)) {
                    int j = keys.indexOf(t.value);
                    if(j > i) {
                        t.value = definitions[t.value].toString();
                    }
                }
            }
        }

        foreach(k; keys) {
            constantsBuf.add("\tpublic static int %s = %s;\n", k, definitions[k]);
        }
    }
    void doFuncDecl(FuncDecl fd) {

        //var methodHandle = linker.downcallHandle(symbols.find("funcname").get(),
        //            FunctionDescriptor.of(ADDRESS, ADDRESS, ADDRESS));

        Type rt = fd.returnType();
        bool isVoid = isVoidValue(rt);
        string funcDesc = generateFunctionDescriptor(fd);  
        bool hasCountPtrParameter = rt.isPtr() && fd.parameterVars().any!(it=>it.name=="count" && it.type().isPtr() && it.type().kind == TKind.INT);

        functionsBuf.add("\t\t\tmethodHandle = linker.downcallHandle(symbols.find(\"%s\").get(),\n", fd.name);
        functionsBuf.add("\t\t\t\t%s);\n", funcDesc);

        string params;
        string args;
        foreach(i, v; fd.parameterVars()) {
            Type t = v.type();
            bool isStruct = isStructPtr(t);

            if(i>0) {
                params ~= ", ";
                args ~= ", ";
            }

            if(isStruct) {
                args ~= "%s == null ? NULL : %s.getAddress()".format(v.name, v.name);
                params ~= "%s %s".format(t.getName(), v.name);
            } else {
                if(t.isFuncPtr()) {
                    // TODO - functional interface?
                }
                args ~= v.name;
                params ~= "%s %s".format(getJavaType(t, true), v.name);
            }
        }

        string retType = "void";
        string[] bodyLines;

        if(isVoid) {
            functionHandlesBuf.add("\tpublic static VoidFunction %s;\n", fd.name);
            functionsBuf.add("\t\t\t%s = new VoidFunction(methodHandle);\n", fd.name);

            bodyLines ~= "Functions.%s.call(%s);".format(fd.name, args);
        } else {
            functionHandlesBuf.add("\tpublic static RetFunction %s;\n", fd.name);
            functionsBuf.add("\t\t\t%s = new RetFunction(methodHandle);\n", fd.name);

            if(isStructPtr(rt)) {
                retType = rt.getName();
                if(hasCountPtrParameter) {
                    bodyLines ~= "MemorySegment mem = Functions.%s.call(%s);".format(fd.name, args);
                    bodyLines ~= "return %s.wrap(mem, NativeMemory.getInt(count));".format(retType);
                } else {
                    bodyLines ~= "return %s.wrap(Functions.%s.call(%s), 1);".format(retType, fd.name, args);
                }
            } else if(fd.returnType().isFuncPtr()) {
                // TODO - use FunctionalInterface here?
                retType = getJavaType(rt, true);
                bodyLines ~= "return /*func interface?*/ Functions.%s.call(%s);".format(fd.name, args);
            } else {
                retType = getJavaType(rt, true);
                if(hasCountPtrParameter) {
                    
                    bodyLines ~= "//count ptr (%s)".format(rt.getBaseType());
                    bodyLines ~= "return Functions.%s.call(%s);".format(fd.name, args);
                } else {
                    bodyLines ~= "return Functions.%s.call(%s);".format(fd.name, args);
                }
            }
        }  

        functionsBuf.add("\n");

        glfwBuf.add("\t/**\n");
        glfwBuf.add("\t * (%s) -> %s\n", params, retType);
        glfwBuf.add("\t */\n");
        glfwBuf.add("\tpublic static %s %s(%s) {\n", retType, fd.name, params);
        foreach(line; bodyLines) {
            glfwBuf.add("\t\t%s\n", line);
        }
        glfwBuf.add("\t}\n\n");
    }  
    void doStructOrUnion(StructDef sdef, Union un) {
        auto buf = new StringBuffer();

        string name;
        Var[] vars;
        bool isUnion;

        if(sdef) {
            name = sdef.name;
            vars = sdef.variables();
        } else {
            isUnion = true;
            name = un.name;
            vars = un.vars();
        }

        buf.add("package %s.structs;\n\n", rootPackage);
        buf.add("import java.lang.foreign.*;\n");
        buf.add("import pvmoore.ffi.common.*;\n");
        buf.add("import static java.lang.foreign.ValueLayout.*;\n");
        buf.add("import static pvmoore.ffi.common.Constants.*;\n");
        buf.add("import static pvmoore.ffi.common.NativeMemory.*;\n");
        buf.add("import static pvmoore.ffi.common.Utils.stringOf;\n");
        buf.add("import static pvmoore.ffi.common.Utils.throwIf;\n");
        buf.add("import static %s.Enums.*;\n", rootPackage);
        buf.add("\n");

        if(isUnion) {
            buf.add("// This is actually a Union\n");
        }

        buf.add("public final class %s extends Struct {\n", name);

        // LAYOUT
        buf.add(createLayout(sdef, un, emitter));

        // Constructor
        buf.add("\tprivate %s(MemorySegment mem, int count) {\n", name);
        buf.add("\t\tsuper(mem, count);\n");
        buf.add("\t}\n\n");

        // alloc(SegmentAllocator, int)
        buf.add("\tpublic static %s alloc(SegmentAllocator session, int count) {\n", name);
        buf.add("\t\tvar mem = count == 1 ? session.allocate(LAYOUT) : session.allocate(LAYOUT, count);\n");
        buf.add("\t\treturn wrap(mem, count);\n");
        buf.add("\t}\n");

        // alloc(SegmentAllocator)
        buf.add("\tpublic static %s alloc(SegmentAllocator session) {\n", name);
        buf.add("\t\treturn alloc(session, 1);\n");
        buf.add("\t}\n");

        // alloc()
        buf.add("\tpublic static %s alloc() {\n", name);
        buf.add("\t\treturn alloc(GLOBAL_ARENA, 1);\n");
        buf.add("\t}\n");

        // wrap()
        buf.add("\tpublic static %s wrap(MemorySegment mem, int count) {\n", name);
        buf.add("\t\treturn new %s(mem, count);\n", name);
        buf.add("\t}\n");

        // getStruct()
        buf.add("\tpublic %s getStruct(int i) {\n", name);
        buf.add("\t\tthrowIf(i>=count, String.format(\"%s >= %s\", i, count));\n");
        buf.add("\t\tthis.mem = startMem.asSlice(LAYOUT.byteSize()*i);\n");
        buf.add("\t\treturn this;\n");
        buf.add("\t}\n");

        // getLayout()
        buf.add("\t@Override public MemoryLayout getLayout() {\n");
        buf.add("\t\treturn LAYOUT;\n");
        buf.add("\t}\n\n");

        // Getters
        buf.add("\t// Getters\n");
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

        // toString()
        if(!isUnion) {
            buf.add(createToString(sdef));
        } else {
            buf.add(createToString(un));
        }

        buf.add("}\n");

        auto file = File(targetModuleRoot ~ rootPackageSlashed ~ "/structs/" ~ name ~ ".java", "wb");
        file.writeln(buf.toString());
        file.close();
    }
}



module processor.cimgui;

import processor.base;

/**
 * Download cimgui docking branch:
 *   cd C:/pvmoore/cpp/
 *   git clone --recursive https://github.com/cimgui/cimgui.git 
 *   git checkout docking_inter
 *   (may also need to "git submodule update --init --recursive")
 *
 * In imgui/imconfig.h, uncomment these to disable obsolete functions:
 *   #define IMGUI_DISABLE_OBSOLETE_FUNCTIONS
 *   #define IMGUI_DISABLE_OBSOLETE_KEYIO 
 *
 * Build the visual studio solution to generate the DLL. Rename this as 
 * cimgui-glfw-vk-VERSION.dll where VERSION is the version defined below in 'imguiVersion'.
 *
 * Update the version 'imguiVersion' below.
 * Run this processor.
 * Copy generated/cimgui_api.d to where it is used. 
 * Copy the DLL to where it is used.
 */
final class CImguiProcessor : Processor {
private:
    EConfig config;
    Extractor extractor;
    Emitter emitter;
    enum imguiVersion = "1.92.1";
public:
    override void process() {
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
        //defines["CIMGUI_FREETYPE"] = "1";
        defines["CIMGUI_DEFINE_ENUMS_AND_STRUCTS"] = "1";
        defines["IMGUI_DISABLE_OBSOLETE_FUNCTIONS"] = "1";
        defines["IMGUI_DISABLE_OBSOLETE_KEYIO"] = "1";
    }
    override void adjustIncludes(ref string[] includeDirs) {
        //string vulkanSdk = environment.get("VULKAN_SDK");
        //string vulkanH = vulkanSdk ~ "/I";

        //includeDirs ~= "c:/pvmoore/cpp/cimgui/imgui/";
    }
private:
    void extract() {
        this.config = new EConfig();

        config.requiredFunctionRegexes ~= regex(r"^(Im|ig).*$");
        config.requiredTypeRegexes ~= regex(r"^(Im|Stb|STB_|stbrp_).*$");

        config.excludeRegexes ~= regex(r"^(FILE|_iobuf)$");
        //config.excludeRegexes ~= regex(r"^_iobuf.*$");

        this.extractor = new Extractor(config);
        extractor.process(parent);
    }
    void emit() {

        enum string[] COMMENTS = [
            "CImgui %s include files converted to D (This is a generated file)".format(imguiVersion),
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

        auto flags = Emitter.Flag.UNQUALIFIED_ENUM |
                     Emitter.Flag.QUALIFIED_ENUM |
                     Emitter.Flag.UFCS_STRUCT_METHODS;

        this.emitter = new Emitter(extractor, "cimgui_api", flags);

        /*
            1) Use CodeEmitter to output the ImVector template
            2) Modify all ImVector_* classes to use the template
                - NamePlugin

            3) Possibly rename the Str|Array suffix functions to simple overloads

            4) Document the process once it all works
        */

        import std : map, array;
        auto loader = new EmitDLLLoader("CImguiLoader", "cimgui-glfw-vk-%s.dll".format(imguiVersion))
            .loadFunctions(getOrderedValues(extractor.funcDecls)
                                              .map!(it=>it.name)
                                              .array);

        emitter.privateImports(INCLUDES);

        emitter.add(new Comment(COMMENTS));
        emitter.add(loader);

        __gshared enum TEMPLATES = [
            "ImVector",
            "ImPool",
            "ImChunkStream",
            "ImSpan"
        ];

        enum MANUAL_STRUCTS = [
            "ImVec2"
        ];

        static class MyBaseEmitter : BaseEmitter {
            this(Emitter e) {
                super(e);
            }
            override void emit(StructDef sd) {
                // Ignore these - we will create them manually
                foreach(t; TEMPLATES) {
                    if(sd.name.startsWith(t)) return;
                }
                // And these
                foreach(t; MANUAL_STRUCTS) {
                    if(sd.name == t) return;
                }
                super.emit(sd);
            }
            override void emit(TypeRef tr, bool isType) {
                if(isType) {
                    foreach(t; TEMPLATES) {
                        if(tr.name.startsWith(t ~ "_")) {
                            auto suffix = tr.name.getSuffix("_");
                            if(suffix=="const_charPtr") {
                                suffix = "(char)";
                            } else if(suffix.endsWith("Ptr")) {
                                suffix = "(%s*)".format(suffix[0..$-3]);
                            } else if(suffix=="unsigned_char") {
                                suffix = "ubyte";
                            } else if(suffix=="const_char") {
                                suffix = "char";
                            } else {
                                suffix = "%s".format(suffix);
                            }
                            buf.add("%s!%s", t, suffix);
                            return;
                        }
                    }
                }
                super.emit(tr, isType);
            }
        }

        auto templates = new class Emitter.AppenderPlugin {
            void emit(StringBuffer buf) {
                buf.add("// ImVector template\n");
                buf.add(ImVector);
            }
        };

        emitter.add(templates);
        emitter.add(new MyBaseEmitter(emitter));

        emitter.emitTo("generated/cimgui_api.d");
    }

    enum ImVector =
"
struct ImVector(T) {
    import core.stdc.string : memcpy;
    
    int                 Size;
    int                 Capacity;
    T*                  Data;

    void clear() { if (Data) { Size = Capacity = 0; igMemFree(Data); Data = null; } }
    bool empty() { return Size == 0; }

    void push_back(T* v) { if (Size == Capacity) reserve(_grow_capacity(Size + 1)); memcpy(&Data[Size], v, T.sizeof); Size++; }

    void reserve(int new_capacity) {
        if (new_capacity <= Capacity) return; T* new_data = cast(T*)igMemAlloc(cast(size_t)new_capacity * T.sizeof); if (Data) { memcpy(new_data, Data, cast(size_t)Size * T.sizeof); igMemFree(Data); } Data = new_data; Capacity = new_capacity;
    }

    int _grow_capacity(int sz) { int new_capacity = Capacity ? (Capacity + Capacity / 2) : 8; return new_capacity > sz ? new_capacity : sz; }

    void resize(int new_size) { if (new_size > Capacity) reserve(_grow_capacity(new_size)); Size = new_size; }
}
struct ImPool(T) {
    ImVector!T      Buf;        // Contiguous data
    ImGuiStorage    Map;        // ID->Index
    ImPoolIdx       FreeIdx;    // Next free idx to use
    ImPoolIdx       AliveCount; // Number of active/alive items (for display purpose)
}
struct ImChunkStream(T) {
    ImVector!char  Buf;
}
struct ImSpan(T) {
    T*                  Data;
    T*                  DataEnd;
}
struct ImVec2 {
    float x;
    float y;

    ImVec2 opBinary(string op)(ImVec2 a) if (op==\"+\" || op==\"-\") {
        static if (op == \"+\") {
            return ImVec2(x+a.x, y+a.y);
        }
        static if (op == \"-\") {
            return ImVec2(x-a.x, y-a.y);
        }
    }
}
";
}

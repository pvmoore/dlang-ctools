module extractor.EmitDLLLoader;

import ctools.all;
import extractor;
import core.sys.windows.windows;

final class EmitDLLLoader : Emitter.Plugin {
private:
    string className;
    string libraryName;
    string[] functionNames;
    HANDLE handle;
public:
    this(string className, string libraryName) {
        this.className = className;
        this.libraryName = libraryName;
    }
    auto loadFunctions(string[] names...) {
        this.functionNames ~= names;
        return this;
    }
    override void emit(File file) {
        file.writefln("// %s", className);
        file.writefln("private struct _%s {", className);
        file.writefln("\timport core.sys.windows.windows;");
        file.writefln("\tHANDLE handle;");
        file.writefln("\tvoid load() {");
        file.writefln("\t\tthis.handle = LoadLibraryA(\"%s\");", libraryName);
        file.writefln("\t\tif(!handle) throw new Exception(\"Unable to load '%s'\");", libraryName);
        file.writefln("\t\t");
        foreach(n; functionNames) {
            file.writefln("\t\t*(cast(void**)&%s) = GetProcAddr(handle, \"%s\");", n,n);
        }

        file.writefln("\t}");
        file.writefln("\tvoid unload() {");
        file.writefln("\t\tif(handle) FreeLibrary(handle);");
        file.writefln("\t}");
        file.writefln("}");
        file.writefln("__gshared _%s %s;", className, className);
        file.writefln("// End of %s\n", className);
    }
}
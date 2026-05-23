module extractor.EmitDLLLoader;

import ctools.all;
import extractor;
import core.sys.windows.windows;

final class EmitDLLLoader : Emitter.AppenderPlugin {
private:
    string className;
    string libraryName;
    string debugLibraryName;
    string[] functionNames;
    HANDLE handle;
    bool throwExceptionIfLibraryNotFound;
public:
    this(string className, string libraryName, bool throwExceptionIfLibraryNotFound) {
        this.className = className;
        this.libraryName = libraryName;
        this.throwExceptionIfLibraryNotFound = throwExceptionIfLibraryNotFound;
    }
    auto setDebugLibraryName(string debugLibraryName) {
        this.debugLibraryName = debugLibraryName;
        return this;
    }
    auto loadFunctions(string[] names...) {
        this.functionNames ~= names;
        return this;
    }
    override void emit(StringBuffer buf) {
        buf.add("// %s\n", className);
        buf.add("private struct _%s {\n", className);
        buf.add("\timport core.sys.windows.windows;\n");
        buf.add("\timport common.utils : throwIf;\n");
        buf.add("\tHANDLE handle;\n");
        buf.add("\tbool load() {\n");

        if(debugLibraryName) {
            buf.add("\t\tdebug {\n");
            buf.add("\t\t\tthis.handle = LoadLibraryA(\"%s\");\n", debugLibraryName);
            buf.add("\t\t} else {\n");
            buf.add("\t\t\tthis.handle = LoadLibraryA(\"%s\");\n", libraryName);
            buf.add("\t\t}\n");
        } else {
            buf.add("\t\t\tthis.handle = LoadLibraryA(\"%s\");\n", libraryName);
        }

        if(throwExceptionIfLibraryNotFound) {
            buf.add("\t\tif(!handle) throw new Exception(\"Unable to load '%s'\");\n", libraryName);
        } else {
            buf.add("\t\tif(!handle) return false;\n");
        }
        buf.add("\t\t\n");
        foreach(n; functionNames) {
            buf.add("\t\t*(cast(void**)&%s) = GetProcAddress(handle, \"%s\");", n,n);
            buf.add(" throwIf(!%s);\n", n);
        }

        buf.add("\t\treturn true;\n");
        buf.add("\t}\n");
        buf.add("\tvoid unload() {\n");
        buf.add("\t\tif(handle) FreeLibrary(handle);\n");
        buf.add("\t}\n");
        buf.add("}\n");
        buf.add("__gshared _%s %s;\n", className, className);
        buf.add("// End of %s\n\n", className);
    }
}

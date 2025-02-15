module extractor.Emitter;

import ctools.all;
import extractor;

class Emitter {
private:
    enum DEFAULT_FLAGS = Flag.QUALIFIED_ENUM;

    Extractor extractor;
    string moduleName;
    Flag flags;
    string[] pvtImports;
    string[] pubImports;
    FuncDecl[] UFCSToAdd;
    string[string] extraDefs;
    string[string] extraAliases_;

    AppenderPlugin[] appenderPlugins;
    CharBytePlugin charBytePlugin;
    BaseEmitter baseEmitter;
    VariableEmitter variableEmitter;
    StringBuffer buf;
public:
    interface AppenderPlugin {
        void emit(StringBuffer buf);
    }
    interface CharBytePlugin {
        string eval(PrimitiveType);
    }
    interface VariableEmitter {
        void emit(Var[] vars, BaseEmitter baseEmitter, StringBuffer buf);
    }
    enum Flag {
        NONE                = 0,
        QUALIFIED_ENUM      = 1<<0,
        UNQUALIFIED_ENUM    = 1<<1,
        UFCS_STRUCT_METHODS = 1<<2,
    }

    Flag getFlags() { return flags; }
    CharBytePlugin getCharBytePlugin() { return charBytePlugin; }
    StringBuffer getStringBuffer() { return buf; }

    void addUFCS(FuncDecl fd) {
        this.UFCSToAdd ~= fd;
    }

    this(Extractor extractor, string moduleName, Flag flags = DEFAULT_FLAGS) {
        this.extractor = extractor;
        this.flags = flags;
        this.moduleName = moduleName;
        this.charBytePlugin = new CharByteEval;
        this.buf = new StringBuffer();
        this.baseEmitter = new BaseEmitter(this);
        this.variableEmitter = new class VariableEmitter {
            void emit(Var[] vars, BaseEmitter baseEmitter, StringBuffer buf) {
                foreach(v; vars) {
                    if(v.type.isConst) {
                        // Convert to an enum
                        buf.add(" enum ");
                        baseEmitter.emit(v);
                    }
                }
            }
        };
    }
    auto add(AppenderPlugin plugin) {
        this.appenderPlugins ~= plugin;
        return this;
    }
    auto add(CharBytePlugin cbe) {
        this.charBytePlugin = cbe;
        return this;
    }
    auto add(VariableEmitter emitter) {
        this.variableEmitter = emitter;
        return this;
    }
    auto add(BaseEmitter emitter) {
        this.baseEmitter = emitter;
        return this;
    }
    //──────────────────────────────────────────────────────────────────────────────────────────────
    auto privateImports(string[] imports) {
        this.pvtImports = imports;
        return this;
    }
    auto publicImports(string[] imports) {
        this.pubImports = imports;
        return this;
    }
    auto extraDefinitions(string[string] extraDefs) {
        this.extraDefs = extraDefs;
        return this;
    }
    auto extraAliases(string[string] extraAliases) {
        this.extraAliases_ = extraAliases;
        return this;
    }
    void emitTo(string filename) {

        FuncDecl[] orderedFuncDecls = getOrderedValues(extractor.funcDecls);

        prolog();
        foreach(p; appenderPlugins) {
            p.emit(buf);
        }

        buf.add("// Aliases\n");
        addExtraAliases();
        foreach(tr; getOrderedValues(extractor.aliases)) {
            baseEmitter.emit(tr, false);
        }
        foreach(td; getOrderedValues(extractor.typedefs)) {
            baseEmitter.emit(td);
        }
        buf.add("\n");

        buf.add("// Enums\n");
        addExtraDefinitions();
        foreach(e; getOrderedValues(extractor.enums)) {
            baseEmitter.emit(e);
        }
        buf.add("\n");
        buf.add("// Unions\n");
        foreach(u; getOrderedValues(extractor.unions)) {
            baseEmitter.emit(u);
        }
        buf.add("\n");
        buf.add("// Structs\n");
        foreach(sd; getOrderedValues(extractor.structDefs)) {
            baseEmitter.emit(sd);
        }
        buf.add("\n");
        buf.add("// Global variables\n");
        variableEmitter.emit(getOrderedValues(extractor.vars), baseEmitter, buf);
        buf.add("\n");

        buf.add("extern(Windows) { nothrow __gshared {\n\n");
        foreach(fd; getExternWindowsDecls(orderedFuncDecls)) {
            baseEmitter.emit(fd, false);
        }
        buf.add("}} // extern(Windows), __gshared\n");
        buf.add("\n");

        buf.add("extern(C) { nothrow __gshared {\n\n");
        foreach(fd; getExternCDecls(orderedFuncDecls)) {
            baseEmitter.emit(fd, false);
        }
        buf.add("}} // extern(C), __gshared\n");
        buf.add("\n");

        addUFCSStructMethods();
        foreach(fd; getOrderedValues(extractor.funcDefs)) {
            baseEmitter.emit(fd);
        }
        epilog();

        auto file = File(filename, "wb");
        file.writef(buf.toString());
        file.close();
    }
    static string dname(string name) {
        switch(name) {
            case "scope":
            case "module":
            case "version":
            case "out":
            case "ref":
            case "in":
            case "align":
            case "function":
            case "string":
                return name ~ "_";
            default: return name;
        }
        assert(false);
    }
private:
    FuncDecl[] getExternWindowsDecls(FuncDecl[] decls) {
        return decls.filter!(it=>it.cconv==CConv.STDCALL).array;
    }
    FuncDecl[] getExternCDecls(FuncDecl[] decls) {
        return decls.filter!(it=>it.cconv==CConv.CDECL).array;
    }
    void prolog() {
        buf.add("module %s;\n\n", moduleName);

        if(pvtImports.length>0) {
            buf.add("private:\n\n");
            foreach(i; pvtImports) {
                buf.add("import %s;\n", i);
            }
            buf.add("\n");
        }
        buf.add("public:\n");
        if(pubImports.length>0) {
            buf.add("\n");
        }
        foreach(i; pubImports) {
            buf.add("import %s;\n", i);
        }
        buf.add("\n");
    }
    void epilog() {

    }
    void addUFCSStructMethods() {
        import std.string : indexOf, toLower;
        if(UFCSToAdd.length==0) return;

        buf.add("// UFCS camel case struct methods\n");
        buf.add("pragma(inline,true) {\n\n");

        foreach(fd; UFCSToAdd) {
            auto us = fd.name.indexOf('_');
            string sub = toLower(fd.name[us+1]).as!char ~ fd.name[us+2..$];

            baseEmitter.emit(fd.returnType());
            buf.add(" %s(", sub);

            foreach(i, v; fd.parameterVars()) {
                baseEmitter.emit(v.type());
                buf.add(" %s", dname(v.name));
                if(i < fd.numParameters-1) buf.add(", ");
            }
            if(fd.hasElipsis) {
                if(fd.numParameters>0) buf.add(", ");
                buf.add("...");
            }

            buf.add(") {\n");
            if(!isVoidValue(fd.returnType())) {
                buf.add("\treturn ");
            } else {
                buf.add("\t");
            }
            buf.add("%s(", fd.name);
            foreach(i, v; fd.parameterVars()) {
                buf.add("%s", dname(v.name));
                if(i < fd.numParameters-1) buf.add(", ");
            }
            buf.add(");\n}\n");
        }
        buf.add("} // pragma\n\n");
    }
    void addExtraDefinitions() {
        foreach(e; extraDefs.byKeyValue()) {
            buf.add("enum %s = %s;\n", e.key, e.value);
        }
        if(extraDefs.length > 0) buf.add("\n");
    }
    void addExtraAliases() {
        foreach(e; extraAliases_.byKeyValue()) {
            buf.add("alias %s = %s;\n", e.key, e.value);
        }
    }
}

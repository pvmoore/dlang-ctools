module extractor.Emitter;

import ctools.all;
import extractor;

final class Emitter {
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
    StringBuffer buf;
public:
    interface AppenderPlugin {
        void emit(StringBuffer buf);
    }
    interface CharBytePlugin {
        string eval(PrimitiveType);
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
    }
    auto add(AppenderPlugin plugin) {
        this.appenderPlugins ~= plugin;
        return this;
    }
    auto add(CharBytePlugin cbe) {
        this.charBytePlugin = cbe;
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
        foreach(v; getOrderedValues(extractor.vars)) {
            baseEmitter.emit(v);
        }
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
//═════════════════──══════════════════════════════════════════════════════════════════════════════
class BaseEmitter {
protected:
    Emitter emitter;
    Emitter.Flag flags;
    StringBuffer buf;
    Emitter.CharBytePlugin charBytePlugin;

    string tab(Node n) {
        if(n.nid==Nid.STRUCTDEF || n.nid==Nid.UNION) {
            return tab(n.parent) ~ "\t";
        }
        if(n.nid==Nid.ROOT) {
            return "";
        }
        return tab(n.parent);
    }
    bool flag(Emitter.Flag f) {
        return (flags&f) != 0;
    }
public:
    this(Emitter emitter) {
        this.emitter = emitter;
        this.flags = emitter.getFlags();
        this.buf = emitter.getStringBuffer();
        this.charBytePlugin = emitter.getCharBytePlugin();
    }
    final void emit(Node n) {
        final switch(n.nid) with(Nid) {
            case VAR: emit(n.as!Var); break;
            case BINARY: emit(n.as!Binary); break;
            case UNARY: emit(n.as!Unary); break;
            case IDENTIFIER: emit(n.as!Identifier); break;
            case NUMBER: emit(n.as!Number); break;
            case PARENS: emit(n.as!Parens); break;
            case ARRAYTYPE: emit(n.as!ArrayType); break;
            case ENUM: emit(n.as!Enum); break;
            case FUNCDECL: emit(n.as!FuncDecl, true); break;
            case FUNCDEF: emit(n.as!FuncDef); break;
            case PRIMITIVETYPE: emit(n.as!PrimitiveType); break;
            case PTRTYPE: emit(n.as!PtrType); break;
            case STRUCTDEF: emit(n.as!StructDef); break;
            case TYPEREF: emit(n.as!TypeRef, true); break;
            case UNION: emit(n.as!Union); break;
            case STRING:
            case TERNARY:
            case INDEX:
            case MEMBER:
            case CALL:
            case CAST:
            case CHAR:
            case ADDRESSOF:
            case DEREF:
            case IF:
            case RETURN:
            case SCOPE:
            case TYPEDEF:
            case ROOT:
                throwIf(true, "Unhandled Node %s", n.nid);
                break;
        }
    }
    //──────────────────────────────────────────────────────────────────────────────────────────────
    void emit(StructDef sd) {
        buf.add("struct %s {\n", sd.name);

        string t = tab(sd);
        foreach(st; sd.statements()) {
            buf.add(t);
            emit(st);
        }
        buf.add("%s}\n", tab(sd.parent));
    }
    void emit(Typedef td) {
        buf.add("alias %s = ", td.name);
        emit(td.type());
        buf.add(";\n");
    }
    void emit(PrimitiveType t) {
        string s = t.unsigned ? "u" : "";
        switch(t.kind) with(TKind) {
            case BOOL: s = "bool"; break;
            case CHAR: s ~= charBytePlugin.eval(t); break;
            case SHORT: s ~= "short"; break;
            case INT: s ~= "int"; break;
            case LONG: s ~= "int"; break;
            case LONG_LONG: s ~= "long"; break;
            case FLOAT: s = "float"; break;
            case DOUBLE: s = "double"; break;
            case VOID: s = "void"; break;
            default: throwIf(true, "Unhandled PrimitiveType %s", t); break;
        }
        buf.add("%s", s);
    }
    void emit(PtrType pt) {
        int depth = pt.ptrDepth;
        if(pt.type().isA!FuncDecl) depth--;
        emit(pt.type());
        buf.add("*".repeat(depth));
    }
    void emit(TypeRef tr, bool isType) {
        if(!isType) {
            if(auto e = tr.type.as!Enum) {
                auto temp = e.name;
                e.name = tr.name;
                emit(e);
                e.name = temp;
                return;
            }
            if(auto sd = tr.type.as!StructDef) {
                auto temp = sd.name;
                sd.name = tr.name;
                emit(sd);
                sd.name = temp;
                return;
            }
            if(auto u = tr.type.as!Union) {
                auto temp = u.name;
                u.name = tr.name;
                emit(u);
                u.name = temp;
                return;
            }

            buf.add("alias %s = ", tr.name);
            emit(tr.type);
            buf.add(";\n");
        } else {
            if(tr.hasName()) {
                buf.add(tr.name);
            } else {
                emit(tr.type);
            }
        }
    }
    void emit(ArrayType at) {
        emit(at.type());
        foreach(dim; at.dimensions()) {
            buf.add("[");
            Number n = dim.as!Number ;
            if(n && n.stringValue=="-1") {
                // Don't emit empty array dimension
            } else {
                emit(dim);
            }
            buf.add("]");
        }
    }

    void emit(Enum e) {
        if(flag(Emitter.Flag.QUALIFIED_ENUM)) {
            // QUALIFIED enums
            buf.add("enum %s {\n", e.name);

            auto firstIdentifier = e.first().hasChildren() ? getDescendent!Identifier(e.first().first()) : null;
            // We need the type of this firstIdentifier if it is not null

            foreach(id; e.getIdentifiers()) {
                buf.add("\t%s", id.name);
                if(id.hasChildren()) {
                    buf.add(" = ");

                    if(firstIdentifier) {
                        //buf.add("cast(%s)(", firstIdentifier.type());
                    }
                    emit(id.first());
                    if(firstIdentifier) {
                        //buf.add(")");
                    }
                }
                buf.add(",\n");
            }
            buf.add("}\n");

            // Both QUALIFIED and UNQUALIFIED enums
            if(flag(Emitter.Flag.UNQUALIFIED_ENUM)) {
                buf.add("enum : %s {\n", e.name);
                foreach(id; e.getIdentifiers()) {
                    buf.add("\t%s = %s.%s,\n", id.name, e.name, id.name);
                }
                buf.add("}\n");
            }
        } else if(flag(Emitter.Flag.UNQUALIFIED_ENUM)) {
            // Only UNQUALIFIED enums
            buf.add("enum {\n");
            foreach(id; e.getIdentifiers()) {
                buf.add("\t%s", id.name);
                if(id.hasChildren()) {
                    buf.add(" = ");
                    emit(id.first());
                }
                buf.add(",\n");
            }
            buf.add("}\n");
        }
    }
    void emit(Union u) {
        if(u.hasName()) {
            buf.add("union %s {\n", u.name);
        } else {
            buf.add("union {\n");
        }
        string t = tab(u);
        foreach(v; u.vars()) {
            buf.add(t);
            emit(v);
        }
        buf.add("%s}\n", tab(u.parent));
    }
    void emit(FuncDef fd) {
        todo("Emit FuncDef not implemented");
    }
    void emit(FuncDecl fd, bool isType) {

        if(isType) {
            bool isVarType = fd.hasAncestor!Var;
            bool isParam = fd.parent.hasAncestor!FuncDecl;

            if(isParam) {

            } else if(isVarType) {
                buf.add("extern(C) ");
            } else if(fd.cconv == CConv.STDCALL) {
                buf.add("extern(Windows) ");
            } else {
                buf.add("extern(C) ");
            }
        }

        emit(fd.returnType());

        buf.add(" function(");
        foreach(i, v; fd.parameterVars()) {
            emit(v.type());
            buf.add(" %s", Emitter.dname(v.name));
            if(i < fd.numParameters-1) buf.add(", ");
        }
        if(fd.hasElipsis) {
            if(fd.numParameters>0) buf.add(", ");
            buf.add("...");
        }

        if(isType) {
            buf.add(") nothrow");
        } else {
            // declaration
            buf.add(")\n\t%s;\n\n", fd.name);
        }
        if(isType) {
            // Add a psuedo method for anything that looks like it should
            // be a struct method.
            // eg.
            // bool function(ImGuiTextFilter* self) ImGuiTextFilter_IsActive;
            //
            // pragma(inline,true) bool isActive(ImGuiTextFilter* self) {
            //    return ImGuiTextFilter_IsActive(self);
            // }
            //
            if(flag(Emitter.Flag.UFCS_STRUCT_METHODS) &&
                fd.numParameters > 0 &&
                fd.firstParameterType().isA!PtrType)
            {
                if(auto base = getStructDef(fd.firstParameterType())) {
                    if(fd.name.startsWith(base.name ~ "_")) {
                        emitter.addUFCS(fd);
                    }
                }
            }
        }
    }
    void emit(Var v) {
        emit(v.type());
        buf.add(" %s", Emitter.dname(v.name));
        if(v.hasInitialiser) {
            buf.add(" = ");
            emit(v.initialiser());
        }
        if(!v.type().isA!Union && !v.type().isA!StructDef) {
            buf.add(";\n");
        }
    }
    void emit(Identifier id) {
        buf.add(id.name);
    }
    void emit(Number n) {
        buf.add(n.stringValue);
    }
    void emit(Binary b) {
        emit(b.left());
        buf.add(" %s ", stringOf(b.op));
        emit(b.right());
    }
    void emit(Unary u) {
        buf.add("%s", stringOf(u.op));
        emit(u.expr());
    }
    void emit(Parens p) {
        buf.add("(");
        emit(p.expr());
        buf.add(")");
    }
}
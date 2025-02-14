module extractor.Extractor;

import ctools.all;
import extractor;

final class Extractor {
private:
    EConfig config;
    bool modified;

public:
    FuncDef[string] funcDefs;
    FuncDecl[string] funcDecls;
    StructDef[string] structDefs;
    Union[string] unions;
    Enum[string] enums;
    Var[string] vars;
    TypeRef[string] aliases;
    Typedef[string] typedefs;

    this(EConfig config) {
        this.config = config;
    }
    void process(Node parent) {
        this.log("Extracting...");

        modified = true;

        int iteration = 0;
        while(modified) {
            modified = false;
            parent.iterate(&evaluate);

            this.log("Finished iteration %s", iteration);
            iteration++;

            // remove this line later
            break;
        }

        filterTypedefs();
        filterFuncDecls();

        this.log("Results:::::::::::");
        foreach(n; funcDefs) {
            this.log("\tFuncDef: %s", n);
        }
        foreach(n; funcDecls) {
            this.log("\tFuncDecl: %s", n);
        }
        foreach(n; enums) {
            this.log("\tEnum: %s", n);
            //writefln("\tEnum: %s", n);
        }
        foreach(u; unions) {
            this.log("\tUnion: %s", u);
        }
        foreach(n; structDefs) {
            this.log("\tStructDef: %s", n);
        }
        foreach(n; vars.keys) {
            this.log("\tVar: %s", n);
        }
        foreach(n; typedefs) {
            this.log("\tTypedef: %s", n);
        }
        foreach(e; aliases.byKeyValue) {
            this.log("\tAlias: %s", e.key);
        }
        this.log("::::::::::::::::::");
    }
private:
    void evaluate(Node n) {
        //this.log("Node %s %s", n.nid, n);
        final switch(n.nid) with(Nid) {
            case ADDRESSOF: break;
            case ARRAYTYPE: break;
            case BINARY: break;
            case CALL: break;
            case CAST: break;
            case CHAR: break;
            case DEREF: break;
            case ENUM:
                auto en = n.as!Enum;
                if(config.isRequiredType(en.name)) {
                    include(en);
                }
                break;
            case FUNCDECL: {
                auto fd = n.as!FuncDecl;
                auto td = fd.getAncestor!Typedef;

                if(config.isRequiredFunction(fd.name)) {
                    if(fd.isDefinition) {
                        include(fd.definition());
                    } else {
                        include(fd);
                    }
                }
                else if(td && config.isRequiredTypedef(td.name)) {
                    include(td);
                }
                break;
            }
            case FUNCDEF: break;
            case IDENTIFIER: break;
            case IF: break;
            case FOR: break;
            case INDEX: break;
            case MEMBER: break;
            case NUMBER: break;
            case PARENS: break;
            case PRIMITIVETYPE: break;
            case PTRTYPE: break;
            case RETURN: break;
            case ROOT: break;
            case SCOPE: break;
            case STRING: break;
            case STRUCTDEF: {
                auto sd = n.as!StructDef;
                if(config.isRequiredType(sd.name)) {
                    include(sd);
                }
                break;
            }
            case TERNARY: break;
            case TYPEDEF: break;
            case TYPEREF: {
                auto tr = n.as!TypeRef;
                if(tr.name) {
                    if(config.isRequiredType(tr.name)) {
                        include(tr);
                        break;
                    } else if(tr.type.isA!PrimitiveType) {
                        include(tr);
                        break;
                    } else if(tr.type.isA!PtrType && tr.type.as!PtrType.type().isA!PrimitiveType) {
                        include(tr);
                        break;
                    } 
                }
                this.log("Ignoring TypeRef %s", tr.name);
                break;
            }
            case UNARY: break;
            case UNION:
                auto u = n.as!Union;
                if(config.isRequiredType(u.name)) {
                    include(u);
                }
                break;
            case VAR: 
                include(n.as!Var);
                break;
        }
    }
    void filterTypedefs() {
        // Filter out Typedefs where a FuncDecl already exists in aliases
        string[] removeMe;
        foreach(td; typedefs) {
            if(auto fd = td.type().getFuncDecl(false)) {
                if(td.name in aliases) removeMe ~= td.name;
            }
        }
        foreach(r; removeMe) {
            typedefs.remove(r);
        }
    }
    /**
     * 1) Remove funcDecls from the 'funcDecls' list if they are also defined as aliases
     */
    void filterFuncDecls() {
        string[] toRemove;
        foreach(fd; funcDecls.values()) {
            if(fd.name in aliases) {
                toRemove ~= fd.name;
            }
        }
        foreach(r; toRemove) {
            funcDecls.remove(r);
        }
        this.funcDecls.rehash();
    }
    void include(Node n) {
        switch(n.nid) with(Nid) {
            case VAR: include(n.as!Var); break;
            case TYPEDEF: include(n.as!Typedef); break;
            default: throwIf(true, "support me %s", n.nid);
        }
    }
    void include(FuncDef fd) {
        if(fd.getName() in funcDefs) return;

        funcDefs[fd.getName()] = fd;
        modified = true;
    }
    void include(Type type) {
        //if(type.isBuiltin()) return;
        if(auto tr = type.as!TypeRef) {
            include(tr);
        } else if(auto pt = type.as!PtrType) {
            include(pt.type());
        } else if(auto e = type.as!Enum) {
            include(e);
        } else if(auto sd = type.as!StructDef) {
            include(sd);
        } else {
            this.log("Ignoring Type (%s) %s", type.className(), type);
        }
    }
    void include(FuncDecl fd) {
        if(fd.name in funcDecls) return;

        funcDecls[fd.name] = fd;
        modified = true;

        // collect return type
        auto returnType = fd.returnType();
        include(returnType);

        // collect parameters
        foreach(Var v; fd.parameterVars()) {
            include(v);
        }
    }
    void include(StructDef sd) {
        throwIf(sd.name is null);
        if(sd.name in structDefs) return;
        if(config.isExcluded(sd.name)) return;

        structDefs[sd.name] = sd;
        modified = true;

        // collect body statements
        foreach(stmt; sd.statements()) {
            include(stmt);
        }
    }
    void include(Enum e) {
        if(e.name && e.name in enums) return;
        if(config.isExcluded(e.name)) return;

        enums[e.name] = e;
        modified = true;
    }
    void include(Union u) {
        if(u.name && u.name in unions) return;
        if(config.isExcluded(u.name)) return;

        unions[u.name] = u;
        modified = true;
    }
    void include(TypeRef tr) {
        if(tr.name in aliases) return;

        if(tr.type.isFuncPtr() || tr.name != tr.type.getName()) {
            if(!config.isExcluded(tr.name)) {
                aliases[tr.name] = tr;
                modified = true;
            }
        }

        include(tr.type);
    }
    void include(Var var) {
        if(var.name in vars) return;

        // Include var if it is global
        if(var.isGlobal()) {

            bool isExcluded = config.isExcluded(var.name) || config.isExcluded(var.type().getName());

            if(!isExcluded) {
                vars[var.name] = var;
                modified = true;
                include(var.type());
            }
        }
    }
    void include(Typedef td) {
        if(td.name in typedefs) return;

        typedefs[td.name] = td;
        modified = true;

        this.log("Include Typedef %s", td.name);
        include(td.type());
    }
}

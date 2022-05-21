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
    Enum[string] enums;
    Var[string] vars;
    //Typedef[string] typedefs;
    TypeRef[string] aliases;

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

        this.log("Results:::::::::::");
        foreach(n; funcDefs) {
            this.log("\tFuncDef: %s", n);
        }
        foreach(n; funcDecls) {
            this.log("\tFuncDecl: %s", n);
        }
        foreach(n; enums) {
            this.log("\tEnum: %s", n);
        }
        foreach(n; structDefs) {
            this.log("\tStructDef: %s", n);
        }
        foreach(n; vars) {
            this.log("\tVar: %s", n);
        }
        // foreach(n; typedefs) {
        //     this.log("\tTypedef: %s", n);
        // }
        foreach(n; aliases) {
            this.log("\tAlias: %s", n);
        }
        this.log("::::::::::::::::::");
    }
private:
    void evaluate(Node n) {
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
                if(config.isRequiredEnum(en.name)) {
                    include(en);
                }
                break;
            case FUNCDECL: {
                auto fd = n.as!FuncDecl;
                if(config.isRequiredFunction(fd.name)) {
                    if(fd.isDefinition) {
                        include(fd.definition());
                    } else {
                        include(fd);
                    }
                }
                break;
            }
            case FUNCDEF: break;
            case IDENTIFIER: break;
            case IF: break;
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
                if(sd.name !is null) {
                    if(config.isRequiredStruct(sd.name)) {
                        include(sd);
                    }
                }
                break;
            }
            case TERNARY: break;
            case TYPEDEF: {
                // auto td = n.as!Typedef;
                // if(config.isRequiredStruct(td.name)) {
                //     include(td);
                // }
                break;
            }
            case TYPEREF: break;
            case UNARY: break;
            case UNION: break;
            case VAR: break;
        }
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

        // collect body statements
    }
    void include(StructDef sd) {
        throwIf(sd.name is null);
        if(sd.name in structDefs) return;

        structDefs[sd.name] = sd;
        modified = true;

        // collect body statements
        foreach(stmt; sd.statements()) {
            include(stmt);
        }
    }
    void include(Enum e) {
        if(e.name && e.name in enums) return;

        enums[e.name] = e;
        modified = true;
    }
    void include(TypeRef tr) {
        if(tr.name in aliases) return;

        if(tr.type.isFuncPtr() || tr.name != tr.type.getName()) {
            aliases[tr.name] = tr;
            modified = true;
        }
        include(tr.type);
    }
    void include(Var var) {
        //this.log("Include Var %s %s", var.name, var.type());
        // Include var if it is global
        if(var.isGlobal() && var.name !in vars) {
            vars[var.name] = var;
            modified = true;
        }
        include(var.type());
    }
    // void include(Typedef td) {
    //     Type type = td.type();
    //     Type baseType = type.getBaseType();
    //     if(Enum e = baseType.as!Enum) {
    //         string name = firstNotNull(e.name, td.name);
    //         enums[name] = e;
    //     }

    //     this.log("Include Typedef %s", td.name);
    //     include(td.type());
    // }

}
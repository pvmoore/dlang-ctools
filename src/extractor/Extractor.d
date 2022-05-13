module extractor.Extractor;

import extractor.all;

final class Extractor {
private:
    EConfig config;
    bool modified;

    // FuncDecl[int] funcDecls;
    // StructDef[int] structDefs;

    Node[int] included;
public:
    this(EConfig config) {
        this.config = config;
    }
    void process(Node parent) {
        this.log("Extracting...");

        modified = true;

        while(modified) {
            modified = false;
            parent.iterate(&evaluate);

            // remove this line later
            break;
        }

        this.log("Finished");
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
            case ENUM: break;
            case FUNCDECL: {
                auto fd = n.as!FuncDecl;
                if(config.requiredFunctionNames.contains(fd.name) && fd.uid !in included) {
                    include(fd);
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
                if(sd.uid !in included) {
                    include(sd);
                }
                break;
            }
            case TERNARY: break;
            case TYPEDEF: break;
            case TYPEREF: break;
            case UNARY: break;
            case UNION: break;
            case VAR: break;
        }
    }
    void include(FuncDecl fd) {
        this.log("Including FuncDecl %s", fd.name);

        included[fd.uid] = fd;
        modified = true;

        // collect parameters and return type
        auto returnType = fd.returnType();


        foreach(p; fd.parameters()) {

        }


        // collect body statements
    }
    void include(StructDef sd) {
        this.log("Include StructDef %s", sd.name);

        included[sd.uid] = sd;
        // collect body statements
    }
    void include(Var var) {
        this.log("Include Var %s", var.name);
        // include type if it is a Typedef, StructDef or FuncDecl

        included[var.uid] = var;
    }
    void include(Type type) {
        this.log("Include Type %s", type);

        included[type.uid] = type;
    }
}
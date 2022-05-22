module ctools.parse.TypeParser;

import ctools.all;

struct TypeAndName {
    Type type;
    string name;

    bool hasType() { return type !is null; }
    bool hasName() { return name !is null; }
}

final class TypeParser {
private:
    ExprParser exprParser;
    StmtParser stmtParser;
    VarParser varParser;

    TokenNavigator nav;

    static struct NodeAndCount { Node node; int count; }
    NodeAndCount[string] typedefs;
    NodeAndCount[string] structs;
    StructDef[string] forwardDeclStructs;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
    }
    auto withStmtParser(StmtParser stmtParser) {
        this.stmtParser = stmtParser;
        return this;
    }
    auto withExprParser(ExprParser exprParser) {
        this.exprParser = exprParser;
        return this;
    }
    auto withVarParser(VarParser varParser) {
        this.varParser = varParser;
        return this;
    }
    void addTypedef(Typedef td) {
        auto ptr = td.name in typedefs;
        if(ptr) {
            (*ptr).count++;
        } else {
            typedefs[td.name] = NodeAndCount(td, 1);
        }
        if(auto sd = td.type().as!StructDef) {
            addStructDef(sd);
        }
    }
    void addStructDef(StructDef sd) {
        if(!sd.hasName()) return;
        if(!sd.hasBody()) {
            if(sd.name !in forwardDeclStructs) {
                forwardDeclStructs[sd.name] = sd;
            }
        } else if(auto p = sd.name in forwardDeclStructs) {
            // This is a bit of a hack. We should implement
            // a proper symbol table to avoid this

            // Add the body of this StructDecl to the original
            // forward declaration because that one will be
            // the one that is referenced in every TypeRef
            while(sd.hasChildren()) {
                (*p).add(sd.first());
            }
            forwardDeclStructs.remove(sd.name);
        }
        auto ptr = sd.name in structs;
        if(ptr) {
            (*ptr).count++;
        } else {
            structs[sd.name] = NodeAndCount(sd, 1);
        }
    }
    /**
     *  Try to parse and return a Type or null if not a type.
     */
    TypeAndName tryParse(Node parent) {
        int start = nav.pos;
        auto tan = parse(parent, false);
        if(!tan.hasType()) {
            nav.pos = start;
            this.log("This is not a type. rolling back");
        }
        return tan;
    }
    /**
     *  Parse and return a Type or null if not a type.
     *
     * TYPE         ::= [ 'const' ] ( 'unsigned' PRIMTYPE | TYPE_NAME ) { '*' } [ 'const' ]
     * TYPE_NAME    ::= PRIM_TYPE | TYPEDEF_NAME
     * FUNCTION_PTR ::= TYPE '(' [CCONV] '*' NAME ')' '(' PARAMS ')' [=;]
     * ENUM         ::= 'enum' NAME '{' ... '}'
     * STRUCT       ::= 'struct' NAME '{' '}'
     */
    TypeAndName parse(Node parent, bool throwIfNull = true) {
        this.log("parsing type value: %s, kind: %s", nav.value(), nav.kind());
        string value = nav.value();
        bool isUnsigned;
        bool isConst;
        bool isVolatile;
        Type type;

        void _consumeConstOrUnsigned() {
            while(nav.kind()==TK.ID) {
                switch(nav.value()) {
                    case "const":
                        isConst = true;
                        nav.skip(1);
                        break;
                    case "signed":
                        isUnsigned = false;
                        nav.skip(1);
                        break;
                    case "unsigned":
                        isUnsigned = true;
                        nav.skip(1);
                        break;
                    case "volatile":
                        isVolatile = true;
                        nav.skip(1);
                        break;
                    default:
                        return;
                }
            }
        }

        _consumeConstOrUnsigned();

        if(nav.kind()==TK.ID) {
            switch(nav.value()) {
                case "_Bool":
                case "bool":
                    type = new PrimitiveType(TKind.BOOL);
                    nav.skip(1);
                    break;
                case "__int8":
                case "char":
                    // assume char is signed by default
                    type = new PrimitiveType(TKind.CHAR);
                    nav.skip(1);
                    break;
                case "__int16":
                case "short":
                    type = new PrimitiveType(TKind.SHORT);
                    nav.skip(1);
                    break;
                case "__int32":
                case "int":
                    type = new PrimitiveType(TKind.INT);
                    nav.skip(1);
                    break;
                case "__int64":
                    type = new PrimitiveType(TKind.LONG_LONG);
                    nav.skip(1);
                    break;
                case "long":
                    if(nav.peek(1).value=="long") {
                        type = new PrimitiveType(TKind.LONG_LONG);
                        nav.skip(2);
                    } else {
                        type = new PrimitiveType(TKind.LONG);
                        nav.skip(1);
                    }
                    break;
                case "float":
                    type = new PrimitiveType(TKind.FLOAT);
                    nav.skip(1);
                    break;
                case "double":
                    type = new PrimitiveType(TKind.DOUBLE);
                    nav.skip(1);
                    break;
                case "struct":
                    type = parseStruct(parent);
                    break;
                case "union":
                    type = parseUnion(parent);
                    break;
                case "enum":
                    type = parseEnum(parent);
                    break;
                case "void":
                    type = new PrimitiveType(TKind.VOID);
                    nav.skip(1);
                    break;
                default:
                    // is it a typedef?
                    //Typedef td = parent.lastChildOrSelf().findTypedef(nav.value());
                    Typedef td = findTypedef(nav.value(), parent);
                    if(td) {
                        //tlog("\tfound %s", nav.value());
                        type = new TypeRef(td.type, td.name);
                        nav.skip(1);
                    } else {
                        // unsigned name;
                        if(isUnsigned) {
                            type = new PrimitiveType(TKind.INT);
                        }
                    }
                    break;
            }
        }

        TypeAndName tan;

        if(type !is null) {

            _consumeConstOrUnsigned();

            if(isUnsigned) {
                type.as!PrimitiveType.unsigned = isUnsigned;
            }

            type.isVolatile = isVolatile;
            type.isConst = isConst;

            tan = parseSubsequent(parent, type);

            this.log("\tparsed typeAndName = %s", tan);
            this.log("\tvalue: %s, kind: %s", nav.value(), nav.kind());
        } else if(throwIfNull) {
            throwIf(true, "Type is null: %s", value);
        }
        return tan;
    }
    TypeAndName parseSubsequent(Node parent, Type type) {
        this.log("\tparseSubsequent type=%s", type);

        bool isStatic;

        // const char * const * name;
        while(true) {
            if(nav.kind==TK.STAR) {
                if(!type.isA!PtrType) type = new PtrType(type.kind, 0).add(type).as!Type;
                type.as!PtrType.ptrDepth++;
                nav.skip(1);
            } else if("const"==nav.value()) {
                if(type.isA!PtrType) {
                    type.as!PtrType.toConst = true;
                } else {
                    type.isConst = true;
                }
                nav.skip(1);
            } else if("__unaligned"==nav.value()) {
                // ignore
                nav.skip(1);
            } else if("static"==nav.value()) {
                isStatic = true;
                nav.skip(1);
            } else if("__declspec"==nav.value()) {
                stmtParser.parseDeclspec(parent);
            } else {
                break;
            }
        }

        this.log("\tparseSubsequent type=%s", type);

        TypeAndName tan;

        if(isFuncPtrOrDecl()) {
            tan = parseFuncPtr(parent, type, isStatic);
        } else if(nav.kind()==TK.ID) {
            tan.name = parseName();
            tan.type = parseArray(type);
        } else {
            tan.type = type;
        }

        this.log("returning type %s", tan);

        return tan;
    }
private:
    /**
     * Check for:
     *   ID             (...)
     *   cconv ID       (...)
     *   (cconv ID)     (...)
     *   (cconv *ID[1]) (...)
     */
    bool isFuncPtrOrDecl() {
        this.log("isFuncPtrOrDecl '%s' %s", nav.value(), nav.kind());

        if(nav.kind()==TK.ID) {
            int i = 1;
            while(true) {
                if(nav.kind(i)==TK.LBRACKET) return true;
                if(nav.kind(i)!=TK.ID) return false;
                i++;
            }
        }
        if(nav.kind()==TK.LBRACKET) {
            int start = nav.pos;
            nav.skipBetween(TK.LBRACKET, TK.RBRACKET);
            if(nav.isKind(TK.LBRACKET)) {
                nav.pos = start;
                return true;
            }
            nav.pos = start;
        }
        return false;
    }
    Typedef findTypedef(string name, Node parent) {
        this.log("findTypedef '%s'", name);
        auto ptr = name in typedefs;
        if(ptr && (*ptr).count==1) {
            return (*ptr).node.as!Typedef;
        }
        return .findTypedef(parent.lastChildOrSelf(), name);
    }
    StructDef findStructDefFast(string name, Node parent) {
        this.log("findStructDefFast '%s'", name);
        auto ptr = name in structs;
        if(ptr && (*ptr).count==1) {
            return (*ptr).node.as!StructDef;
        }
        return null;
    }
    StructDef findStructDef(string name, Node parent) {
        this.log("findStructDef %s", name);
        auto sd = findStructDefFast(name, parent);
        if(sd) return sd;

        // Use the slow method
        Node found = findNode(parent.lastChildOrSelf(), (Node node) {
            Typedef td = node.as!Typedef;
            if(td && td.hasChildren() && td.type().isA!StructDef) {
                auto s = td.type().as!StructDef;
                return s.name == name;
            }
            StructDef s = node.as!StructDef;
            return s && s.name==name;
        });
        if(found) {
            if(found.isA!StructDef) return found.as!StructDef;
            return found.as!Typedef.type.as!StructDef;
        }
        // Assume this is an opaque pointer
        auto s = new StructDef();
        s.name = name;
        parent.getRoot().addToFront(s);
        return s;
    }
    /**
     *  TYPE '(' [CCONV] '*' NAME ')' '(' PARAMS ')'
     */
    TypeAndName parseFuncPtr(Node parent, Type returnType, bool isStatic) {
        this.log("\tparseFuncPtr returnType = %s (value:'%s' kind:%s)", returnType, nav.value(), nav.kind());

        // void* __stdcall name()
        //       ^^^^^

        // void * ( __stdcall * name ) ( void * pUserData)
        //        ^^^^^^

        auto decl = new FuncDecl();
        decl.add(returnType);

        decl.isStatic = isStatic;

        Type type = decl;

        // '('  0 or many
        int br = 0;
        while(nav.isKind(TK.LBRACKET)) {
            nav.skip(1);
            br++;
        }

        // cconv
        if(nav.matches(0, TK.ID, TK.ID) || nav.matches(0, TK.ID, TK.STAR, TK.ID)) {
            decl.cconv = parseCConv(nav);
        }

        // '*' 0 or many
        int ptrs = 0;
        while(nav.isKind(TK.STAR)) {
            nav.skip(1);
            ptrs++;
        }

        Type fp;

        if(ptrs>0) {
            type = fp = new PtrType(decl.kind, ptrs);
        }

        // name
        decl.name = parseName();

        // []
        type = parseArray(type);

        // )
        while(br-->0) {
            nav.skip(TK.RBRACKET);
        }

        // ( params )
        parseFuncDeclParameters(parent, decl);

        if(!type.isA!FuncDecl) {
            fp.add(decl);
        }

        return TypeAndName(type, decl.name);
    }
    void parseFuncDeclParameters(Node parent, FuncDecl decl) {
        // parameters
        // (
        nav.skip(TK.LBRACKET);

        // Add temporarily so that typedefs can be found
        parent.add(decl);

        while(!nav.isKind(TK.RBRACKET)) {

            // ...
            if(nav.isKind(TK.ELIPSIS)) {
                nav.skip(1);

                decl.hasElipsis = true;

            } else {
                if(varParser.parseParameter(decl)) {
                    decl.numParameters++;
                }
            }
            if(nav.kind()==TK.COMMA) {
                nav.skip(1);
            }
        }
        // )
        nav.skip(TK.RBRACKET);

        // Now detach because we will let the caller decide what to do with the Type
        parent.detach(decl);
    }
    /**
     * STRUCT ::= 'struct' [NAME] [ BODY ]
     * BODY   ::= '{' { VAR|FUNC } '}'
     */
    Type parseStruct(Node parent) {
        this.log("parseStruct %s", nav.value(1));

        // "struct"
        nav.skip("struct");

        bool inTypedef = parent.isA!Typedef;

        if(inTypedef && nav.matches(0, TK.ID, TK.ID, TK.SEMICOLON)) {
            // Forward declaration in typedef

        } else if(!inTypedef && nav.matches(0, TK.ID, TK.SEMICOLON)) {
            // Forward declaration

        } else if(nav.isKind(TK.ID) && !nav.isKind(TK.LBRACE, 1)) {
            // Struct ref

            this.log("\tLooking for struct %s", nav.value());
            // struct NAME
            // This is a reference to a struct declared previously
            string name = nav.value(); nav.skip(1);
            auto s = findStructDef(name, parent);
            this.log("\tFound %s", s);
            return new TypeRef(s, name);
        }

        auto struct_ = new StructDef();

        // name
        if(nav.isKind(TK.ID)) {
            struct_.name = nav.value(); nav.skip(1);
        }

        // BODY
        if(nav.isKind(TK.LBRACE)) {
            nav.skip(TK.LBRACE);

            // Add temporarily so that typedefs can be found
            parent.add(struct_);

            while(!nav.isKind(TK.RBRACE)) {
                stmtParser.parse(struct_);
            }
            nav.skip(TK.RBRACE);

            // Now detach because we will let the caller decide what to do with the Type
            parent.detach(struct_);
        }

        return struct_;
    }
    /**
     *  UNION ::= 'union' [NAME] '{' { VAR } '}'
     */
    Type parseUnion(Node parent) {
        // "union"
        nav.skip("union");

        auto u = new Union();

        // name
        if(nav.isKind(TK.ID)) {
            u.name = nav.value(); nav.skip(1);
        }

        // BODY
        if(nav.isKind(TK.LBRACE)) {
            nav.skip(TK.LBRACE);

            // Add temporarily so that typedefs can be found
            parent.add(u);

            while(!nav.isKind(TK.RBRACE)) {
                stmtParser.parse(u);
            }
            nav.skip(TK.RBRACE);

            // Now detach because we will let the caller decide what to do with the Type
            parent.detach(u);
        }

        return u;
    }
    /**
     *  ENUM  ::= 'enum [NAME] '{' { ENTRY [',' ENTRY ] } '}'
     *  ENTRY ::= (NAME | NAME '=' EXPRESSION)
     */
    Type parseEnum(Node parent) {

        nav.skip("enum");

        // name
        string name;
        if(nav.isKind(TK.ID)) {
            name = nav.value(); nav.skip(1);
        }

        auto enum_ = new Enum(name);

        if(nav.isKind(TK.LBRACE)) {

            // {
            nav.skip(TK.LBRACE);

            while(!nav.isKind(TK.RBRACE)) {

                string label = nav.value(); nav.skip(1);
                auto id = new Identifier(label);
                enum_.add(id);

                if(nav.isKind(TK.EQ)) {
                    nav.skip(TK.EQ);
                    exprParser.parse(id);
                }
                if(nav.isKind(TK.COMMA)) {
                    nav.skip(TK.COMMA);
                }
            }
            nav.skip(TK.RBRACE);
            // }
        } else {
            // 'enum' name

        }

        return enum_;
    }
    string parseName() {
        if(nav.kind()==TK.ID) {
            string name = nav.value(); nav.skip(1);
            return name;
        }
        return null;
    }
    Type parseArray(Type type) {
        // [ Expr ] 0 or many
        if(nav.isKind(TK.LSQUARE)) {

            auto array = new ArrayType(type.kind);
            array.add(type);

            while(nav.isKind(TK.LSQUARE)) {
                nav.skip(TK.LSQUARE);

                // Parse and add the expression if it exists (may not be provided)
                if(nav.kind()!=TK.RSQUARE) {
                    exprParser.parse(array);
                } else {
                    // add a -1 to indicate this dim was empty
                    array.add(new Number().withValue("-1"));
                }

                nav.skip(TK.RSQUARE);
            }

            type = array;
        }
        return type;
    }
}
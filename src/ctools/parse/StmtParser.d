module ctools.parse.StmtParser;

import ctools.all;

final class StmtParser {
private:
    TokenNavigator nav;

    TypeParser typeParser;
    ExprParser exprParser;
    VarParser varParser;

    int alignment;
    int[] pragmaPackStack;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
        this.alignment = 4;
        this.typeParser = new TypeParser(nav);
        this.exprParser = new ExprParser(nav);
        this.varParser = new VarParser(nav);

        typeParser.withStmtParser(this)
                  .withExprParser(exprParser)
                  .withVarParser(varParser);
        exprParser.withStmtParser(this)
                  .withTypeParser(typeParser)
                  .withVarParser(varParser);
        varParser.withExprParser(exprParser)
                 .withTypeParser(typeParser);
    }
    Node process() {
        Node parent = new Scope(true);
        int count = 0;

        try{
            while(!nav.isEof()) {
                parse(parent);

                // if(count++>=15000) // 7376
                //     break;

                //writefln("count = %s", count);
            }
        }catch(Exception e) {
            this.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            auto lastChild = parent.last();
            lastChild.dump();
            writefln("count = %s", count);
            throw e;
        }

        // auto lastChild = parent.last();
        // writefln("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        // int idx = lastChild.index();
        // if(idx!=0) {
        //     lastChild.up().dump();
        // }
        // lastChild.dump();
        // writefln("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

        //parent.dump();
        return parent;
    }
    void parse(Node parent) {
        this.log("parseStatement pos=%s, line=%s token=%s", nav.pos, nav.line(), nav.peek(0));

        bool isExtern;
        bool isStatic;

        consumeExternOrStatic(isExtern , isStatic);

        this.log("kind = %s '%s'", nav.kind(), nav.value());

        switch(nav.kind()) {
            case TK.ID:
                switch(nav.value()) {
                    case "typedef":
                        parseTypedef(parent);
                        return;
                    case "__pragma":
                        // ms specific
                        parsePragma(parent);
                        return;
                    case "__declspec":
                        parseDeclspec(parent);
                        return;
                    case "if":
                        parseIf(parent);
                        return;
                    case "return":
                        parseReturn(parent);
                        return;
                    default:
                        TypeAndName tan = typeParser.tryParse(parent);
                        if(tan.hasType()) {
                            Type type = tan.type;
                            this.log("type = %s kind: %s (nav value: %s kind: %s)",
                                type, type.kind, nav.value(), nav.kind());

                            // bool isNotVar =
                            //     !tan.hasName() &&
                            //     (type.isA!StructDef || type.isA!Union || type.isA!Enum);

                            bool parentIsAStruct = parent.isA!StructDef;
                            bool isFuncDef = type.isA!FuncDecl && nav.isKind(TK.LBRACE);

                            if(isFuncDef) {
                                parseFuncDef(parent, type.as!FuncDecl, isExtern, isStatic);
                            } else if(type.isA!FuncDecl) {
                                parent.add(type);
                            } else if(!tan.hasName() && !parentIsAStruct) {
                                if(type.isA!StructDef) {
                                    typeParser.addStructDef(type.as!StructDef);
                                }
                                parent.add(type);
                            } else {
                                varParser.parseVar(parent, tan, isExtern, isStatic);
                            }
                            return;
                        }
                        this.log("not a type");

                        exprParser.parse(parent);
                        nav.skip(TK.SEMICOLON);
                        return;
                }
            case TK.LBRACE:
                parseScope(parent);
                return;
            case TK.LBRACKET:
            case TK.STAR:
                exprParser.parse(parent);
                nav.skip(TK.SEMICOLON);
                return;
            case TK.SEMICOLON:
                nav.skip(TK.SEMICOLON);
                return;
            default:
                throw new Exception("Unsupported kind at %s".format(nav.peek(0)));
        }
    }
    /**
     *  '__declspec'
     *
     *  '__declspec' '(' 'noreturn' ')'
     *  '__declspec' '(' 'dllimport' ')'
     *  '__declspec' '('' deprecated [ '(' { "" } ')' ] ')'
     */
    void parseDeclspec(Node parent) {
        nav.skip("__declspec");
        nav.skip(TK.LBRACKET);
        switch(nav.value()) {
            case "noreturn":
                // ignore
                nav.skip(1);
                this.log("__declspec(noreturn)");
                break;
            case "dllimport":
                // ignore for now
                nav.skip(1);
                break;
            case "deprecated":
                nav.skip(1);
                if(nav.isKind(TK.LBRACKET)) {
                    nav.skip(TK.LBRACKET);
                    // skip one or more strings
                    while(nav.isKind(TK.STRING)) nav.skip(1);
                    nav.skip(TK.RBRACKET);
                }
                break;
            default:
                throwIf(true, "Unsupported __declspec %s", nav.value());
                break;
        }
        nav.skip(TK.RBRACKET);
    }
private:
    void consumeExternOrStatic(ref bool isExtern, ref bool isStatic) {
        if(!nav.isKind(TK.ID)) return;

        while(true) {
            switch(nav.value()) {
                case "extern":
                    isExtern = true;
                    nav.skip(1);
                    break;
                case "static":
                    isStatic = true;
                    nav.skip(1);
                    break;
                case "__inline":
                case "__forceinline":
                    nav.skip(1);
                    break;
                default:
                    return;
            }
        }
        assert(false);
    }
    void pushPragmaPack(int value) {
        pragmaPackStack ~= value;
        alignment = value;
        this.log("push pragma pack %s", value);
    }
    void popPragmaPack() {
        this.log("pop pragma pack");
        pragmaPackStack.length--;
        alignment = pragmaPackStack.length==0 ? 4 : pragmaPackStack[$-1];
    }

    /**
     * TYPEDEF   ::= 'typedef' type name { EXTRA } ';'
     * EXTRA     ::= ',' { [const|volatile] '*' [const|volatile] } name
     * FUNC_DECL ::= 'typedef' Type NAME '(' PARAMS ')' ';'
     */
    void parseTypedef(Node parent) {
        auto t = new Typedef;
        parent.add(t);

        // typedef
        nav.skip("typedef");

        auto tan = typeParser.parse(t);
        t.name = tan.name;

        typeParser.addTypedef(t);

        // Handle this:
        // typedef Type ( NAME );
        // typedef Type (( NAME ));
        // typedef Type ( * NAME );
        if(nav.isKind(TK.LBRACKET)) {
            auto numBrackets = nav.skipAll(TK.LBRACKET);

            if(nav.matches(TK.ID, TK.RBRACKET)) {
                // assume there is just a name here
                t.name = nav.value(); nav.skip(1);

            } else {
                tan = typeParser.parseSubsequent(parent, tan.type);
                t.name = tan.name;
                this.log("tan2 = %s", tan);
            }

            nav.skip(TK.RBRACKET);
            nav.skip(numBrackets-1);
        }

        t.add(tan.type);

        // , extra
        while(nav.isKind(TK.COMMA)) {
            nav.skip(TK.COMMA);

            // Remove ptr
            Type type2 = createTypeRefStripPtrAndArray(tan.type);
            Typedef td2 = new Typedef();

            auto tan2 = typeParser.parseSubsequent(parent, type2);
            td2.name = tan2.name;

            typeParser.addTypedef(td2);

            td2.add(tan2.type);
            parent.add(td2);
        }

        nav.skip(TK.SEMICOLON);
    }
    /**
     *  '__pragma' '(' PRAGMA ')'
     *
     *  PACK_PRAGMA ::= 'pack' '(' 'push' ',' NUMBER ')'
     */
    void parsePragma(Node parent) {

        // __pragma
        nav.skip("__pragma");

        // (
        nav.skip(TK.LBRACKET);

        switch(nav.value()) {
            case "pack":
                // 'pack' '(' 'push' ',' NUMBER ')'
                // 'pack' '(' 'pop' ')'
                nav.skip("pack");
                nav.skip(TK.LBRACKET);

                if("push"==nav.value()) {
                    nav.skip("push");
                    nav.skip(TK.COMMA);
                    pushPragmaPack(nav.value().to!int);
                    nav.skip(1);
                } else if("pop"==nav.value()) {
                    nav.skip("pop");
                    popPragmaPack();
                } else {
                    throwIf(true, "unsupported pragma pack %s", nav.value());
                }
                nav.skip(TK.RBRACKET);
                break;
            default:
                throwIf(true, "Unhandled __pragma %s", nav.value());
                break;
        }

        // )
        nav.skip(TK.RBRACKET);
    }
    /**
     *  IF   ::= 'if' COND THEN [ ELSE ]
     *  COND ::= '(' Expr ')'
     *  THEN ::= ( '{' { Stmt } '}' | Stmt )
     *  ELSE ::= 'else' ( '{' { Stmt } '}' | Stmt )
     */
    void parseIf(Node parent) {
        auto if_ = new If();
        parent.add(if_);

        nav.skip("if");

        // condiftion
        nav.skip(TK.LBRACKET);
        exprParser.parse(if_);
        nav.skip(TK.RBRACKET);

        // then
        if(nav.isKind(TK.LBRACE)) {
            nav.skip(TK.LBRACE);
            while(!nav.isKind(TK.RBRACE)) {
                parse(if_);
            }
            nav.skip(TK.RBRACE);
        } else {
            parse(if_);
        }

        // else
        if(nav.isValue("else")) {
            nav.skip("else");

            if_.elseStmtIndex = if_.numChildren();

            if(nav.isKind(TK.LBRACE)) {
                nav.skip(TK.LBRACE);
                while(!nav.isKind(TK.RBRACE)) {
                    parse(if_);
                }
                nav.skip(TK.RBRACE);
            } else {
                parse(if_);
            }
        }
    }
    void parseReturn(Node parent) {
        auto ret = new Return();
        parent.add(ret);

        nav.skip("return");
        if(!nav.isKind(TK.SEMICOLON)) {
            exprParser.parse(ret);
        }
        nav.skip(TK.SEMICOLON);
    }
    void parseScope(Node parent) {
        auto s = new Scope();
        parent.add(s);

        nav.skip(TK.LBRACE);

        while(!nav.isKind(TK.RBRACE)) {
            parse(s);
        }
        nav.skip(TK.RBRACE);
    }
    /**
     *  FUNC_DEF   ::= FUNC_DECL [ ';' | '{' { STATEMENT } '}' ]
     *
     *  DUNC_DECL  ::=  TYPE [CCONV] NAME '(' PARAMETERS ')'
     *  PARAMETERS ::= { PARAM [ ',' PARAM ] }
     *  PARAM      ::= TYPE [ NAME ]
     *  CCONV      ::= ('__cdecl' | '__stdcall' | '')
     */
    void parseFuncDef(Node parent, FuncDecl decl, bool isExtern, bool isStatic) {
        this.log("parseFuncDef decl = %s", decl);
        throwIf(nav.kind()!=TK.LBRACE);

        decl.isDefinition = true;
        decl.isStatic = decl.isStatic | isStatic;
        decl.isExtern = isExtern;

        parent.add(decl);

        auto def = new FuncDef();
        decl.add(def);

        nav.skip(TK.LBRACE);

        while(nav.kind() != TK.RBRACE) {
            parse(def);
        }
        nav.skip(TK.RBRACE);
    }
}
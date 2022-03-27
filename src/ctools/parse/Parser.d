module ctools.parse.Parser;

import ctools.all;

private enum DEBUG = true;

void plog(A...)(string fmt, A args) {
    static if(DEBUG) writefln(format(fmt, args));
}

final class Parser {
private:
    TokenNavigator nav;
    TypeParser typeParser;
    Metadata meta;
    int[] pragmaPackStack;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
        this.typeParser = new TypeParser(nav);
    }
    void process() {
        Node parent = new Node();
        parent.isRoot = true;

        while(!nav.isEof()) {
            parseStatement(parent);

            nav.skip(TK.SEMICOLON);
        }
    }
private:
    void parseStatement(Node parent) {
        plog("parseStatement %s", nav.pos);

        meta.reset();

        if(nav.isValue("extern")) {
            meta.isExtern = true;
            nav.skip(1);

            // must now be a type or a func
        }
        if(nav.isValue("static")) {
            meta.isStatic = true;
            nav.skip(1);

            // must now be a type
        }

        switch(nav.kind()) {
            plog("kind = %s", nav.kind());

            case TK.ID:
                plog("1");
                if(Type type = typeParser.parse(parent, meta)) {
                    plog("type %s", type);
                    // TYPE __cdecl NAME (
                    // TYPE NAME (
                    bool isFunc = nav.isKind(TK.ID) && nav.isKind(TK.ID, 1) && nav.isKind(TK.LBRACKET, 2);
                    isFunc |= nav.isKind(TK.ID) && nav.isKind(TK.LBRACKET, 1);

                    if(isFunc) {
                        parseFunc(parent, type);
                    } else {
                        parseVar(parent, type);
                    }
                    return;
                }

                switch(nav.value()) {
                    case "typedef":
                        parseTypedef(parent);
                        break;
                    case "__pragma":
                        // ms specific
                        parsePragma(parent);
                        parseStatement(parent);
                        break;
                    case "__declspec":
                        parseDeclSpec(parent);
                        parseStatement(parent);
                        break;
                    default:
                        throw new Exception("Unsupported TK.ID at %s".format(nav));
                }

                todo();

                break;
            default:
                throw new Exception("Unsupported kind at %s".format(nav));
        }
    }
    void pushPragmaPack(int value) {
        pragmaPackStack ~= value;
        meta.alignment = value;
    }
    void popPragmaPack() {
        pragmaPackStack.length--;
        meta.alignment = pragmaPackStack.length==0 ? 4 : pragmaPackStack[$-1];
    }

    /**
     * 'typedef' type name ';'
     */
    void parseTypedef(Node parent) {
        auto t = new Typedef;
        parent.add(t);

        // typedef
        nav.skip("typedef");

        typeParser.parse(t, meta);

        // name
        t.name = nav.value();
        nav.skip(1);

        // ;
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
            default: throwIf(true, "Unhandled __pragma %s", nav.value());
        }
    }
    /**
     *  '__declspec'
     *
     *  '__declspec' '(' 'noreturn' ')'
     *  '__declspec' '(' 'dllimport' ')'
     */
    void parseDeclSpec(Node parent) {
        nav.skip("__declspec");
        nav.skip(TK.LBRACKET);
        switch(nav.value()) {
            case "noreturn":
                // ignore
                nav.skip(1);
                break;
            case "dllimport":
                // ignore for now
                nav.skip(1);
                break;
            default:
                throwIf(true, "Unsupported __declspec %s", nav.value());
                break;
        }
        nav.skip(TK.RBRACKET);
    }
    /**
     *  FUNCTION   ::= TYPE NAME '(' PARAMETERS ')' [ '{' { STATEMENT } '}' ]
     *  PARAMETERS ::= { PARAM [ ',' PARAM ] }
     */
    void parseFunc(Node parent, Type returnType) {
        todo();
        // return type

        // name

        // parameters

        // body
    }
    /**
     *  VAR ::= TYPE NAME ';'
     */
    void parseVar(Node parent, Type type) {
        todo();
    }
}
module ctools.preprocess.PPMacroExpander;

import ctools.all;

final class PPMacroExpander {
private:
    enum DEBUG = false;
public:
    /**
     * Expand all macros/objects within the TokenNavigator and rewind it
     * @evaluateDefined - evaluate defined(X) if this is true
     */
    static void expandAll(ParseState state, TokenNavigator nav, bool evaluateDefined, string indent) {
        while(!nav.isEof()) {
            if(evaluateDefined && "defined"==nav.value()) {
                int start = nav.pos;
                Token temp = nav.peek(0);
                nav.skip(1);
                string name;
                if(nav.kind()==TK.LBRACKET) {
                    nav.skip(1);
                    name = nav.value();
                    nav.skip(2);
                } else {
                    name = nav.value();
                    nav.skip(1);
                }
                temp.kind = TK.NUMBER;
                temp.length = 1;
                temp.value = state.definitions.containsKey(name) ? "1" : "0";

                nav.removePrev(nav.pos-start);
                nav.insert([temp]);
            }
            expandOrSkip(state, nav, indent);
        }
        nav.rewind();
    }
    /**
     *  Expand the current token if possible or skip it
     */
    static void expandOrSkip(ParseState state, TokenNavigator nav, string indent) {
        if(!tryExpand(state, nav, indent)) {
            nav.skip(1);
        }
    }
private:
    /**
     * Expand the current token if possible
     * @return true if we expanded the token
     */
    static bool tryExpand(ParseState state, TokenNavigator nav, string indent) {
        if(nav.kind()==TK.ID && !nav.peek(0).blue) {
            string val = nav.value();

            PPDef* def = state.definitions.get(val);

            if(state.definitions.containsKey(val)) {
                if(nav.kind(1)==TK.LBRACKET) {
                    replaceMacroToken(state, nav, state.definitions[val], indent);
                    return true;
                } else if(!def.isFunc()) {
                    replaceObjectToken(nav, state.definitions[val]);
                    return true;
                } else {
                    // macro definition called without params
                }
            }
        }
        return false;
    }
    static void replaceObjectToken(TokenNavigator nav, PPDef* def) {
        nav.removeNext(1);
        nav.insert(def.tokens);
    }
    /**
     * 1) Stringification
     * 2) Replace parameters (no expansion)
     * 3) Concatenate (no expansion)
     * 4) Expand tokens from phase 2)
     * 5) Expand the remaining tokens
     */
    static void replaceMacroToken(ParseState state, TokenNavigator nav, PPDef* def, string indent) {
        static if(DEBUG) writefln("%sreplaceMacroToken: %s", indent, simpleStringOf(nav.tokens));
        nav.removeNext(2);

        // Extract and remove identifier ( args )
        Token[][string] args = extractArgs(nav, def, indent ~ "   ");

        // We are now left with the macro tokens

        auto nav2 = new TokenNavigator(def.tokens.dup);

        stringify(nav2, args, indent ~ "   ");
        replaceParams(nav2, args, indent ~ "   ");
        concatenate(nav2, indent ~ "   ");
        expandParameterTokens(state, nav2, indent ~ "   ");

        expandAll(state, nav2, false, indent ~ "-->");
        // while(!nav2.isEof()) {
        //     expandOrSkip(nav2, indent ~ "-->");
        // }
        static if(DEBUG) writefln("%safter replace = %s", indent, simpleStringOf(nav2.tokens));

        nav.insert(nav2.tokens);
    }
private:
    static Token[][string] extractArgs(TokenNavigator nav, PPDef* def, string indent) {
        static if(DEBUG) writefln("%sextractArgs {", indent);

        Token[][string] args;
        int start = nav.pos;

        static if(DEBUG) writefln("%s\tdef = %s", indent, def.toString());
        static if(DEBUG) writefln("%s\ttokens before = %s", indent, simpleStringOf(nav.tokens));

        void _add() {
            int count = nav.pos-start;
            int n = args.length.as!int;

            if(n < def.numParameters()) {
                string name = def.params[n];
                args[name] = nav.tokens[start..nav.pos];
            }

            nav.skip(-count);
            nav.removeNext(count+1);
        }

        int br = 1;
        lp: while(!nav.isEof()) {
            switch(nav.kind()) {
                case TK.LBRACKET:
                    br++;
                    break;
                case TK.RBRACKET:
                    br--;
                    if(br==0) {
                        _add();
                        break lp;
                    }
                    break;
                case TK.COMMA:
                    _add();
                    continue;
                default:
                    break;
            }
            nav.skip(1);
        }

        static if(DEBUG) writefln("\tArgs:");
        foreach(e; args.byKeyValue()) {
            static if(DEBUG) writefln("%s\t\t%s = %s", indent, e.key, simpleStringOf(e.value));
            foreach(ref t; e.value) {
                t.marked(true);
            }
        }
        static if(DEBUG) writefln("%s\ttokens = %s", indent, nav);
        static if(DEBUG) writefln("%s}", indent);
        return args;
    }
    static void stringify(TokenNavigator nav, Token[][string] args, string indent) {
        static if(DEBUG) writefln("%sstringify {", indent);
        static if(DEBUG) writefln("%s\t%s", indent, nav);
        while(!nav.isEof()) {
            if(nav.kind()==TK.HASH) {
                auto t = nav.peek(0);
                nav.removeNext(1);
                if(auto ptr = nav.value() in args) {
                    nav.removeNext(1);

                    t.kind = TK.STRING;
                    t.value = "\"" ~ simpleStringOf(*ptr, false) ~ "\"";

                    nav.insert([t]);
                } else {
                    throwIf(true, "Expecting a macro parameter");
                }
            } else {
                nav.skip(1);
            }
        }
        nav.rewind();
        static if(DEBUG) writefln("%s\t%s", indent, nav);
        static if(DEBUG) writefln("%s}", indent);
    }
    static void replaceParams(TokenNavigator nav, Token[][string] args, string indent) {
        static if(DEBUG) writefln("%sreplaceParams {", indent);
        static if(DEBUG) writefln("%s\t%s", indent, nav);
        while(!nav.isEof()) {
            if(nav.kind()==TK.ID) {
                if(auto ptr = nav.value() in args) {
                    nav.removeNext(1);
                    nav.insert(*ptr);
                } else {
                    nav.skip(1);
                }
            } else {
                nav.skip(1);
            }
        }
        nav.rewind();
        static if(DEBUG) writefln("%s\t%s", indent, nav);
        static if(DEBUG) writefln("%s}", indent);
    }
    static void concatenate(TokenNavigator nav, string indent) {
        static if(DEBUG) writefln("%sconcatenate { %s", indent, nav);
        while(!nav.isEof()) {
            if(nav.kind()==TK.DHASH) {
                // A ## B

                // A
                auto prev = nav.peek(-1);

                // ##
                nav.removeNext(1);

                // B
                auto curr = nav.peek(0);

                switch(prev.kind) {
                    case TK.ID:
                    case TK.NUMBER:
                        // remove B
                        nav.removeNext(1);
                        prev.length += curr.length;
                        prev.value ~= curr.value;
                        nav.tokens[nav.pos-1] = prev;
                        break;
                    case TK.STRING:
                    case TK.CHAR:
                        // do nothing
                        break;
                    default:
                        // do nothing
                        break;
                }
            } else {
                nav.skip(1);
            }
        }
        nav.rewind();
        static if(DEBUG) writefln("%s\ttokens = %s", indent, nav);
        static if(DEBUG) writefln("%s}", indent);
    }
    static void expandParameterTokens(ParseState state, TokenNavigator nav, string indent) {
        static if(DEBUG) writefln("%sexpandParameterTokens { %s", indent, nav);
        while(!nav.isEof()) {
            if(nav.peek(0).marked()) {
                expandOrSkip(state, nav, indent ~ "   ");
            } else {
                nav.skip(1);
            }
        }
        nav.rewind();

        // Remove marks
        foreach(ref t; nav.tokens) {
            t.marked(false);
        }

        static if(DEBUG) writefln("%s\ttokens = %s", indent, nav);
        static if(DEBUG) writefln("%s}", indent);
    }
}
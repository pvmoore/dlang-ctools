module ctools.preprocess.PPMacroExpander;

import ctools.all;

private enum EDEBUG = false;

__gshared private File dlog;

static this() { dlog = File("target/macro_expander.txt", "w"); }
static ~this() { dlog.close(); }

private void elog(A...)(ParseState state, string fmt, A args) {
    static if(EDEBUG) {
        if(state.currentFile().filename.value=="test.h") {
            writefln(format(fmt, args));
            dlog.writefln(format(fmt, args));
        }
    }
}

final class PPMacroExpander {
private:

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
                } else if(!def.isFunc) {
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
        elog(state, "%sreplaceMacroToken: '%s' file=%s line=%s pos=%s tokens=%s",
            indent, nav.value(), state.currentFile().filename, nav.line(), nav.pos, simpleStringOfTrunc(nav.tokens, false, false));

        Token[][string] args;

        if(!def.isFunc) {
            nav.removeNext(1);

        } else {
            nav.removeNext(2);

            // Extract and remove identifier ( args )
            args = extractArgs(state, nav, def, indent ~ "   ");
        }

        // We are now left with the macro tokens

        auto nav2 = new TokenNavigator(def.tokens.dup);

        stringify(state, nav2, args, indent ~ "   ");
        replaceParams(state, nav2, args, indent ~ "   ");
        concatenate(state, nav2, indent ~ "   ");
        expandParameterTokens(state, nav2, indent ~ "   ");

        expandAll(state, nav2, false, indent ~ "-->");

        elog(state, "%safter replace = %s", indent ~ "-->", simpleStringOf(nav2.tokens, false, false));

        nav.insert(nav2.tokens);
    }
private:
    static Token[][string] extractArgs(ParseState state, TokenNavigator nav, PPDef* def, string indent) {
        elog(state, "%sextractArgs {", indent);

        Token[][string] args;
        int start = nav.pos;

        elog(state, "%s\tdef = %s", indent, def.toString());
        elog(state, "%s\ttokens before = %s pos=%s", indent, simpleStringOfTrunc(nav.tokens, false, false), nav.pos);

        void _add() {
            int count = nav.pos-start;
            int n = args.length.as!int;

            if(n < def.numParameters()) {
                string name = def.params[n];
                args[name] = nav.tokens[start..nav.pos].dup;
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
                    if(br==1) {
                        _add();
                        continue;
                    }
                    break;
                default:
                    break;
            }
            nav.skip(1);
        }

        elog(state, "\tArgs: (%s)", args.length);
        foreach(e; args.byKeyValue()) {
            elog(state, "%s\t\t%s = %s", indent, e.key, simpleStringOfTrunc(e.value, false, false));
            foreach(ref t; e.value) {
                t.marked(true);
            }
        }
        elog(state, "%s\ttokens = %s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        elog(state, "%s}", indent);
        return args;
    }
    static void stringify(ParseState state, TokenNavigator nav, Token[][string] args, string indent) {
        elog(state, "%sstringify {", indent);
        //elog("%s\t%s", indent, nav);
        while(!nav.isEof()) {
            if(nav.kind()==TK.HASH) {
                auto t = nav.peek(0);
                nav.removeNext(1);
                if(auto ptr = nav.value() in args) {
                    nav.removeNext(1);

                    t.kind = TK.STRING;
                    t.value = "\"" ~ simpleStringOfTrunc(*ptr, false, false) ~ "\"";

                    nav.insert([t]);
                } else {
                    throwIf(true, "Expecting a macro parameter");
                }
            } else {
                nav.skip(1);
            }
        }
        nav.rewind();
        elog(state, "%s\t%s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        elog(state, "%s}", indent);
    }
    static void replaceParams(ParseState state, TokenNavigator nav, Token[][string] args, string indent) {
        elog(state, "%sreplaceParams {", indent);
        elog(state, "%s\t%s", indent, simpleStringOfTrunc(nav.tokens, true, true));
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
        elog(state, "%s\t%s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        elog(state, "%s}", indent);
    }
    static void concatenate(ParseState state, TokenNavigator nav, string indent) {
        elog(state, "%sconcatenate { %s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        while(!nav.isEof()) {
            if(nav.kind()==TK.DHASH) {
                // A ## B

                // A
                int prevPos = nav.prevValidTokenPos();
                auto prev = nav.tokens[prevPos];

                // ##
                nav.removeNext(1);

                // B
                nav.skipToNextValidToken();
                auto curr = nav.peek(0);

                switch(prev.kind) {
                    case TK.ID:
                    case TK.NUMBER:
                        // remove B
                        nav.removeNext(1);
                        prev.length += curr.length;
                        prev.value ~= curr.value;

                        // Update A
                        nav.tokens[prevPos] = prev;

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
        elog(state, "%s\ttokens = %s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        elog(state, "%s}", indent);
    }
    static void expandParameterTokens(ParseState state, TokenNavigator nav, string indent) {
        elog(state, "%sexpandParameterTokens { %s", indent, simpleStringOfTrunc(nav.tokens, true, true));
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

        elog(state, "%s\ttokens = %s", indent, simpleStringOfTrunc(nav.tokens, true, true));
        elog(state, "%s}", indent);
    }
}
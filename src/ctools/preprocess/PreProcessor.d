module ctools.preprocess.PreProcessor;

import ctools.all;

/**
 * https://en.wikipedia.org/wiki/C_preprocessor
 * https://gcc.gnu.org/onlinedocs/cpp/
 * https://docs.microsoft.com/en-us/cpp/preprocessor/
 */
final class PreProcessor {
private:

public:
    static void process(ParseState state, string filename, TokenNavigator file) {
        state.definitions.add("__FILE__", PPDef("__FILE__", [Token(TK.ID, filename)]));

        enum IfState { FALSE_CONTINUE, FALSE_DONE, TRUE }
        IfState[] ifStates;
        auto ifState = IfState.TRUE;
        bool isActive = true;

        // void _dbg(string s) {
        //     if(state.currentFile().filename.value=="winspool.h") {
        //         writefln("[%s : %s] %s", file.line, file.pos, s);
        //     }
        // }

        void _updateState() {
            if(ifStates.length==0) {
                isActive = true;
                ifState = IfState.TRUE;
            } else {
                isActive = ifStates.all!(it=>it==IfState.TRUE);
                ifState =  ifStates[$-1];
            }
            //_dbg("[%s] [%s] active = %s".format(file.line, ifStates.length, isActive));
        }
        void _openState(IfState s) {
            ifStates ~= s;
            _updateState();
        }
        void _closeState() {
            ifStates.length -= 1;
            _updateState();
        }
        void _changeState(IfState s) {
            ifStates[$-1] = s;
            _updateState();
        }

        //__gshared static int counter = 0;

        while(!file.isEof()) {
            //if((counter++%8192)==0) writefln("...%s %s", state.currentFile(), file.pos);

            //_dbg("%s %s".format(file.kind, file.value));

            if(isActive) {
                // active branch
                // ═════════════════════════════════════════════════════════════════════════════════
                switch(file.kind()) {
                    case TK.HASH:
                        switch(file.value(1)) {
                            case "pragma":
                                PPPragma.process(state, file);
                                break;
                            case "define":
                                PPDefine.process(state, file);
                                break;
                            case "undef":
                                PPUndef.process(state, file);
                                break;
                            case "if":
                            case "ifdef":
                            case "ifndef":
                                auto r = PPIf.process(state, file) ? IfState.TRUE : IfState.FALSE_CONTINUE;
                                _openState(r);
                                break;
                            case "else":
                            case "elif":
                                file.removeNext(2);
                                _changeState(IfState.FALSE_DONE);
                                break;
                            case "endif":
                                file.removeNext(2);
                                _closeState();
                                break;
                            case "error":
                                PPError.process(state, file);
                                break;
                            case "include":
                                PPInclude.process(state, file);
                                break;
                            case "line":
                                PPLine.process(state, file);
                                break;
                            default:
                                file.removeNext(1);
                                break;
                        }
                        break;
                    case TK.ID:
                        // if(file.value()=="__crt_locale_data_public") {
                        //     state.log ~= "%s %s\n".format(file.line(), state.currentFile());
                        // }
                        PPMacroExpander.expandOrSkip(state, file, "");
                        break;
                    case TK.BSLASH:
                        file.removeNext(1);
                        break;
                    default:
                        file.skip(1);
                        break;
                }
            } else {
                // inactive branch
                // ═════════════════════════════════════════════════════════════════════════════════
                if(file.kind()==TK.HASH) {
                    switch(file.value(1)) {
                        case "if":
                        case "ifdef":
                        case "ifndef":
                            file.removeNext(2);
                            _openState(IfState.FALSE_DONE);
                            break;
                        case "else":
                            file.removeNext(2);
                            _changeState(ifState==IfState.FALSE_CONTINUE ? IfState.TRUE : IfState.FALSE_DONE);
                            break;
                        case "elif":
                            if(ifState==IfState.FALSE_CONTINUE) {
                                auto r = PPIf.process(state, file) ? IfState.TRUE : IfState.FALSE_CONTINUE;
                                _changeState(r);
                            } else {
                                file.removeNext(2);
                                _changeState(IfState.FALSE_DONE);
                            }
                            break;
                        case "endif":
                            file.removeNext(2);
                            _closeState();
                            break;
                        default:
                            file.removeNext(1);
                            break;
                    }
                } else {
                    file.removeNext(1);
                }
            }
        }
        throwIf(ifStates.length!=0, "Number of branches should be 0 file = %s, tokens = (%s)",
            state.currentFile(), file.tokens.length);
    }
}
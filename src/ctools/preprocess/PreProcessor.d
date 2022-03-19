module ctools.preprocess.PreProcessor;

import ctools.all;

/**
 * https://en.wikipedia.org/wiki/C_preprocessor
 * https://gcc.gnu.org/onlinedocs/cpp/
 * https://docs.microsoft.com/en-us/cpp/preprocessor/
 */
final class PreProcessor {
private:
    enum DEBUG = false;
public:
    static void process(ParseState state, string filename, TokenNavigator file) {
        state.definitions.add("__FILE__", PPDef("__FILE__", [Token(TK.ID, filename)]));

        enum IfState { FALSE_CONTINUE, FALSE_DONE, TRUE }
        IfState[] ifStates;
        auto ifState = IfState.TRUE;
        bool isActive = true;

        void _updateState() {
            if(ifStates.length==0) {
                isActive = true;
                ifState = IfState.TRUE;
            } else {
                isActive = ifStates.all!(it=>it==IfState.TRUE);
                ifState =  ifStates[$-1];
            }
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

        while(!file.isEof()) {
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
                        static if(DEBUG) writefln("ID found tokens = %s", simpleStringOf(file.tokens[file.pos..$]));
                        PPMacroExpander.expandOrSkip(state, file, "");
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
        throwIf(ifStates.length!=0, "Number of branches should be 0");
    }
}
module ctools.parse.Parser;

import ctools.all;

final class Parser {
private:
    enum DEBUG = true;
public:
    static void process(ParseState state, TokenNavigator nav) {
        while(!nav.isEof()) {
            switch(nav.kind()) {
                case TK.ID:
                    switch(nav.value()) {
                        case "":
                            break;
                        default:
                            throw new Exception("Unsupported TK.ID at %s".format(nav));
                    }
                    break;
                default:
                    throw new Exception("Unsupported kind at %s".format(nav));
            }
        }
    }
private:
    /**
     * 'typedef' type name ';'
     */
    static void parseTypedef(TokenNavigator nav) {

    }
    /**
     * [ 'unsigned' ] char|short|int|long|float|double { '*' }
     * 'struct' name '{' '}' ;'
     */
    static void parseType(TokenNavigator nav) {
        switch(nav.value()) {
            case "struct":
                parseStruct(nav);
                break;
            default:
                throw new Exception("Type %s not found".format(nav.value()));
        }
    }
    /**
     * 'struct' name '{' '}' ;'
     */
    static void parseStruct(TokenNavigator nav) {

    }
}
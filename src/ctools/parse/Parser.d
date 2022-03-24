module ctools.parse.Parser;

import ctools.all;

final class Parser {
private:
    enum DEBUG = true;
public:
    static void process(ParseState state, TokenNavigator nav) {
        Node parent = new Node();
        parent.isRoot = true;

        while(!nav.isEof()) {
            switch(nav.kind()) {
                case TK.ID:
                    switch(nav.value()) {
                        case "typedef":
                            parseTypedef(parent, nav);
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
     *
     */
    static bool isType(Node parent, TokenNavigator nav) {
        if(nav.kind()!=TK.ID) return false;
        switch(nav.value()) {
            case "char":
            case "short":
            case "int":
            case "__int64":
            case "long":
            case "float":
            case "double":
            case "void":
            case "struct":
            case "enum":
            case "unsigned":
                return true;
            default:
                // is it a typedef?
                Node n = parent.hasChildren() ? parent.last() : parent;
                return n.findTypedef(nav.value()) !is null;
        }
        assert(false);
    }
    /**
     * 'typedef' type name ';'
     */
    static void parseTypedef(Node parent, TokenNavigator nav) {

    }
    /**
     * [ 'unsigned' ] char|short|int|long|float|double { '*' }
     * 'struct' name '{' '}' ;'
     */
    static void parseType(Node parent, TokenNavigator nav) {
        bool unsigned = nav.value()=="unsigned";
        if(unsigned) nav.skip(1);

        Type type;

        switch(nav.value()) {
            case "char":
                type = new PrimitiveType(TKind.CHAR);
                nav.skip(1);
                break;
            case "short":
                type = new PrimitiveType(TKind.SHORT);
                nav.skip(1);
                break;
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
                type = parseStruct(parent, nav);
                break;
            default:
                throw new Exception("Type %s not found".format(nav.value()));
        }
        while(nav.kind==TK.STAR) {
            type.ptrDepth++;
            nav.skip(1);
        }
        parent.add(type);
    }
    /**
     * 'struct' name '{' '}' ;'
     */
    static Type parseStruct(Node parent, TokenNavigator nav) {
        todo();
        return null;
    }
}
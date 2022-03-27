module ctools.parse.TypeParser;

import ctools.all;

final class TypeParser {
private:
    TokenNavigator nav;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
    }
    /**
     *  Try to parse and return a Type or null if not a type.
     *
     * TYPE         ::= [ 'const' ] ( 'unsigned' PRIMTYPE | TYPE_NAME ) { '*' } [ 'const' ]
     * TYPE_NAME    ::= PRIM_TYPE | TYPEDEF_NAME
     * FUNCTION_PTR ::= TYPE '(' [CCONV] '*' NAME ')' '(' PARAMS ')' [=;]
     * ENUM         ::= 'enum' NAME '{' ... '}'
     * STRUCT       ::= 'struct' NAME '{' '}'
     */
    Type parse(Node parent, Metadata meta) {
        plog("parse");

        int start = nav.pos;
        bool isUnsigned;
        Type type;

        lp: while(true) {
            if(nav.kind()!=TK.ID) break;

            switch(nav.value()) {
                case "const":
                    if(type) type.meta.isConst = true; else meta.isConst = true;
                    nav.skip(1);
                    break;
                case "unsigned":
                    isUnsigned = true;
                    nav.skip(1);
                    break;
                case "_Bool":
                case "bool":
                    type = new PrimitiveType(TKind.BOOL, meta);
                    nav.skip(1);
                    break;
                case "__int8":
                case "char":
                    type = new PrimitiveType(TKind.CHAR, meta);
                    nav.skip(1);
                    break;
                case "__int16":
                case "short":
                    type = new PrimitiveType(TKind.SHORT, meta);
                    nav.skip(1);
                    break;
                case "__int32":
                case "int":
                    type = new PrimitiveType(TKind.INT, meta);
                    nav.skip(1);
                    break;
                case "__int64":
                    type = new PrimitiveType(TKind.LONG_LONG, meta);
                    nav.skip(1);
                    break;
                case "long":
                    if(nav.peek(1).value=="long") {
                        type = new PrimitiveType(TKind.LONG_LONG, meta);
                        nav.skip(2);
                    } else {
                        type = new PrimitiveType(TKind.LONG, meta);
                        nav.skip(1);
                    }
                    break;
                case "float":
                    type = new PrimitiveType(TKind.FLOAT, meta);
                    nav.skip(1);
                    break;
                case "double":
                    type = new PrimitiveType(TKind.DOUBLE, meta);
                    nav.skip(1);
                    break;
                case "struct":
                    type = parseStruct(parent);
                    break;
                case "enum":
                    type = parseEnum(parent);
                    break;
                default:
                    // is it a typedef?
                    Node n = parent.hasChildren() ? parent.last() : parent;
                    Typedef td = n.findTypedef(nav.value());
                    if(td) {
                        type = td.type;
                        nav.skip(1);
                    }
                    break lp;
            }
        }

        if(type !is null) {
            while(nav.kind==TK.STAR) {
                type.ptrDepth++;
                nav.skip(1);
            }

            if("const"==nav.value()) {
                type.meta.pointsToConst = true;
                nav.skip(1);
            }

            if(nav.kind()==TK.LBRACKET) {
                type = parseFunctionPtr(parent, type);
            }

        } else {
            // Roll back
            nav.pos = start;
        }
        return type;
    }
    /**
     *  TYPE '(' [CCONV] '*' NAME ')' '(' PARAMS ')'
     */
    Type parseFunctionPtr(Node parent, Type returnType) {
        todo();
        return null;
    }
    /**
     * 'struct' name [ '{' '}' ] ;'
     */
    Type parseStruct(Node parent) {
        todo();
        return null;
    }
    /**
     *  'enum NAME '{' ... '}'
     */
    Type parseEnum(Node parent) {
        todo();
        return null;
    }
}
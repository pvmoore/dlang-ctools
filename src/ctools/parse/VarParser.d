module ctools.parse.VarParser;

import ctools.all;

final class VarParser {
private:
    TokenNavigator nav;
    ExprParser exprParser;
    TypeParser typeParser;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
    }
    auto withExprParser(ExprParser exprParser) {
        this.exprParser = exprParser;
        return this;
    }
    auto withTypeParser(TypeParser typeParser) {
        this.typeParser = typeParser;
        return this;
    }
    /**
     * TYPE [ NAME ]
     * '...'
     * @return true if this is a genuine parameter, false if it is just void
     */
    bool parseParameter(Node parent) {
        this.log("--- parseParameter value=%s kind=%s token=%s", nav.value(), nav.kind(), nav.peek(0));

        auto typeAndName = typeParser.parse(parent);

        // ignore void parameters (void)
        if(typeAndName.type.isVoid() && !typeAndName.type.isPtr()) return false;

        auto var = new Var();
        var.name = typeAndName.name;

        var.add(typeAndName.type);

        parent.add(var);

        return true;
    }
    /**
     *  TYPE NAME [ BITFIELD ] [ ARRAY ] [ '=' EXPRESSION ] { ',' NAME } ';'
     *  ARRAY    ::= '[' Expr ']'
     *  BITFIELD ::= ':' NUMBER
     *  uint8_t pipelineCacheUUID [ 16U ] ;
     */
    void parseVar(Node parent, TypeAndName typeAndName, bool isExtern, bool isStatic) {
        this.log("parseVar value: %s kind: %s", nav.value(), nav.kind());

        auto var = new Var();
        parent.add(var);

        var.name = typeAndName.name;
        var.add(typeAndName.type);

        // bitfield bits
        if(nav.isKind(TK.COLON)) {
            nav.skip(TK.COLON);

            var.hasBitfieldBits = true;

            exprParser.parse(var);
        }

        // ,
        while(nav.isKind(TK.COMMA)) {
            nav.skip(TK.COMMA);

            // Remove ptr/array
            Type type2 = createTypeRefStripPtrAndArray(typeAndName.type);
            Var var2 = new Var();

            auto tan2 = typeParser.parseSubsequent(parent, type2);
            var2.name = tan2.name;

            var2.add(tan2.type);
            parent.add(var2);

            // expression
            if(nav.kind() == TK.EQ) {
                nav.skip(TK.EQ);

                exprParser.parse(var2);
            }
        }

        // expression
        if(nav.kind() == TK.EQ) {
            nav.skip(TK.EQ);

            var.hasInitialiser = true;

            exprParser.parse(var);
        }

        nav.skip(TK.SEMICOLON);
    }
}
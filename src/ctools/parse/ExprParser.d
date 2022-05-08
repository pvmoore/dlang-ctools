module ctools.parse.ExprParser;

import ctools.all;

final class ExprParser {
private:
    StmtParser stmtParser;
    TypeParser typeParser;
    VarParser varParser;
    TokenNavigator nav;
public:
    this(TokenNavigator nav) {
        this.nav = nav;
    }
    auto withStmtParser(StmtParser stmtParser) {
        this.stmtParser = stmtParser;
        return this;
    }
    auto withTypeParser(TypeParser typeParser) {
        this.typeParser = typeParser;
        return this;
    }
    auto withVarParser(VarParser varParser) {
        this.varParser = varParser;
        return this;
    }
    void parse(Node parent) {
        this.log("parse value=%s, kind=%s", nav.value(), nav.kind());

        lhs(parent);
        rhs(parent);

        this.log("end of parse expression:");
        //parent.dump();
    }
private:
    void lhs(Node parent) {
        switch(nav.kind()) {
            case TK.EXCLAMATION:
                parseUnary(parent, Operator.BOOL_NOT);
                break;
            case TK.TILDE:
                parseUnary(parent, Operator.BIT_NOT);
                break;
            case TK.MINUS:
                if(nav.kind(1)==TK.NUMBER) {
                    nav.skip(1);
                    parseNumber(parent, true);
                    break;
                }
                parseUnary(parent, Operator.UNARY_MINUS);
                break;
            case TK.NUMBER:
                parseNumber(parent, false);
                break;
            case TK.CHAR:
                parseChar(parent);
                break;
            case TK.STRING:
                parseString(parent);
                break;
            case TK.LBRACKET:
                nav.skip(1);
                TypeAndName tan = typeParser.tryParse(parent);
                if(tan.hasType()) {
                    parseCast(parent, tan.type);
                    break;
                }
                nav.skip(-1);
                parseParens(parent);
                break;
            case TK.STAR:
                parseDereference(parent);
                break;
            case TK.AMP:
                parseAddressOf(parent);
                break;
            case TK.ID:
                if(nav.isKind(TK.LBRACKET, 1)) {
                    // call
                    parseCall(parent);
                    break;
                }

                parseIdentifier(parent);
                break;
            default:
                throwIf(true, "Unexpected Expression %s", nav.kind());
        }
    }
    void rhs(Node parent) {
        while(true) {
            switch(nav.kind()) with(TK) {
                case NONE:
                case RBRACE:
                case RBRACKET:
                case RSQUARE:
                case COMMA:
                case COLON:
                case SEMICOLON:
                    return;
                case LSQUARE:
                    auto idx = new Index();
                    parent = attachAndRead(parent, idx, false);
                    nav.skip(TK.LSQUARE);
                    parse(idx);
                    nav.skip(TK.RSQUARE);
                    break;
                case DOT:
                case RT_ARROW:
                    auto m = new Member();
                    if(nav.isKind(TK.RT_ARROW)) {
                        m.isArrow = true;
                    }
                    nav.skip(1);
                    parent = attachAndRead(parent, m, true);
                    break;
                case QMARK:
                    // a ? b : c
                    auto tern = new Ternary();
                    nav.skip(TK.QMARK);
                    parent = attachAndRead(parent, tern, false);
                    parse(tern);
                    nav.skip(TK.COLON);
                    parse(tern);
                    break;
                case PLUS:
                case MINUS:
                case STAR:
                case SLASH:
                case PERCENT:
                case AMP:
                case HAT:
                case PIPE:
                case GT:
                case GTE:
                case LT:
                case LTE:
                case DLT:
                case DGT:
                case DAMP:
                case DPIPE:
                case PLUS_EQ:
                case MINUS_EQ:
                case STAR_EQ:
                case SLASH_EQ:
                case PERCENT_EQ:
                case DLT_EQ:
                case DGT_EQ:
                case AMP_EQ:
                case HAT_EQ:
                case PIPE_EQ:
                case DEQ:
                case NEQ:
                case EQ:
                    auto b = new Binary();
                    b.op = toBinaryOperator(nav.kind());
                    nav.skip(1);
                    parent = attachAndRead(parent, b, true);
                    break;
                default:
                    todo("RHS %s".format(nav.peek(0)));
                    break;
            }
        }
        assert(false);
    }
    void parseNumber(Node parent, bool neg) {
        auto n = new Number();
        parent.add(n);

        n.stringValue = (neg ? "-":"") ~ nav.value();
        nav.skip(1);
    }
    void parseChar(Node parent) {
        auto ch = new Char();
        parent.add(ch);

        ch.stringValue = nav.value();
        nav.skip(1);
    }
    void parseString(Node parent) {
        auto s = new String();
        parent.add(s);

        // Collect all adjacent strings into one
        while(nav.isKind(TK.STRING)) {
            s.stringValue ~= nav.value();
            nav.skip(1);
        }
    }
    void parseIdentifier(Node parent) {
        auto label = nav.value(); nav.skip(1);
        auto id = new Identifier(label);
        parent.add(id);
    }
    void parseCall(Node parent) {
        auto c = new Call();
        parent.add(c);

        c.name = nav.value(); nav.skip(1);

        nav.skip(TK.LBRACKET);
        while(!nav.isKind(TK.RBRACKET)) {
            parse(c);

            if(nav.isKind(TK.COMMA)) nav.skip(TK.COMMA);
        }
        nav.skip(TK.RBRACKET);
    }
    void parseCast(Node parent, Type type) {
        auto c = new Cast();
        parent.add(c);
        c.add(type);

        nav.skip(TK.RBRACKET);
        // Expr
        parse(c);
    }
    void parseParens(Node parent) {
        auto p = new Parens();
        parent.add(p);

        nav.skip(TK.LBRACKET);
        parse(p);
        nav.skip(TK.RBRACKET);
    }
    void parseUnary(Node parent, Operator op) {
        auto u = new Unary();
        parent.add(u);

        nav.skip(1);
        u.op = op;
        parse(u);
    }
    void parseDereference(Node parent) {
        auto v = new Deref();
        parent.add(v);
        nav.skip(TK.STAR);

        parse(v);
    }
    void parseAddressOf(Node parent) {
        auto a = new AddressOf();
        parent.add(a);
        nav.skip(TK.AMP);

        parse(a);
    }
    Expr attachAndRead(Node parent, Expr newExpr, bool andRead) {

        Node prev = parent;

        ///
        /// Swap expressions according to operator precedence
        ///
        const doPrecedenceCheck = prev.isA!Expr;
        if(doPrecedenceCheck) {

            /// Adjust to account for operator precedence
            Expr prevExpr = prev.as!Expr;
            while(prevExpr.parent && newExpr.precedence() >= prevExpr.precedence()) {

                if(!prevExpr.parent.isA!Expr) {
                    prev = prevExpr.parent;
                    break;
                }

                prevExpr = prevExpr.parent.as!Expr;
                prev     = prevExpr;
            }
        }

        newExpr.add(prev.last());

        prev.add(newExpr);

        if(andRead) {
            lhs(newExpr);
        }

        return newExpr;
    }
}
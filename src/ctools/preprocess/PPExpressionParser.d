module ctools.preprocess.PPExpressionParser;

import ctools.all;

private enum DEBUG = false;
private enum POISON_VALUE = 0xf123e987_01010101;

final class PPExpressionParser {
public:
    static long parse(TokenNavigator nav) {
        static if(DEBUG) writefln("parse :: %s", simpleStringOf(nav.tokens));
        auto parent = new PPLiteral(999);
        auto expr = lhs(nav);

        static if(DEBUG) writefln("lhs = %s", expr);

        parent.add(expr);
        rhs(nav, parent);

        parent.dump();

        auto e = parent.first();
        static if(DEBUG) writefln("result = %s", e.eval());

        return parent.first().eval();
    }
private:
    static void parse(TokenNavigator nav, PPExpression parent) {
        auto expr = lhs(nav);
        parent.add(expr);
        rhs(nav, parent);
    }
    static PPExpression lhs(TokenNavigator nav) {
        switch(nav.kind()) {
            case TK.MINUS:
                nav.skip(1);
                auto neg = new PPUnary(TK.MINUS);
                neg.add(lhs(nav));
                return neg;
            case TK.EXCLAMATION:
                nav.skip(1);
                auto not = new PPUnary(TK.EXCLAMATION);
                not.add(lhs(nav));
                return not;
            case TK.TILDE:
                nav.skip(1);
                auto not = new PPUnary(TK.TILDE);
                not.add(lhs(nav));
                return not;
            case TK.NUMBER:
                auto value = nav.value();
                nav.skip(1);
                //writefln("line = %s", nav.line);
                return new PPLiteral(convertToLong(value));
            case TK.LBRACKET:
                nav.skip(1);
                auto parens = new PPParens();
                parse(nav, parens);
                nav.skip(1);
                return parens;
            case TK.ID:
                // If we see an identifer here it means it is undefined.
                // We'll hack this by replacing it with a poison value
                nav.skip(1);
                return new PPLiteral(POISON_VALUE);
            default:
                throw new Exception("Unhandled expression lhs %s".format(nav.peek(0)));
        }
        assert(false);
    }
    static void rhs(TokenNavigator nav, PPExpression parent) {
        while(true) {
            TK kind = nav.kind();
            if(kind==TK.NONE) return;

            switch(kind) {
                case TK.RBRACKET:
                    return;
                case TK.PLUS:
                case TK.MINUS:
                case TK.STAR:
                case TK.SLASH:
                case TK.PERCENT:
                case TK.AMP:
                case TK.PIPE:
                case TK.HAT:
                case TK.DPIPE:
                case TK.DAMP:
                case TK.DLT:
                case TK.DGT:
                case TK.LT:
                case TK.LTE:
                case TK.GT:
                case TK.GTE:
                case TK.DEQ:
                case TK.NEQ:
                    nav.skip(1);
                    parent = attach(nav, parent, new PPBinary(kind));
                    break;
                default:
                    throw new Exception("Syntax error @ token %s".format(nav.peek(0)));
            }
        }
    }
    static PPExpression attach(TokenNavigator nav, PPExpression parent, PPExpression newNode) {
        PPExpression prev = parent;
        while(prev.parent !is null && newNode.precedence() >= prev.precedence()) {
            prev = prev.parent;
        }
        newNode.add(prev.last());
        newNode.add(lhs(nav));

        prev.add(newNode);

        return newNode;
    }
}

// ─────────────────────────────────────────────────────────────────────────────────────────────────
abstract class PPExpression {
    PPExpression[] children;
    PPExpression parent;

    abstract long eval();
    abstract int precedence();

    final void dump(string indent = "") {
        static if(DEBUG) writefln("%s%s", indent, this);
        foreach(c; children) {
            c.dump(indent ~ "  ");
        }
    }
    final PPExpression first() {
        return children[0];
    }
    final PPExpression last() {
        return children[$-1];
    }
    final void add(PPExpression e) {
        detach(e);
        children ~= e;
        e.parent = this;
    }
    final void detach(PPExpression e) {
        if(e.parent) {
            e.parent.children.removeAt(e.index());
            e.parent = null;
        }
    }
    final int index() {
        throwIf(parent is null);
        return parent.children.indexOf(this);
    }
}
// ─────────────────────────────────────────────────────────────────────────────────────────────────
final class PPLiteral : PPExpression {
    long value;

    this(long value) {
        this.value = value;
    }

    override long eval() {
        return value;
    }
    override int precedence() {
        return 30;
    }
    override string toString() {
        import std.conv : to;
        return to!string(value);
    }
}
// ─────────────────────────────────────────────────────────────────────────────────────────────────
final class PPUnary : PPExpression {
    TK kind;

    this(TK kind) {
        this.kind = kind;
    }

    override long eval() {
        switch(kind) {
            case TK.MINUS:
                return -first().eval();
            case TK.EXCLAMATION:
                return !first().eval();
            case TK.TILDE:
                return ~first().eval();
            default:
                throwIf(true, "Unsupported kind %s", kind);
                break;
        }
        assert(false);
    }
    override int precedence() {
        return 3;
    }
    override string toString() {
        return "PPUnary(%s)".format(kind);
    }
}
// ─────────────────────────────────────────────────────────────────────────────────────────────────
final class PPBinary : PPExpression {
    TK kind;

    this(TK kind) {
        this.kind = kind;
    }

    override long eval() {
        switch(kind) {
            case TK.PIPE:
                return first().eval() | last().eval();
            case TK.HAT:
                return first().eval() ^ last().eval();
            case TK.AMP:
                return first().eval() & last().eval();
            case TK.PLUS:
                return first().eval() + last().eval();
            case TK.MINUS:
                return first().eval() - last().eval();
            case TK.STAR:
                return first().eval() * last().eval();
            case TK.SLASH:
                return first().eval() / last().eval();
            case TK.PERCENT:
                return first().eval() % last().eval();
            case TK.DPIPE:
                return first().eval() || last().eval();
            case TK.DAMP:
                return first().eval() && last().eval();
            case TK.DLT:
                return first().eval() << last().eval();
            case TK.DGT:
                return first().eval() >> last().eval();
            case TK.LT:
                return first().eval() < last().eval();
            case TK.LTE:
                return first().eval() <= last().eval();
            case TK.GT:
                return first().eval() > last().eval();
            case TK.GTE:
                return first().eval() >= last().eval();
            case TK.DEQ:
                return first().eval() == last().eval();
            case TK.NEQ:
                return first().eval() != last().eval();
            default:
                throwIf(true, "Eval unsupported kind %s", kind);
                break;
        }
        assert(false);
    }
    override int precedence() {
        switch(kind) {
            case TK.DPIPE:
                return 12;
            case TK.DAMP:
                return 11;
            case TK.PIPE:
                return 10;
            case TK.HAT:
                return 9;
            case TK.AMP:
                return 8;
            case TK.DEQ:
            case TK.NEQ:
                return 7;
            case TK.LT:
            case TK.LTE:
            case TK.GT:
            case TK.GTE:
                return 6;
            case TK.DLT:
            case TK.DGT:
                return 5;
            case TK.PLUS:
            case TK.MINUS:
                return 4;
            case TK.STAR:
            case TK.SLASH:
            case TK.PERCENT:
                return 3;
            default:
                throwIf(true, "Unsupported kind %s", kind);
                break;
        }
        assert(false);
    }
    override string toString() {
        return "PPBinary(%s)".format(kind);
    }
}
// ─────────────────────────────────────────────────────────────────────────────────────────────────
final class PPParens : PPExpression {

    override long eval() {
        return first().eval();
    }
    override int precedence() {
        return first().precedence();
    }
    override string toString() {
        return "PPParens";
    }
}
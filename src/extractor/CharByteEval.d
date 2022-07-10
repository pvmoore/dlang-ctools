module extractor.CharByteEval;

import ctools.all;
import extractor;

/**
 * Evaluate the D type of a given PrimitiveType.
 *
 * Assume it is a char unless the name matches one of the supplied bytesRegexes.
 */
final class CharByteEval : Emitter.CharBytePlugin {
private:
    //enum Regex!char bytesPattern = regex(r"[Bb]ytes");
        //regex(r"^.*([Nn]ame|[Ss]tr]|[Pp]refix|[Mm]essage|[Mm]sg|[Dd]esc|[Tt]itle).*$");

    Regex!(char)[] bytesRegexes;
public:
    this() {

    }
    auto withBytesRegex(Regex!char regex) {
        this.bytesRegexes ~= regex;
        return this;
    }
    override string eval(PrimitiveType t) {
        if(t.unsigned) return "byte";

        auto isPtr        = t.parent.isA!PtrType;
        auto isArray      = t.parent.isA!ArrayType;
        auto isPtrOrArray = isArray || t.parent.isA!PtrType;

        if(auto name = getName(t)) {
            if(name.matchesAny(bytesRegexes)) {
                return "byte";
            }
        }
        if(isPtr) {
            return "immutable(char)";
        }
        // if(t.parent.isA!ArrayType) {
        //     return "char";
        // }
        return "char";
    }
private:
    string getName(PrimitiveType t) {

        // Is it a variable type?
        if(auto v = t.getAncestor!Var) {
            return v.name;
        }
        // Is it a function return type?
        if(auto fd = t.getAncestor!FuncDecl) {

            auto isReturnType = t.parent is fd;

            if(auto ptr = t.parent.as!PtrType) {
                isReturnType |= ptr.parent is fd;
            }

            if(isReturnType) {
                return fd.name;
            }
        }
        return null;
    }
}
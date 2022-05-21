module extractor.EConfig;

import ctools.all;
import extractor;

final class EConfig {
private:
public:
    Regex!char[] requiredFunctionRegexes;
    Regex!char[] requiredStructRegexes;
    Regex!char[] requiredEnumRegexes;

    this() {

    }
    this(string filename) {

    }

    bool isRequiredFunction(string name) {
        return checkMatch(requiredFunctionRegexes, name);
    }
    bool isRequiredStruct(string name) {
        return checkMatch(requiredStructRegexes, name);
    }
    bool isRequiredEnum(string name) {
        return checkMatch(requiredEnumRegexes, name);
    }
private:
    bool checkMatch(Regex!char[] regexes, string name) {
        if(!name) return false;
        foreach(r; regexes) {
            auto c = matchFirst(name, r);
            return !c.empty;
        }
        return false;
    }
}
module extractor.EConfig;

import ctools.all;
import extractor;

final class EConfig {
private:
public:
    Regex!char[] requiredFunctionRegexes;
    Regex!char[] requiredTypeRegexes;

    Regex!char[] excludeRegexes;

    this() {

    }
    this(string filename) {

    }

    bool isRequiredFunction(string name) {
        return checkMatch(requiredFunctionRegexes, name);
    }
    bool isRequiredType(string name) {
        return checkMatch(requiredTypeRegexes, name);
    }
    bool isExcluded(string name) {
        if(!name) return true;
        foreach(r; excludeRegexes) {
            auto c = matchFirst(name, r);
            if(!c.empty) return true;
        }
        return false;
    }
private:
    bool checkMatch(Regex!char[] regexes, string name) {
        if(!name) return false;
        foreach(r; regexes) {
            auto c = matchFirst(name, r);
            if(!c.empty && !isExcluded(name)) return true;
        }
        return false;
    }
}
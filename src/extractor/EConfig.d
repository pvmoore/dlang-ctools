module extractor.EConfig;

import extractor.all;

final class EConfig {
private:
public:
    Set!string requiredFunctionNames;
    Set!string requiredStructNames;
    Set!string requiredEnumNames;

    Regex!char[] requiredFunctionRegexes;

    this() {
        this.requiredFunctionNames = new Set!string;
        this.requiredStructNames = new Set!string;
        this.requiredEnumNames = new Set!string;
    }
    this(string filename) {

    }

    bool isRequiredFunction(string name) {
        if(requiredFunctionNames.contains(name)) return true;
        foreach(r; requiredFunctionRegexes) {
            auto c = matchFirst(name, r);
            return !c.empty;
        }
        return false;
    }
}
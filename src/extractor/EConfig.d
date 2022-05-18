module extractor.EConfig;

import extractor.all;

final class EConfig {
private:
public:
    Set!string requiredFunctionNames;
    Set!string requiredStructNames;

    this() {
        this.requiredFunctionNames = new Set!string;
        this.requiredStructNames = new Set!string;
    }
    this(string filename) {

    }
}
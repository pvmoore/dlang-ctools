module extractor.EConfig;

import extractor.all;

final class EConfig {
private:
public:
    Set!string requiredFunctionNames;

    this() {
        this.requiredFunctionNames = new Set!string;
    }
    this(string filename) {

    }
}
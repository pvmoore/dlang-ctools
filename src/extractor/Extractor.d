module extractor.Extractor;

import extractor.all;

final class Extractor {
private:
    EConfig config;
public:
    this(EConfig config) {
        this.config = config;
    }
    void process(Node parent) {
        parent.iterate(&evaluate);
    }
private:
    void evaluate(Node n) {
        
    }
}
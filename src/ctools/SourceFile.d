module ctools.SourceFile;

import ctools.all;

final class SourceFile {
public:
    Filepath path;
    TokenNavigator nav;

    Token[] tokens() {
        return nav.tokens;
    }

    this(Filepath path) {
        this.path = path;
    }
}
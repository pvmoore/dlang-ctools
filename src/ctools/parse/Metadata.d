module ctools.parse.Metadata;

import ctools.all;

struct Metadata {
    uint alignment;
    CConv cconv;
    bool isExtern;
    bool isStatic;
    bool isConst;
    bool pointsToConst;

    void reset() {
        isExtern = false;
        isStatic = false;
        isConst = false;
        pointsToConst = false;
        cconv = CConv.cdecl;
    }
}

enum CConv {
    cdecl,
    stdcall
}
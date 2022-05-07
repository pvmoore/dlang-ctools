module ctools.parse.Cconv;

import ctools.all;

enum CConv {
    CDECL,
    STDCALL
}

CConv parseCConv(TokenNavigator nav) {
    switch(nav.value()) {
        case "__cdecl":
            nav.skip(1);
            return CConv.CDECL;
        case "__stdcall":
            nav.skip(1);
            return CConv.STDCALL;
        default:
            throwIf(true, "Unknown cconv %s".format(nav.value()));
            break;
    }
    assert(false);
}
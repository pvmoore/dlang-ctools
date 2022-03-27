module ctools.util;

import ctools.all;

bool isDigit(char c) {
    return c >= '0' && c <= '9';
}
int maxOf(int a, int b) {
    return a>b ? a : b;
}
long convertToLong(string s) {
    //201703l
    try{
    if(s.startsWith("0x") || s.startsWith("0X")) {
        return to!long(s[2..$], 16);
    }

    if(s.endsWith("l") || s.endsWith("L")) {
        s = s[0..$-1];
    }
    return to!long(s);
    }catch(Exception e) {
        writefln("s = %s", s);
        throw e;
    }
}
module ctools.util;

import ctools.all;

bool isDigit(char c) {
    return c >= '0' && c <= '9';
}
int maxOf(int a, int b) {
    return a>b ? a : b;
}

#define CreateWindowA(lpClassName, lpWindowName, dwStyle, x, y, \
    nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam) \
    CreateWindowExA(0L, lpClassName, lpWindowName, dwStyle, x, y, \
    nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)

CreateWindowA(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);

/*
TOKENS:

    CreateWindowExA ( 0L , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 ) ;

*/
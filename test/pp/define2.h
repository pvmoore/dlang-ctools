
//
// Function macro definitions
//

#define A 1
#define B (2-2)

// a+1*(2-2)
#define C(a) a+A*B

#define AAA(x) x+1
#define BBB AAA(5)

/// 4 + 1
AAA(4);

// 5+1
BBB;

// 1+1
#define CCC BBB

// 5+1
CCC;

#define EMPTY()

EMPTY();

#define InterlockedAdd _InlineInterlockedAdd

void InterlockedAdd(int a) { }

/*
TOKENS:
    4 + 1 ;
    5 + 1 ;
    5 + 1 ;
    ;
    void _InlineInterlockedAdd ( int a ) { }
*/
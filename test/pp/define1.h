
// Object definitions

#define A

#define B 1

// (2 + 1)
#define C (2  +  B)

// Multi-line

// 1 + 1 + 2
#define D 1\
 + 1        \
 + C /* comment */


B;
C;
D;


/*
TOKENS:
    1 ;
    ( 2 + 1 ) ;
    1 + 1 + ( 2 + 1 ) ;
*/

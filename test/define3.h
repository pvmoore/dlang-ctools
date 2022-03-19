//
// Stringize and token pasting
//

#define FOO(x) char* a = #x

#define BAR(x) char* a##x = #x

// char* a = "3";
FOO(3);

// char* a3 = "3";
BAR(3);

#define A FOO(3)

#define B BAR(3)

A;
B;

/*
TOKENS:
    char * a = "3" ;
    char * a3 = "3" ;
    char * a = "3" ;
    char * a3 = "3" ;
*/
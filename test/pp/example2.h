
// Stringification from:
// https://www.iar.com/knowledge/learn/programming/advanced-preprocessor-tips-and-tricks/

#define NAME Anders

#define NAIVE_STR(x) #x

#define STR_HELPER(x) #x
#define STR(x) STR_HELPER(x)

NAIVE_STR(10);
NAIVE_STR(NAME);
STR(NAME);


/*
TOKENS:
    "10" ;
    "NAME" ;
    "Anders" ;
*/
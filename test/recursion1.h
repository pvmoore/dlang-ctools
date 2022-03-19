
// Recursion is not allowed

# define pr(n) ((n==1) ? 1 : pr(n-1))

pr(1);

/*
TOKENS:
    ( ( 1 == 1 ) ? 1 : pr ( 1 - 1 ) ) ;
*/
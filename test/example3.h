
// Concatenation example from:
// https://www.iar.com/knowledge/learn/programming/advanced-preprocessor-tips-and-tricks/

#define TIME Time

#define GLUE_HELPER(x, y) x##y
#define GLUE(x, y) GLUE_HELPER(x, y)

#define NAIVE_AVERAGE(x) (((Max##x) - (Min##x)) / (x##Count))

#define AVERAGE(x) (((GLUE(Max,x)) - (GLUE(Min,x))) / (GLUE(x,Count)))

return NAIVE_AVERAGE(Time);
return NAIVE_AVERAGE(TIME);

return AVERAGE(TIME);

/*
TOKENS:
    return ( ( ( MaxTime ) - ( MinTime ) ) / ( TimeCount ) ) ;
    return ( ( ( MaxTIME ) - ( MinTIME ) ) / ( TIMECount ) ) ;
    return ( ( ( MaxTime ) - ( MinTime ) ) / ( TimeCount ) ) ;
*/
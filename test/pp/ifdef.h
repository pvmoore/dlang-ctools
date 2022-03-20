
start

#define A


// true branch taken
1
#ifdef A
    2
#endif
3

// false branch taken
#ifdef B
    4
#endif
5


// true branch taken
#ifdef A
6
#else
7
#endif
8

// false branch taken
#ifdef B
9
#else
10
#endif
11

// true true
#ifdef A
12
#elif 1
13
#endif

// false true
#ifdef B
14
#elif 1
15
#endif

#if defined(VALUE) && VALUE == 7
16
#endif

#define VALUE2 7
#if defined(VALUE2) && VALUE2 == 7
17
#endif

end


/*
TOKENS:
    start
    1
    2
    3
    5
    6
    8
    10
    11
    12
    15
    17
    end
*/
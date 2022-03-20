
start

#define A
#define B 1
#define C (1+A)

//--------------------- A
#if 1
    A1
#else
A2
#endif

#if 0
A3
#else
    A4
#endif

//--------------------- B
#if 1
    B1
#elif 1
B2
#elif 0
B3
#else
B4
#endif
2

//--------------------- C
#if 0
C1
#elif 0
C2
#elif 1
    C3
#else
C4
#endif
3

//--------------------- D
#ifdef A
    D1
#else
D2
#endif
6

//--------------------- E
#ifndef A
E1
#else
    E2
#endif

end

/*
TOKENS:
    start

    A1
    A4
    B1
    2
    C3
    3
    D1
    6
    E2

    end
*/

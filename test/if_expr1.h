
start

#define A

//--------------------- A
#if 1
    A1
#endif

#if 1+1
    B1
#endif

#if defined A
     C1
#endif

#if defined(A)
     C2
#endif

#if defined ( A )
     C3
#endif

#if defined NOPE
     C4
#endif

#if defined NOPE || defined A
     D1
#endif



end

/*
TOKENS:
    start

    A1
    B1
    C1 C2 C3
    D1

    end
*/

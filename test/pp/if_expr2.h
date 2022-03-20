
start

#define A
#define ONE 1

//----
#if 1+1
     1
#endif

#if 1-1
     2
#endif

#if 1*1
     3
#endif

#if 1/1
     4
#endif

#if 1%1
     5
#endif

#if 1|1
     6
#endif

#if 1&1
     7
#endif

#if 1&0
     8
#endif

#if 1 > 0
     9
#endif


#if 0 > 1
     10
#endif

#if 0 >= 0
     11
#endif

#if 0 <= 0
     12
#endif

#if 0 == 0
     13
#endif

#if 0 == 1
     14
#endif

#if 0 != 0
     15
#endif

#if 0 != 1
     16
#endif

#if ONE - 1
     17
#endif

#if -ONE == -1
     18
#endif

#if ~1 & 1
     19
#endif

#if !(1==1)
     20
#endif

#if 1^1
     21
#endif

#if 1^0
     22
#endif

end

/*
TOKENS:
    start

     1
     3
     4
     6
     7
     9
     11
     12
     13
     16
     18
     22

    end
*/

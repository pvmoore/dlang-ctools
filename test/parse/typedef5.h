


typedef struct __declspec ( align ( 16 ) ) _M128A { 
    int Low ; 
    int High ;

} M128A; 

/*
EXPECT:

Parent
  Typedef 'M128A'
    struct _M128A
      Var Low
        int
      Var High
        int     
*/

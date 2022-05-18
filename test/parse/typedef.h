
typedef int int8, * pint8, p[2], ** ppint8;
typedef pint8 int8_2[2], * pint8_2;


// char* PCHAR_T
// char** PPCHAR_T[2]
// char (*fp1[2])(int)
// char ** (*fp2)(int)
typedef char * PCHAR_T , ** PPCHAR_T[2], (*fp1[2])(int), ** (*fp2)(int);

typedef int A[3];
typedef int B[];


/*
EXPECT:

Parent
  Typedef 'int8'
    int
  Typedef 'pint8'
    *
      int
  Typedef 'p'
    []
      int
      Number (2)
  Typedef 'ppint8'
    **
      int


  Typedef 'int8_2'
    []
      pint8 (= int*)
      Number (2)
  Typedef 'pint8_2'
    *
      pint8 (= int*)


  Typedef 'PCHAR_T'
    *
      char
  Typedef 'PPCHAR_T'
    []
      **
        char
      Number (2)
  Typedef 'fp1'
    []
      *
        FuncDecl fp1
          char
          Var
            int
      Number (2)
  Typedef 'fp2'
    *
      FuncDecl fp2
        **
          char
        Var
          int


  Typedef 'A'
    []
      int
      Number (3)
  Typedef 'B'
    []
      int
      Number (-1)
*/
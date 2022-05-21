
int foo(int a);

float bar(int a, double b) { return a; }

typedef void * ( __stdcall * name ) ( void * pUserData) ;

__inline void* static name(int a) { return 0; }

__inline void static __declspec ( deprecated ) ua_wcscpy (int a) { }

/*
EXPECT:

Parent
  FuncDecl foo
    int
    Var a
      int

  FuncDecl bar
    float
    Var a
      int
    Var b
      double
    FuncDef
      Return
        Identifier 'a'

  Typedef 'name'
    *
      FuncDecl name
        *
          void
        Var pUserData
          *
            void

  FuncDecl name
    *
      void
    Var a
      int
    FuncDef
      Return
        Number (0)

  FuncDecl ua_wcscpy
    void
    Var a
      int
    FuncDef
*/
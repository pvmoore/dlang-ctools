
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

  FuncDef
    FuncDecl bar
      float
      Var a
        int
      Var b
        double
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

  FuncDef
    FuncDecl name
      *
        void
      Var a
        int
      Return
        Number (0)

  FuncDef
    FuncDecl ua_wcscpy
      void
      Var a
        int
*/

int a, * a2, **a3, a4[2], *a5[5];
int b[1];
int* c[1][2];

void (*baz)(int);
void (*baz2[2])(int);
void (*baz3[2][3])();

struct S {
  int a : 6;
  int b[2], *b2, *b3[3];
}

/*
EXPECT:

Parent
  Var a
    int
  Var a2
    *
      int
  Var a3
    **
      int
  Var a4
    []
      int
      Number (2)
  Var a5
    []
      *
        int
      Number (5)
  Var b
    []
      int
      Number (1)
  Var c
    [][]
      *
        int
      Number (1)
      Number (2)

  Var baz
    *
      FuncDecl baz
        void
        Var
          int
  Var baz2
    []
      *
        FuncDecl baz2
          void
          Var
            int
      Number (2)
  Var baz3
    [][]
      *
        FuncDecl baz3
          void
      Number (2)
      Number (3)

  struct S
    Var a : BITFIELD
      int
      Number (6)
    Var b
      []
        int
        Number (2)
    Var b2
      *
        int
    Var b3
      []
        *
          int
        Number (3)

*/

int a = 1 ? 3 : 5;

int b = 1>0 ? 1+2 : 6*7;

/*
EXPECT:

Parent
  Var a
    int
    Ternary
      Number (1)
      Number (3)
      Number (5)
  Var b
    int
    Ternary
      Binary GT
        Number (1)
        Number (0)
      Binary ADD
        Number (1)
        Number (2)
      Binary MUL
        Number (6)
        Number (7)

*/
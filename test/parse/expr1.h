
int a = 1 * 2 + 3 / 4;

/*
EXPECT:

Parent
  Var a
    int
    Binary ADD
      Binary MUL
        Number (1)
        Number (2)
      Binary DIV
        Number (3)
        Number (4)
*/
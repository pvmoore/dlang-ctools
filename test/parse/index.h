
int index[5][6];

int a = index[1];

int b = index[1][2];

/*
EXPECT:

Parent
  Var index
    [][]
      int
      Number (5)
      Number (6)
  Var a
    int
    Index
      Identifier 'index'
      Number (1)
  Var b
    int
    Index
      Index
        Identifier 'index'
        Number (1)
      Number (2)

*/
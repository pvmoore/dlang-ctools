
int a = str.value;
int b = str->value;

/*
EXPECT:

Parent
  Var a
    int
    Member (.)
      Identifier 'str'
      Identifier 'value'
  Var b
    int
    Member (->)
      Identifier 'str'
      Identifier 'value'

*/
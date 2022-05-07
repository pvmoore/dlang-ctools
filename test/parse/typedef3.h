
typedef int ROUTINE (int a);
typedef int ((ROUTINE2)) (int a);

typedef ROUTINE * PROUTINE;

// Equivalent declarations:
// int e(int);
// ROUTINE e;

int e1(int);
ROUTINE e2;

typedef void* (ENCLAVE_TARGET_FUNCTION)(int);
typedef ENCLAVE_TARGET_FUNCTION (*PENCLAVE_TARGET_FUNCTION);
typedef ENCLAVE_TARGET_FUNCTION (PENCLAVE_TARGET_FUNCTION2);

/*
EXPECT:

Parent
  Typedef 'ROUTINE'
    FuncDecl ROUTINE
      int
      Var a
        int
  Typedef 'ROUTINE2'
    FuncDecl ROUTINE2
      int
      Var a
        int
  Typedef 'PROUTINE'
    *
      ROUTINE
  FuncDecl e1
    int
    Var
      int
  Var e2
    ROUTINE

  Typedef 'ENCLAVE_TARGET_FUNCTION'
    FuncDecl ENCLAVE_TARGET_FUNCTION
      *
        void
      Var
        int
  Typedef 'PENCLAVE_TARGET_FUNCTION'
    *
      ENCLAVE_TARGET_FUNCTION
  Typedef 'PENCLAVE_TARGET_FUNCTION2'
    ENCLAVE_TARGET_FUNCTION

*/
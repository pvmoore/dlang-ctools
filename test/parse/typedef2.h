
typedef struct VkAllocationCallbacks {
  void * pUserData ;
} VkAllocationCallbacks;

typedef struct P {
  struct {
    int a : 64 - 8;
  } s;
  union {
    int b;
    void* c;
  } u;
} t;


/*
EXPECT:

Parent
  Typedef 'VkAllocationCallbacks'
    struct VkAllocationCallbacks
      Var pUserData
        *
          void
          
  Typedef 't'
    struct P
      Var s
        struct
          Var a : BITFIELD
            int
            Binary SUB
              Number (64)
              Number (8)
      Var u
        union
          Var b
            int
          Var c
            *
              void
*/
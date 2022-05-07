

typedef struct _ImageArchitectureHeader {
    unsigned int AmaskValue : 1 ;
    int;
    unsigned int AmaskShift : 8 ;
    int : 16 ;
    int FirstEntryRVA ;
} IMAGE_ARCHITECTURE_HEADER;


/*
EXPECT:

Parent
  Typedef 'IMAGE_ARCHITECTURE_HEADER'
    struct _ImageArchitectureHeader
      Var AmaskValue : BITFIELD
        unsigned int
        Number (1)
      Var
        int
      Var AmaskShift : BITFIELD
        unsigned int
        Number (8)
      Var : BITFIELD
        int
        Number (16)
      Var FirstEntryRVA
        int

*/
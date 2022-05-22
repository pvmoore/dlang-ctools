
typedef struct Forward Forward;

struct Forward;

struct Forward f1;
Forward f2;

struct Forward {
    int a;
};

struct A {
    float a;
    float b, c;
    float d[3], e[4];
};

/*
EXPECT:

Parent
    Typedef 'Forward'
        struct Forward
            Var a
                int
    struct Forward
    Var f1
        Forward (= struct Forward)
    Var f2
        Forward (= struct Forward)
    struct Forward
    struct A
        Var a
            float
        Var b
            float
        Var c
            float
        Var d
            []
                float
                Number (3)
        Var e
            []
                float
                Number (4)
*/
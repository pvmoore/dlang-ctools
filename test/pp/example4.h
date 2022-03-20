
start


#define NAIVE_STR(x) #x
#define NAME MyName
NAIVE_STR(NAME);

#define A
#define B 1
#define C (1+B)
#define ADD(x,y) x+y
#define THING(x) #x
#define FOO(n) int f##n

//--------------------- A

int a = ADD(1,2);

THING(int a);

FOO(1);



#define AA(n) I like the number n
AA (123)


end

/*
TOKENS:
    start
    "NAME" ;
    int a = 1 + 2 ;
    "int a" ;
    int f1 ;
    I like the number 123
    end
*/

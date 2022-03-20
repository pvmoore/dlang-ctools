
start

#define EMPTY()
#define A(n) I like the number n

A (123);
A EMPTY() (123);

end

/*
TOKENS:
    start
    I like the number 123 ;
    A ( 123 ) ;
    end
*/
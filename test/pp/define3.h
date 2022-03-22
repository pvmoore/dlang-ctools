//
// Stringize and token pasting
//

start

#define FOO(x) char* a = #x

#define BAR(x) char* a##x = #x

// char* a = "3";
FOO(3);

// char* a3 = "3";
BAR(3);

#define A FOO(3)

#define B BAR(3)

A;
B;

#define TRANSACTIONMANAGER_OBJECT_PATH  L"\\TransactionManager\\"
#define TRANSACTION_OBJECT_PATH         L"\\Transaction\\"
#define ENLISTMENT_OBJECT_PATH          L"\\Enlistment\\"
#define RESOURCE_MANAGER_OBJECT_PATH    L"\\ResourceManager\\"

#define SEP                             L'\\'

end

/*
TOKENS:
    start
    char * a = "3" ;
    char * a3 = "3" ;
    char * a = "3" ;
    char * a3 = "3" ;
    end
*/
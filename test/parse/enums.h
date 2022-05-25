
typedef enum E1 {
    UmsThreadInvalidInfoClass = 0
} E1a , * PE1 ;

typedef enum E2 {
    UmsSchedulerStartup = 0
} E2a , * PE2 ;


typedef enum E1 UMS_THREAD_INFO_CLASS , * PUMS_THREAD_INFO_CLASS ;
typedef enum E2 UMS_SCHEDULER_REASON ;

typedef enum { A, B } E;

/*
EXPECT:

Parent
  Typedef 'E1a'
    enum E1
      Identifier 'UmsThreadInvalidInfoClass'
        Number (0)
  Typedef 'PE1'
    *
      enum E1
  Typedef 'E2a'
    enum E2
      Identifier 'UmsSchedulerStartup'
        Number (0)
  Typedef 'PE2'
    *
      enum E2
  Typedef 'UMS_THREAD_INFO_CLASS'
    enum E1
  Typedef 'PUMS_THREAD_INFO_CLASS'
    *
      enum E1
  Typedef 'UMS_SCHEDULER_REASON'
    enum E2

  Typedef 'E'
    enum E
      Identifier 'A'
      Identifier 'B'

*/
%{ 
#include <stdio.h> 
#include <stdlib.h> 
int yylex(void);  
void yyerror(const char *s);
int id=0, dig=0, key=0, op=0; 
%} 

%token DIGIT ID KEY OP 

%% 

input: 
      DIGIT input { dig++; } 
    | ID input    { id++; } 
    | KEY input   { key++; } 
    | OP input    { op++; } 
    | DIGIT       { dig++; } 
    | ID          { id++; } 
    | KEY         { key++; } 
    | OP          { op++; } 
; 

%% 

extern int yylex(); 
extern FILE *yyin;

int main() 
{ 
    FILE *myfile = fopen("input.c", "r"); 
    if (!myfile) { 
        printf("I can't open input.c!\n"); 
        return -1; 
    } 
    yyin = myfile; 

    yyparse(); 

    printf("numbers = %d\nKeywords = %d\nIdentifiers = %d\noperators = %d\n", 
           dig, key, id, op); 

    return 0;
} 

void yyerror(const char *s) { 
    printf("EEK, parse error! Message: %s\n", s); 
    exit(-1); 
} 

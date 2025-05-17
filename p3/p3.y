%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();  // Declare yylex
extern int yyerror(const char *s);  // Declare yyerror
%}

%token A B

%%

S: X B
  ;

X: A X
  | /* empty */
  ;

%%

int yyerror(const char *s) {
    printf("Invalid String\n");
    exit(0);
}

int main() {
    printf("Enter the input:\n");
    yyparse();  // Start the parsing process
    printf("Valid String\n");
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();  // Declare yylex function
extern int yyerror(const char *s);  // Declare yyerror function
%}

%token num
%left '+' '-'
%left '*' '/'

%%

input: exp { printf("%d\n", $$); exit(0); }
     ;

exp: exp '+' exp { $$ = $1 + $3; }
   | exp '-' exp { $$ = $1 - $3; }
   | exp '*' exp { $$ = $1 * $3; }
   | exp '/' exp { 
                     if ($3 == 0) {
                         printf("Divide by Zero error\n");
                         exit(0);
                     } else {
                         $$ = $1 / $3;
                     }
                 }
   | '(' exp ')' { $$ = $2; }
   | num { $$ = $1; }
   ;

%%

// Define yyerror with the correct signature
int yyerror(const char *s) {
    printf("error: %s\n", s);  // Print the error message
    exit(0);
}

int main() {
    printf("Enter an expression:\n");
    yyparse();  // Start the parsing process
}

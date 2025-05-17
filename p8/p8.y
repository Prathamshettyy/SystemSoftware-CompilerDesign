%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
void yyerror(const char *msg);
int yylex();
%}

%token KEY ID NUM OP

%%

program:
    program stmt
    | stmt
    ;

stmt:
    KEY ID ';'
    | KEY ';'
    | ID OP NUM ';'
    | ID '(' ID ')' ';'
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Syntax Error: %s\n", msg);
}

int main() {
    yyin = fopen("input.c", "r");
    if (!yyin) {
        perror("Failed to open input.c");
        return 1;
    }

    yyparse();
    fclose(yyin);
    return 0;
}

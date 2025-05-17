%{
#include <stdio.h>
#include "y.tab.h"   
extern YYSTYPE yylval;
%}

%%

"int"|"char"|"bool"|"float"|"void"|"main"|"for"|"do"|"while"|"if"|"else"|"return" {
    printf("%s is a keyword\n", yytext);
    return KEY;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s is a identifier\n", yytext);
    return ID;
}

[0-9]+ {
    printf("%s is a number\n", yytext);
    return DIGIT;
}

"=="|"=" {
    printf("%s is a operator\n", yytext);
    return OP;
}

[ \t\n]+   ;

.   ;

%%

int yywrap() {
    return 1;
}

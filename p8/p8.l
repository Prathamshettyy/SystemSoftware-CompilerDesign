%{
#include <stdio.h>
#include "y.tab.h"   // For token definitions like KEY
extern YYSTYPE yylval;
%}

%%

// Match keywords
"int"|"char"|"bool"|"float"|"void"|"for"|"do"|"while"|"if"|"else"|"return" {
    printf("keyword is %s\n", yytext);
    return KEY;
}

// Match identifiers (variable names, function names, etc.)
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("identifier is %s\n", yytext);
    return ID;
}

// Match numbers
[0-9]+ {
    printf("number is %s\n", yytext);
    return NUM;
}

// Match operators
"=="|"=" {
    printf("operator is %s\n", yytext);
    return OP;
}

// Ignore whitespace
[ \t\n]+ ;

// Catch everything else (punctuation like semicolons, parentheses, etc.)
.   ;
%%

int yywrap() {
    return 1;
}

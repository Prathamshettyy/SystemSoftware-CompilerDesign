%{
#include "y.tab.h"
#include <stdlib.h>
extern int yylval;
extern int yyerror(const char *s);

%}

%%
[0-9]+        { yylval = atoi(yytext); return num; } /* convert to number */
[\+\-\*\/]    { return yytext[0]; }
"("           { return yytext[0]; }
")"           { return yytext[0]; }
\n            { return 0; }
.             { ; }
%%
int yywrap() {
    return 1;
}


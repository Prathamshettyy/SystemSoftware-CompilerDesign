%{
#include "y.tab.h"
%}

%%

a { return A; }
b { return B; }
. { return yytext[0]; }
\n { return 0; }

%%

int yywrap() {
    return 1;  // Indicate the end of the input stream
}

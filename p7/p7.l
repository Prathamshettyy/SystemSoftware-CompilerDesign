%{
#include<stdio.h>
#include<stdlib.h>
int comment = 0;
int state = 1;
%}

%%

"//".*\n { comment++; }                  // Count single-line comments
"/*" { state = 0; }                       // Begin multi-line comment
"*/" { if (state == 0) comment++;        // End multi-line comment
      state = 1; }

.|\n { if (state == 1)                    // Process non-comment lines
        fprintf(yyout, "%s", yytext); }

%%

int yywrap() {
    return 1;  // Return 1 to indicate EOF is reached
}

void main() {
    char inpfile[500], outfile[500];
    
    // Get input and output file names from the user
    printf("Enter input file name:\n");
    scanf("%s", inpfile);
    printf("Enter output file name:\n");
    scanf("%s", outfile);

    // Open input file for reading
    yyin = fopen(inpfile, "r");
    if (yyin == NULL) {                     // Error handling if file doesn't open
        printf("Error opening input file.\n");
        exit(1);
    }

    // Open output file for writing
    yyout = fopen(outfile, "w");
    if (yyout == NULL) {                    // Error handling if file doesn't open
        printf("Error opening output file.\n");
        exit(1);
    }

    // Start lexing
    yylex();

    // Print the total number of comments found
    printf("Total number of comment lines is: %d\n", comment);

    // Close files after use
    fclose(yyin);
    fclose(yyout);
}

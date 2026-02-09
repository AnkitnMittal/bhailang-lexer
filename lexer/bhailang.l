%{
    #include <stdio.h>
    #include <string.h>
%}

DIGIT           [0-9]
ID              [a-zA-Z_][a-zA-Z0-9_]*
STRING          \"([^"\n]*)\"

%%
/* ========== RESERVED WORDS ========== */

"hi bhai"           { printf("HI\n"); }
"bye bhai"          { printf("BYE\n"); }

"bhai ye hai"       { printf("DECLARE\n"); }
"bol bhai"          { printf("PRINT\n"); }

"jab tak bhai"      { printf("WHILE\n"); }
"agar bhai"         { printf("IF\n"); }
"nahi to bhai"      { printf("ELSE\n"); }

"agla dekh bhai"    { printf("CONTINUE\n"); }
"bas kar bhai"      { printf("BREAK\n"); }

/* ========== OPERATORS ========== */

"=="                { printf("EQ\n"); }
"+="                { printf("PLUS_EQ\n"); }
"-="                { printf("SUB_EQ\n"); }
"="                 { printf("ASSIGN\n"); }

"<"                 { printf("LT\n"); }
"<="                { printf("LT_EQ\n"); }
">"                 { printf("GT\n"); }
">="                { printf("GT_EQ\n"); }

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
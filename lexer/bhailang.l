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
"nahi to bhai"      { printf("ELSE_IF\n"); }
"warna bhai"        { printf("ELSE\n"); }

"agla dekh bhai"    { printf("CONTINUE\n"); }
"bas kar bhai"      { printf("BREAK\n"); }

/* ========== FIXED TYPES ========== */
"nalla"             { printf("NULL\n"); }
"sahi"              { printf("TRUE\n"); }
"galat"             { printf("FALSE\n"); }


/* ========== OPERATORS ========== */

"+="                { printf("PLUS_EQ\n"); }
"-="                { printf("SUB_EQ\n"); }
"*="                { printf("MUL_EQ\n"); }
"+"                 { printf("ADD\n"); }
"-"                 { printf("SUB\n"); }
"*"                 { printf("MUL\n"); }
"/"                 { printf("DIV\n"); }

/* ========== COMPARATORS ========== */

"=="                { printf("EQ\n"); }
"!="                { printf("NOT_EQ\n"); }
"<="                { printf("LT_EQ\n"); }
">="                { printf("GT_EQ\n"); }
"<"                 { printf("LT\n"); }
">"                 { printf("GT\n"); }
"="                 { printf("ASSIGN\n"); }

/* ========== SYMBOLS ========== */

"("                 { printf("LPAREN\n"); }
")"                 { printf("RPAREN\n"); }
"{"                 { printf("LBRACE\n"); }
"}"                 { printf("RBRACE\n"); }
";"                 { printf("SEMICOLON\n"); }

/* ========== SYMBOLS ========== */

{STRING}            { printf("STRING\n"); }
{DIGIT}+            { printf("NUMBER\n"); }
{ID}                { printf("IDENTIFIER\n"); }

/* ========== IGNORE WHITESPACE ========== */
[ \t\n]+            { }

/* ========== INVALID CHARACTERS ========== */
.                   { printf("UNKNOWN: %s\n", yytext); }
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
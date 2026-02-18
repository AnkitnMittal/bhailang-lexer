%{
    #include <stdio.h>
    #include <string.h>
    #include "../parser/bhailang.tab.h"
%}

DIGIT   [0-9]+
ID      [a-zA-Z_][a-zA-Z0-9_]*
STRING  \"[^\"]*\"|'[^']*'

%%

"hi bhai"           { return HI; }
"bye bhai"          { return BYE; }

"bhai ye hai"       { return DECLARE; }
"bol bhai"          { return PRINT; }

"jab tak bhai"      { return WHILE; }
"agar bhai"         { return IF; }
"nahi to bhai"      { return ELSE_IF; }
"warna bhai"        { return ELSE; }

"agla dekh bhai"    { return CONTINUE; }
"bas kar bhai"      { return BREAK; }

"nalla"             { return NALLA; }
"sahi"              { return TRUE; }
"galat"             { return FALSE; }

"+="                { return PLUS_EQ; }
"-="                { return SUB_EQ; }
"*="                { return MUL_EQ; }
"/="                { return DIV_EQ; }

"=="                { return EQ; }
"!="                { return NE; }
"<="                { return LE; }
">="                { return GE; }

"+"                 { return ADD; }
"-"                 { return SUB; }
"*"                 { return MUL; }
"/"                 { return DIV; }

"<"                 { return LT; }
">"                 { return GT; }
"="                 { return ASSIGN; }

"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
";"                 { return SEMICOLON; }
","                 { return COMMA; }

{STRING}            { return STRING; }
{DIGIT}             { return DIGIT; }
{ID}                { return ID; }

[ \t\n]+            ;

. {
    printf("Unknown token: %s\n", yytext);
    return 0;
}

%%

int yywrap(void) {
    return 1;
}
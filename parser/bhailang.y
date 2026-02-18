%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylex(void);
    void yyerror(const char *);
%}

%token HI BYE
%token DECLARE PRINT
%token WHILE IF ELSE_IF ELSE
%token CONTINUE BREAK
%token NALLA TRUE FALSE
%token PLUS_EQ SUB_EQ MUL_EQ DIV_EQ ADD SUB MUL DIV
%token EQ NE LE GE LT GT ASSIGN
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token STRING DIGIT ID

%left EQ NE LT GT LE GE
%left ADD SUB
%left MUL DIV
%right ASSIGN
%right PLUS_EQ SUB_EQ MUL_EQ DIV_EQ

%%

program:
    HI statements BYE
    ;

statements:
      statements statement
    | statement
    ;

statement:
      varDecl SEMICOLON
    | assignment SEMICOLON
    | output SEMICOLON
    | condition
    | loop
    | CONTINUE SEMICOLON
    | BREAK SEMICOLON
    ;

varDecl:
    DECLARE ID ASSIGN expression
    ;

assignment:
      ID ASSIGN expression
    | ID PLUS_EQ expression
    | ID SUB_EQ expression
    | ID MUL_EQ expression
    | ID DIV_EQ expression
    ;

output:
    PRINT expression
    ;

condition:
    IF LPAREN expression RPAREN LBRACE statements RBRACE elsePart
;

elsePart:
    
    | ELSE LBRACE statements RBRACE
    | ELSE_IF LPAREN expression RPAREN LBRACE statements RBRACE elsePart
;

loop:
    WHILE LPAREN expression RPAREN LBRACE statements RBRACE
    ;

expression:
      expression binary_op expression
    | LPAREN expression RPAREN
    | literal
    | ID
    ;

literal:
      DIGIT
    | STRING
    | TRUE
    | FALSE
    | NALLA
    ;

binary_op:
      ADD | SUB | MUL | DIV
    | EQ  | NE  | LT  | GT
    | LE  | GE
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main(void) {
    return yyparse();
}
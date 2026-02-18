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
%token NULL TRUE FALSE
%token PLUS_EQ SUB_EQ MUL_EQ DIV_EQ ADD SUB MUL DIV
%token EQ NE LE GE LT GT ASSIGN
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token STRING DIGIT ID

%%

program:
    HI statements BYE
    ;

statements:
    statement statements
    | statement
    ;

statement:
    varDecl
    | assignment
    | output
    | condition
    | loop
    | expression
    ;

assignment:
    ID ASSIGN expression
    ;

varDecl:
    DECLARE identifier ASSIGN expression
    ;

output:
    PRINT expression
    ;

condition:
    IF LPAREN expression RPAREN LBRACE statements RBRACE
    ;

loop:
    WHILE LPAREN expression RPAREN LBRACE statements RBRACE
    ;

expression:
    literal
    | identifier
    | binaryExpr
    | TRUE
    | FALSE
    | NULL
    ;

literal:
    DIGIT
    | STRING
    ;

identifier:
    ID
    ;

binaryExpr:
    expression operator expression
    ;

operator:
    PLUS_EQ | SUB_EQ | MUL_EQ | DIV_EQ
    | ADD | SUB | MUL | DIV
    | EQ | NE | LE | GE | LT | GT
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    return yyparse();
}
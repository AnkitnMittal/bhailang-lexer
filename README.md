# Bhailang Lexer (Flex + Bison)
A simple BhaiLang compiler front-end built using Flex (Lexer) and Bison (Parser).
It tokenizes and parses BhaiLang source code as the first step toward building a compiler or interpreter.

## Features
- Recognizes Bhailang keywords (`hi bhai`, `bol bhai`, `jab tak bhai`, etc.)
- Supports identifiers, numbers, strings
- Handles arithmetic and relational operators
- Performs syntax validation using Bison
- Ignores whitespace and reports invalid tokens

## Prerequisites
- Flex
- Bison
- GCC

### Install (Ubuntu/Debian)
```bash
sudo apt install flex bison gcc
```

### Build Binaries
Generated files (`lex.yy.c`, `bhailang.tab.c`, `bhailang.tab.h`) are ignored via `.gitignore`
```bash
bison -d parser/bhailang.y -o parser/bhailang.tab.c
flex -o lexer/lex.yy.c lexer/bhailang.l
gcc parser/bhailang.tab.c lexer/lex.yy.c -lfl -o bhailang
```

### Run
```bash
./bhailang < test/sample.bhai
```
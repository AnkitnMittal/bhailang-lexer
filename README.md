# Bhailang Lexer (Flex)
A lexical analyzer for **Bhailang** implemented using **Flex**.  
This project tokenizes Bhailang source code into keywords, identifiers, literals, operators, and symbols as a first step toward building a compiler or interpreter.

---
## Features
- Recognizes Bhailang keywords (`hi bhai`, `bol bhai`, `jab tak bhai`, etc.)
- Supports identifiers, numbers, strings
- Handles arithmetic and relational operators
- Ignores whitespace and reports invalid tokens
- Easily extendable with Bison/YACC

---
## Prerequisites
- Flex
- GCC
### Install (Ubuntu/Debian)
```bash
sudo apt install flex gcc
```
### Build & Run
Generated files (`lex.yy.c`, binaries) are ignored via `.gitignore`
```bash
flex bhailang.l
gcc lex.yy.c -o bhailang
../lexer/bhailang < test.bhai
```
<h1 align="center">
    <b> Lang Compiler </b> 
</h1>

<p align="center">
  <img alt="Language" src="https://img.shields.io/badge/language-Java-brightgreen">
  <img alt="Concept" src="https://img.shields.io/badge/concept-Compilers-brightgreen">
</p>

# README

Este trabalho foi desenvolvido como parte da disciplina DCC045 - Teoria dos compiladores - UFJF, ministrada pelo professor Leonardo Vieira dos Santos Reis.

## Objetivo

O objetivo do trabalho é implementar um analisador léxico para a linguagem de programação fictícia chamada de "lang".

## Integrantes

- Nome: Charles Lelis Braga -- Matrícula: 202035015
- Nome: Gabriella Carvalho -- Matrícula: 202165047AC

## Informações

- Java version: Foi testado na 21.0.2 e na 17

## Para compilar utilizando o SHELL (LINUX)

```
./build.sh
```

## Para compilar usando o WINDOWS

Rode os comandos:

```
java -jar ./lib/jflex-full-1.8.2.jar ./src/core/Lexer/lang.flex
```

```
javac -d bin src/core/Lexer/Lexer.java src/core/Lexer/Token.java src/core/Lexer/TOKEN_TYPE.java src/core/Lexer/LexerProcessor.java  ./src/utils/SampleFileManager/SampleFileManager.java src/App.java ; java -cp bin App
```

## TODO:

- [x] Modificar o print de saída para que ele imprima o token e o lexema.
- [x] Um identificador obrigatoriamente, começa com uma letra minúscula.
- [x] Se começa com maiscula é nome de tipo
- [x] 1.1 tem que ser float e não "Number DOT Number"
- [x] Literal caractere ́é um único caractere delimitado por aspas simples.
- [x] Os caracteres especiais quebra-de-linha, tabulação, backspace e carriage return são definidos usando os caracteres de escape \n, \t, \b e \r, respectivamente.
- [x] Para especificar um caractere \, é usado \\ e para a aspas simples o \’. Exemplos de literais caractere: 'a', '\n', '\t' e '\\';
- [x] O comentário de uma linha começa com -- e se estende até a quebra de linha.
- [x] O comentário de múltiplas linhas começa com {- e se estende até os caracteres de fechamento do comentário, -}.
- [x] A linguagem não suporta comentários aninhados.

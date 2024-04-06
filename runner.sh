#!/bin/bash

# Compilação do arquivo .jflex para gerar o arquivo .java
java -jar ./jflex-full-1.8.2.jar ./lang.flex

# Compilação da classe Java
javac Lexer.java

# Utilização do Lexer para analisar o sample1.txt
java Lexer sample1.txt

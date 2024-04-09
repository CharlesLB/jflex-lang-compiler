#!/bin/bash

# Executa o JFlex para gerar o analisador léxico
java -jar ./jflex-full-1.8.2.jar ./lang.flex

# Compila o código Java
javac Tester.java

# Executa o programa Java com um arquivo de dados específico
java Tester data.lan

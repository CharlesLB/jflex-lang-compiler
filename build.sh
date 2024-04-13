#!/bin/bash
java -jar ./lib/jflex-full-1.8.2.jar ./src/core/Lexer/lang.flex

javac -d out src/**/*.java'

java -cp out App
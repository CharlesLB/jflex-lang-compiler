#!/bin/bash

compile_jflex_lexer() {
    java -jar ./lib/jflex-full-1.8.2.jar ./src/Lexer/lang.flex
}

compile_lexer_java() {
    javac ./src/Lexer/Tester.java -d ./build
}

test_lexer() {
    java -classpath ./build Lexer ./samples/sintantic/true/data.lan
}

compile_jflex_lexer
compile_lexer_java
test_lexer

exit 0

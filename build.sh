#!/bin/bash
java -jar ./lib/jflex-full-1.8.2.jar ./src/core/Lexer/lang.flex

javac -d bin src/core/Lexer/Lexer.java src/core/Lexer/Token.java src/core/Lexer/TOKEN_TYPE.java src/core/Lexer/LexerProcessor.java  ./src/utils/SampleFileManager/SampleFileManager.java  src/App.java

java -cp bin App
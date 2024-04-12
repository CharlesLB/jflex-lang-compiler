// Nome: Charles Lelis Braga -- Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

# README

## Para compilar utilizando o SHELL

java -jar .\lib\jflex-full-1.8.2.jar .\src\Lexer\lang.flex

javac -d out src\lexer\Lexer.java src\lexer\Token.java src\lexer\TOKEN_TYPE.java src\App.java ; java -cp out App

## TODO

[X] Colocar os comandos ali em cima

### Bugs

[X] Aceitar -- como comentário e -- como subtração (Não tem isso no exemplo do professor)

[X] Ele está reclamando que o \ não é um caracter válido. Assim como um emoji, §, ° ¨¬ª também não é, mas eles devem ser válidos para string.(Resolvido com excelência)

## Para compilar usando o ANT
`ant jflex`: Para gerar o analisador léxico com jflex.
`ant compile`: Para compilar os arquivos Java.
`ant run`: Para executar a aplicação.



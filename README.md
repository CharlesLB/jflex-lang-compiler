// Nome: Charles Lelis Braga -- Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

# README

## Para compilar utilizando o SHELL

java -jar ./lib/jflex-full-1.8.2.jar ./src/core/Lexer/lang.flex

javac -d out src/core/Lexer/Lexer.java src/core/Lexer/Token.java src/core/Lexer/TOKEN_TYPE.java src/App.java ; java -cp out App

## TODO:

[] Mudar os nomes
[] Um identificador obrigatoriamente, começa com uma letra minúscula.
[] Se começa com maiscula é nome de tipo
[] 1.1 tem que ser float e não "Number DOT Number"
[] literal caractere  ́é um  único caractere delimitado por aspas simples.
[] Os caracteres especiais quebra-de-linha, tabulação, backspace e carriage return são definidos usando os caracteres de escape \n, \t, \b e \r, respectivamente. Para especificar um caractere \, é usado \\ e para a aspas simples o \’. Exemplos de literais caractere: ’a’, ’\n’, ’\t’ e ’\\”;
[] O comentário de uma linha começa com --
e se estende até a quebra de linha.
[] O comentário de múltiplas linhas começa com {- e se estende até os caracteres de fechamento do comentário, -}.
[] A linguagem não suporta comentários aninhados.

### Bugs

[X] Aceitar -- como comentário e -- como subtração (Não tem isso no exemplo do professor)

[X] Ele está reclamando que o \ não é um caracter válido. Assim como um emoji, §, ° ¨¬ª também não é, mas eles devem ser válidos para string.(Resolvido com excelência)

## Para compilar usando o ANT

`ant jflex`: Para gerar o analisador léxico com jflex.
`ant compile`: Para compilar os arquivos Java.
`ant run`: Para executar a aplicação.

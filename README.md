// Nome: Charles Lelis Braga -- Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

# README

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
javac -d bin src/core/Lexer/Lexer.java src/core/Lexer/Token.java src/core/Lexer/TOKEN_TYPE.java src/core/Lexer/LexerProcessor.java  ./src/utils/SampleFileManager/SampleFileManager.java  src/App.java ; java -cp bin App
```

## TODO:

[] Mudar os nomes
[X] Um identificador obrigatoriamente, começa com uma letra minúscula.
[X] Se começa com maiscula é nome de tipo
[X] 1.1 tem que ser float e não "Number DOT Number"
[X] literal caractere ́é um único caractere delimitado por aspas simples.
[X] Os caracteres especiais quebra-de-linha, tabulação, backspace e carriage return são definidos usando os caracteres de escape \n, \t, \b e \r, respectivamente. 
[X] Para especificar um caractere \, é usado \\ e para a aspas simples o \’. Exemplos de literais caractere: 'a', '\n', '\t' e '\\';
[X] O comentário de uma linha começa com -- e se estende até a quebra de linha.
[X] O comentário de múltiplas linhas começa com {- e se estende até os caracteres de fechamento do comentário, -}.
[X] A linguagem não suporta comentários aninhados.

### Bugs

[] Ele está reclamando que o \ não é um caracter válido. Assim como um emoji, §, ° ¨¬ª também não é, mas eles devem ser válidos para string.(Resolvido com excelência)

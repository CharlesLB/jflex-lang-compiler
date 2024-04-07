## Para compilar

Para gerar o arquivo .java a partir do arquivo .jflex, execute o comando abaixo:

```
java -jar .\jflex-full-1.8.2.jar .\lang.flex
```

Para criar a classe java a partir do arquivo .java, execute o comando abaixo:

```
javac <classe>.java

// example:
javac Tester.java
```

Para usar o Lexer para analisar o sample1.txt, execute o comando abaixo:

```
java <classe> <filename>.txt


// example:
java Tester data.lan
```

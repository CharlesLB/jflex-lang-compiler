package core.LexerAnalyzer;

import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;

import core.LexerAnalyzer.Lexer.Token;
import jflex.Main;

public class LexerAnalyzer {
    public LexerAnalyzer(String pathFile) {
        try {
            this.build();
            this.tokenize(pathFile);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void build() {
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/core/LexerAnalyzer/";

        String outputDir = rootPath + subPath;

        String[] lexerAnalyzerCommand = { "-d", outputDir, rootPath + subPath + "jflex/lang.flex" };
        Main.main(lexerAnalyzerCommand);
    }

    private void tokenize(String pathFile) throws IOException {
        Lexer lx = new Lexer(new FileReader(pathFile));
        Token t = lx.nextToken();
        while (t != null) {
            System.out.println(t.toString());
            t = lx.nextToken();
        }
        System.out.println("Total de tokens lidos " + lx.readedTokens());
    }
}

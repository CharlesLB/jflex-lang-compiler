package core.LexerAnalyzer;

import java.nio.file.Paths;

import jflex.Main;

public class LexerAnalyzer {
    public LexerAnalyzer() {

        this.createLexerAnalyzer();
    }

    private void createLexerAnalyzer() {
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/core/LexerAnalyzer/";

        String outputDir = rootPath + "/src/main/java/target/";

        String[] lexerAnalyzerCommand = { "-d", outputDir, rootPath + subPath + "jflex/lang.flex" };
        Main.main(lexerAnalyzerCommand);

    }
}

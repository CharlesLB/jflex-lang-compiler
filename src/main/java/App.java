import java.io.IOException;

import core.LexerAnalyzer.LexerAnalyzer;
import utils.Reader.Reader;

public class App {
    public static void main(String[] args) {
        try {
            LexerAnalyzer lexer = new LexerAnalyzer();
            String data = getFileData();

            System.out.println(data);
            // lexer.tokenize(data);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getFileData() throws IOException {
        try {
            String expr = Reader.readFile("src/main/resources/samples/sample1.txt");
            return expr;
        } catch (IOException e) {
            throw e;
        }
    }

}

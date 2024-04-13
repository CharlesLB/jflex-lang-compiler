// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package core.Lexer;

import java.io.File;
import java.io.FileReader;

public class Lexer {
  public static void process(File selectedFile) throws Exception {
    LexerProcessor lx = new LexerProcessor(new FileReader(selectedFile));
    Token t = lx.nextToken();

    while (t != null) {
      System.out.println(t.toString());
      t = lx.nextToken();
    }
  }

}
// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

import java.io.FileReader;
import java.io.File;

import core.Lexer.Lexer;
import core.Lexer.Token;
import utils.SampleFileManager.SampleFileManager;

public class App {

  public static void main(String[] args) throws Exception {
    File selectedFile = SampleFileManager.getSampleFile();

    Lexer lx = new Lexer(new FileReader(selectedFile));
    Token t = lx.nextToken();

    while (t != null) {
      System.out.println(t.toString());
      t = lx.nextToken();
    }

  }

}

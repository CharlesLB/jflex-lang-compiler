// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

import java.io.File;

import core.Lexer.Lexer;
import utils.SampleFileManager.SampleFileManager;

public class App {

  public static void main(String[] args) throws Exception {
    File selectedFile = SampleFileManager.getSampleFile();
    Lexer.process(selectedFile);

  }

}

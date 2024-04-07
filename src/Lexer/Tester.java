
// TODO: Colocar a lista de samples aqui
// TODO: O output deve ser feito na pasta ./output/lexers com a estrutura do arquivo de entrada

import java.io.FileReader;

public class Tester {
  public static void main(String[] args) throws Exception {
    Lexer lx = new Lexer(new FileReader(args[0]));
    Token t = lx.nextToken();
    while (t != null) {
      System.out.println(t.toString());
      t = lx.nextToken();
    }
  }
}

package src;

import src.Lexer.Lexer;
import src.Lexer.Token;

// TODO: Colocar a lista de samples aqui
// TODO: O output deve ser feito na pasta ./output/lexers com a estrutura do arquivo de entrada

public class App {
  public static void main(String[] args) throws Exception {
    Lexer lx = new Lexer(new FileReader(args[0]));
    Token t = lx.nextToken();
    while (t != null) {
      System.out.println(t.toString());
      t = lx.nextToken();
    }
  }
}

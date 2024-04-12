// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package src.lexer;

import src.lexer.TOKEN_TYPE;

public class Token {
  public TOKEN_TYPE t;
  public Object info;

  public Token(TOKEN_TYPE t, Object o) {
    this.t = t;
    info = o;
  }

  public Token(TOKEN_TYPE t) {
    this.t = t;
    info = null;
  }

  @Override
  public String toString() {
    if (info != null) {
      return t + ": " + info;
    }

    return t.toString();
  }

}

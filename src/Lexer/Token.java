public class Token {
  public TOKEN_TYPE t;
  public String value;

  public Token(TOKEN_TYPE t, String o) {
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

// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package core.Lexer;

import java.util.ArrayList;
import java.util.Arrays;

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
    ArrayList<TOKEN_TYPE> reservedWordsTypes = new ArrayList<TOKEN_TYPE>(
        Arrays.asList(
            TOKEN_TYPE.IF,
            TOKEN_TYPE.ELSE,
            TOKEN_TYPE.WHILE,
            TOKEN_TYPE.FOR,
            TOKEN_TYPE.RETURN,
            TOKEN_TYPE.BREAK,
            TOKEN_TYPE.CONTINUE,
            TOKEN_TYPE.NEW,
            TOKEN_TYPE.VOID,
            TOKEN_TYPE.STRUCT,
            TOKEN_TYPE.TYPEDEF,
            TOKEN_TYPE.SWITCH,
            TOKEN_TYPE.CASE,
            TOKEN_TYPE.DEFAULT,
            TOKEN_TYPE.NULL,
            TOKEN_TYPE.PRINT,
            TOKEN_TYPE.SCAN));

    ArrayList<TOKEN_TYPE> valuablesTypes = new ArrayList<TOKEN_TYPE>(
        Arrays.asList(
            TOKEN_TYPE.BTYPE,
            TOKEN_TYPE.CHAR,
            TOKEN_TYPE.ID,
            TOKEN_TYPE.TYPE,
            TOKEN_TYPE.INT,
            TOKEN_TYPE.FLOAT,
            TOKEN_TYPE.BOOL));

    ArrayList<TOKEN_TYPE> operatorsTypes = new ArrayList<TOKEN_TYPE>(
        Arrays.asList(
            TOKEN_TYPE.ASSIGNMENT,
            TOKEN_TYPE.EQ,
            TOKEN_TYPE.NOT_EQ,
            TOKEN_TYPE.SEMI,
            TOKEN_TYPE.TIMES,
            TOKEN_TYPE.PLUS,
            TOKEN_TYPE.MOD,
            TOKEN_TYPE.COMMA,
            TOKEN_TYPE.DOUBLE_COLON,
            TOKEN_TYPE.COLON,
            TOKEN_TYPE.SINGLE_QUOTE,
            TOKEN_TYPE.DOUBLE_QUOTE,
            TOKEN_TYPE.LEFT_PAREN,
            TOKEN_TYPE.RIGHT_PAREN,
            TOKEN_TYPE.LEFT_BRACKET,
            TOKEN_TYPE.RIGHT_BRACKET,
            TOKEN_TYPE.LEFT_BRACE,
            TOKEN_TYPE.RIGHT_BRACE,
            TOKEN_TYPE.DOT,
            TOKEN_TYPE.MINUS,
            TOKEN_TYPE.DIVIDE,
            TOKEN_TYPE.NOT_EQUAL,
            TOKEN_TYPE.LESS_THAN,
            TOKEN_TYPE.LESS_THAN_OR_EQUAL,
            TOKEN_TYPE.GREATER_THAN,
            TOKEN_TYPE.GREATER_THAN_OR_EQUAL,
            TOKEN_TYPE.DOUBLE_AMPERSAND,
            TOKEN_TYPE.AMPERSAND,
            TOKEN_TYPE.EXCLAMATION_MARK,
            TOKEN_TYPE.DOUBLE_PIPE,
            TOKEN_TYPE.PIPE));

    if (reservedWordsTypes.contains(t)) {
      return t.toString();
    }

    if (valuablesTypes.contains(t)) {
      return t.toString() + " : " + info;
    }

    if (operatorsTypes.contains(t)) {
      return info.toString();
    }

    return "Token not found";
  }
}

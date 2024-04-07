

%%

%unicode
%line
%column
%class Lexer
%function nextToken
%type Token

%{
  private int ntk;

  public int readedTokens(){
    return ntk;
  }

  private Token symbol(TOKEN_TYPE t) {
    ntk++;
    return new Token(t,yytext());
  }

  private Token symbol(TOKEN_TYPE t, Object value) {
    ntk++;
    return new Token(t, value);
  }
%}

%init{
  ntk = 0;
%init}

ALPHA=[A-Za-z]
NUMBER= [:digit:] [:digit:]*  
DIGIT=[0-9]
NEWLINE=\r|\n|\r\n
WHITE_SPACE_CHAR=[\n\r\ \t\b\012]
STRING_TEXT=(\\\"|[^\n\r\"\\]|\\{WHITE_SPACE_CHAR}+\\)*
IDENT = {ALPHA}({ALPHA}|{DIGIT}|_)*

%state COMMENT
%state LINE_COMMENT

%%

<YYINITIAL>{
  /* RESERVED_WORDS */
    "if" { return symbol(TOKEN_TYPE.IF); }
    "else" { return symbol(TOKEN_TYPE.ELSE); }
    "while" { return symbol(TOKEN_TYPE.WHILE); }
    "for" { return symbol(TOKEN_TYPE.FOR); }
    "return" { return symbol(TOKEN_TYPE.RETURN); }
    "break" { return symbol(TOKEN_TYPE.BREAK); }
    "continue" { return symbol(TOKEN_TYPE.CONTINUE); }
    "int" { return symbol(TOKEN_TYPE.INT); }
    "new" { return symbol(TOKEN_TYPE.NEW); }
    "void" { return symbol(TOKEN_TYPE.VOID); }
    "string" { return symbol(TOKEN_TYPE.STRING); }
    "struct" { return symbol(TOKEN_TYPE.STRUCT); }
    "typedef" { return symbol(TOKEN_TYPE.TYPEDEF); }
    "switch" { return symbol(TOKEN_TYPE.SWITCH); }
    "case" { return symbol(TOKEN_TYPE.CASE); }
    "default" { return symbol(TOKEN_TYPE.DEFAULT); }
    "print" { return symbol(TOKEN_TYPE.PRINT); }
    "scan" { return symbol(TOKEN_TYPE.SCAN); }    

    {IDENT} { return symbol(TOKEN_TYPE.ID, yytext()); }
    {NUMBER} { return symbol(TOKEN_TYPE.NUMBER, yytext()); }
    "--" { yybegin(LINE_COMMENT); }
    "/*" { yybegin(COMMENT); }
    "=" { return symbol(TOKEN_TYPE.EQ); }
    ";" { return symbol(TOKEN_TYPE.SEMI); }
    "*" { return symbol(TOKEN_TYPE.TIMES); }
    "+" { return symbol(TOKEN_TYPE.PLUS); }
    "," { return symbol(TOKEN_TYPE.COMMA); }
    "::" { return symbol(TOKEN_TYPE.DOUBLE_COLON); }
    ":" { return symbol(TOKEN_TYPE.COLON); }
    "'" { return symbol(TOKEN_TYPE.SINGLE_QUOTE); }
    "\"" { return symbol(TOKEN_TYPE.DOUBLE_QUOTE); }
    "(" { return symbol(TOKEN_TYPE.LEFT_PAREN); }
    ")" { return symbol(TOKEN_TYPE.RIGHT_PAREN); }
    "[" { return symbol(TOKEN_TYPE.LEFT_BRACKET); }
    "]" { return symbol(TOKEN_TYPE.RIGHT_BRACKET); }
    "{" { return symbol(TOKEN_TYPE.LEFT_BRACE); }
    "}" { return symbol(TOKEN_TYPE.RIGHT_BRACE); }
    "." { return symbol(TOKEN_TYPE.DOT); }
    "-" { return symbol(TOKEN_TYPE.MINUS); }
    "/" { return symbol(TOKEN_TYPE.DIVIDE); }
    "<>" { return symbol(TOKEN_TYPE.NOT_EQUAL); }
    "<=" { return symbol(TOKEN_TYPE.LESS_THAN_OR_EQUAL); }
    "<" { return symbol(TOKEN_TYPE.LESS_THAN); }
    ">=" { return symbol(TOKEN_TYPE.GREATER_THAN_OR_EQUAL); }
    ">" { return symbol(TOKEN_TYPE.GREATER_THAN); }
    "&&" { return symbol(TOKEN_TYPE.DOUBLE_AMPERSAND); }
    "&" { return symbol(TOKEN_TYPE.AMPERSAND); }
    "||" { return symbol(TOKEN_TYPE.DOUBLE_PIPE); }
    "|" { return symbol(TOKEN_TYPE.PIPE); }
    ":=" { return symbol(TOKEN_TYPE.ASSIGN); }



    {WHITE_SPACE_CHAR} { }
}

<COMMENT>{
   "*/"     { yybegin(YYINITIAL); } 
   [^"*/"]  {                     }
}

<LINE_COMMENT>{
    {NEWLINE} { yybegin(YYINITIAL); }
    [^\n\r] { }
}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }
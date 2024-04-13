// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package core.Lexer;

import core.Lexer.TOKEN_TYPE;
import core.Lexer.Token;

%%

%unicode
%line
%column
%public
%class LexerProcessor
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

ALPHA = [A-Za-z]
ALPHA_UPPERCASE=[A-Z]
ALPHA_LOWERCASE=[a-z]

INT_VALUE= [:digit:] [:digit:]*  
FLOAT_VALUE= [-+]?([:digit:]+ \. [:digit:]*)
IDENT_UPPERCASE = {ALPHA_UPPERCASE}({ALPHA}|:digit:|_)*
IDENT_LOWERCASE = {ALPHA_LOWERCASE}({ALPHA}|:digit:|_)*

NEW_LINE=\r|\n|\r\n
WHITE_SPACE_CHAR=[\n\r\ \t\b]

NEWLINE = \n
TAB = \t
BACKSPACE = \b
CARRIAGE = \r
// DOUBLE_BACKSLASH = \

%state COMMENT
%state LINE_COMMENT
%state CHAR_SINGLE_QUOTE
%state END_CHAR_SINGLE_QUOTE
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
    "new" { return symbol(TOKEN_TYPE.NEW); }
    "void" { return symbol(TOKEN_TYPE.VOID); }
    "struct" { return symbol(TOKEN_TYPE.STRUCT); }
    "typedef" { return symbol(TOKEN_TYPE.TYPEDEF); }
    "switch" { return symbol(TOKEN_TYPE.SWITCH); }
    "case" { return symbol(TOKEN_TYPE.CASE); }
    "default" { return symbol(TOKEN_TYPE.DEFAULT); }
    "null" { return symbol(TOKEN_TYPE.NULL); }
    "true" { return symbol(TOKEN_TYPE.TRUE); }
    "false" { return symbol(TOKEN_TYPE.FALSE); }
    "print" { return symbol(TOKEN_TYPE.PRINT); }
    "scan" { return symbol(TOKEN_TYPE.SCAN); }    

    "Int" { return symbol(TOKEN_TYPE.BTYPE); }
    "Float" { return symbol(TOKEN_TYPE.BTYPE); }
    "Char" { return symbol(TOKEN_TYPE.BTYPE); }
    "Bool" { return symbol(TOKEN_TYPE.BTYPE); }

    {IDENT_LOWERCASE} { return symbol(TOKEN_TYPE.ID, yytext()); }
    {IDENT_UPPERCASE} { return symbol(TOKEN_TYPE.TYPE, yytext()); }
    {INT_VALUE} { return symbol(TOKEN_TYPE.INT_VALUE, yytext()); }
    {FLOAT_VALUE} { return symbol(TOKEN_TYPE.FLOAT_VALUE, yytext()); }

    "--" { yybegin(LINE_COMMENT); }
    "{-" { yybegin(COMMENT); }
    
    "=" { return symbol(TOKEN_TYPE.ASSIGNMENT); }
    "==" { return symbol(TOKEN_TYPE.EQ); }
    "!=" { return symbol(TOKEN_TYPE.NOT_EQ); }
    ";" { return symbol(TOKEN_TYPE.SEMI); }
    "*" { return symbol(TOKEN_TYPE.TIMES); }
    "+" { return symbol(TOKEN_TYPE.PLUS); }
    "%" { return symbol(TOKEN_TYPE.MOD); }
    "," { return symbol(TOKEN_TYPE.COMMA); }
    "::" { return symbol(TOKEN_TYPE.DOUBLE_COLON); }
    ":" { return symbol(TOKEN_TYPE.COLON); }
    "'" { yybegin(CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.SINGLE_QUOTE); }
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
    "!" { return symbol(TOKEN_TYPE.EXCLAMATION_MARK); }
    "||" { return symbol(TOKEN_TYPE.DOUBLE_PIPE); }
    "|" { return symbol(TOKEN_TYPE.PIPE); }

    {WHITE_SPACE_CHAR} { }
}

<CHAR_SINGLE_QUOTE> {
    {ALPHA} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    
}

<END_CHAR_SINGLE_QUOTE> {
  "\'" { yybegin(YYINITIAL); return symbol(TOKEN_TYPE.SINGLE_QUOTE); }
}

<COMMENT>{
   "-}"     { yybegin(YYINITIAL); } 
   [^"-}"]  {                     }
}

<LINE_COMMENT>{
    {NEW_LINE} { yybegin(YYINITIAL); }
    [^\n\r] { }
}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }
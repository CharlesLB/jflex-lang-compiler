// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package core.Lexer;

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

INT= [:digit:] [:digit:]*  
FLOAT= [-+]?([:digit:]+ \. [:digit:]*)
IDENT_UPPERCASE = {ALPHA_UPPERCASE}({ALPHA}|:digit:|_)*
IDENT_LOWERCASE = {ALPHA_LOWERCASE}({ALPHA}|:digit:|_)*

NEW_LINE=\r|\n|\r\n
WHITE_SPACE_CHAR=[\n\r\ \t\b]

CHAR_NEWLINE = \\n
CHAR_TAB = \\t
CHAR_BACKSPACE = \\b
CHAR_CARRIAGE = \\r
CHAR_BACKSLASH = \\\\
CHAR_QUOTE = \\\'

%state COMMENT
%state LINE_COMMENT
%state CHAR_SINGLE_QUOTE
%state END_CHAR_SINGLE_QUOTE
%%

<YYINITIAL>{
  /* RESERVED_WORDS */
    "if" { return symbol(TOKEN_TYPE.IF); }
    "else" { return symbol(TOKEN_TYPE.ELSE); }
    "return" { return symbol(TOKEN_TYPE.RETURN); }
    "new" { return symbol(TOKEN_TYPE.NEW); }
    "data" { return symbol(TOKEN_TYPE.DATA); }
    "null" { return symbol(TOKEN_TYPE.NULL); }
    "true" { return symbol(TOKEN_TYPE.BOOL); }
    "false" { return symbol(TOKEN_TYPE.BOOL); }
    "print" { return symbol(TOKEN_TYPE.PRINT); }
    "read" { return symbol(TOKEN_TYPE.READ); }    

    "Int" { return symbol(TOKEN_TYPE.BTYPE); }
    "Float" { return symbol(TOKEN_TYPE.BTYPE); }
    "Char" { return symbol(TOKEN_TYPE.BTYPE); }
    "Bool" { return symbol(TOKEN_TYPE.BTYPE); }

    {IDENT_LOWERCASE} { return symbol(TOKEN_TYPE.ID, yytext()); }
    {IDENT_UPPERCASE} { return symbol(TOKEN_TYPE.TYPE, yytext()); }
    {INT} { return symbol(TOKEN_TYPE.INT, yytext()); }
    {FLOAT} { return symbol(TOKEN_TYPE.FLOAT, yytext()); }

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
    "<" { return symbol(TOKEN_TYPE.LESS_THAN); }
    ">" { return symbol(TOKEN_TYPE.GREATER_THAN); }
    "&&" { return symbol(TOKEN_TYPE.DOUBLE_AMPERSAND); }
    "!" { return symbol(TOKEN_TYPE.EXCLAMATION_MARK); }

    {WHITE_SPACE_CHAR} { }
}

<CHAR_SINGLE_QUOTE> {
    {CHAR_NEWLINE} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    {CHAR_TAB} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    {CHAR_BACKSPACE} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    {CHAR_CARRIAGE} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    {CHAR_BACKSLASH} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
    {CHAR_QUOTE} { yybegin(END_CHAR_SINGLE_QUOTE); return symbol(TOKEN_TYPE.CHAR); }
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
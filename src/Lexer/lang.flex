
  /*  Esta seção é copiada antes da declaração da classe do analisador léxico gerado.
  *  É nesta seção que se deve incluir imports e declaração de pacotes.
  *  Neste exemplo não temos nada a incluir nesta seção.
  */

%%

  /* Nesta seção são definidas ERs e configurações da ferramenta */

%unicode
%line
%column
%class Lexer

%standalone


%{
    public class Token {
      private int type;
      private String value;

      private valuableTokens = [
        "VAR",
        "NUM",
        "EQ",
        "SEMI",
        "TIMES",
        "PLUS"
      ]

      public Token(int type, String value) {
        this.type = type;
        this.value = value;
      }

      public print() {


        System.out.println(type + " Value: " + value);
      }
    }
%}

%init{
  ntks = 0; // copiado para o construtor
%init}

ALPHA=[A-Za-z]
NUMBER= [:digit:] [:digit:]*  
DIGIT=[0-9]
NONNEWLINE_WHITE_SPACE_CHAR=[\ \t\b\012]
NEWLINE=\r|\n|\r\n
WHITE_SPACE_CHAR=[\n\r\ \t\b\012]
STRING_TEXT=(\\\"|[^\n\r\"\\]|\\{WHITE_SPACE_CHAR}+\\)*
COMMENT_TEXT=([^*/\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n])+
IDENT = {ALPHA}({ALPHA}|{DIGIT}|_)*

%state COMMENT

%%

<YYINITIAL>{
    {IDENT} { System.out.println("Token VAR: " + yytext());  incTks(); }
    {NUMBER}        { System.out.println("Token NUM: " + yytext());  incTks(); }
    "="             { System.out.println("Token EQ");  incTks();               }
    ";"             { System.out.println("Token SEMI");  incTks();             }
    "*"             { System.out.println("Token TIMES");  incTks();            }
    "+"             { System.out.println("Token PLUS");  incTks();             }
    "/*"            { yybegin(COMMENT);                                        }
    "," { yytext(); }
    ":" { yytext(); }
    ";" { yytext(); }
    "(" { yytext(); }
    ")" { yytext(); }
    "[" { yytext(); }
    "]" { yytext(); }
    "{" { yytext(); }
    "}" { yytext(); }
    "." { yytext(); }
    "+" { yytext(); }
    "-" { yytext(); }
    "*" { yytext(); }
    "/" { yytext(); }
    "=" { yytext(); }
    "<>" { yytext(); }
    "<"  { yytext(); }
    "<=" { yytext(); }
    ">"  { yytext(); }
    ">=" { yytext(); }
    "&"  { yytext(); }
    "|"  { yytext(); }
    ":=" { yytext(); }
    "/*" { yybegin(COMMENT); comment_count++; }}
    {WHITE_SPACE_CHAR}       { }


<COMMENT>{
   "*/"     { yybegin(YYINITIAL); } 
   [^"*/"]  {                     }
}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }
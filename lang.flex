
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

// %function nextToken : nome da funções
// %type Token : tipo do Token retornado
%standalone // somente léxico, sem sintático


%{
  private int ntks;
 
  private void incTks() { ++ntks; }
  private int numTokens() { return ntks; }
  
%}

%init{
  ntks = 0; // copiado para o construtor
%init}

/* Agora vamos definir algumas macros */
FimDeLinha  = \r | \n | \r\n
Brancos     = {FimDeLinha} | [ \t\f]
numero      = [:digit:] [:digit:]*
identificador = [:lowercase:]
LineComment = "//" (.)* {FimDeLinha}

%state COMMENT

%%

<YYINITIAL>{
    {identificador} { System.out.println("Token VAR: " + yytext());  incTks(); }
    {numero}        { System.out.println("Token NUM: " + yytext());  incTks(); }
    "="             { System.out.println("Token EQ");  incTks();               }
    ";"             { System.out.println("Token SEMI");  incTks();             }
    "*"             { System.out.println("Token TIMES");  incTks();            }
    "+"             { System.out.println("Token PLUS");  incTks();             }
    "/*"            { yybegin(COMMENT);                                        }
    {Brancos}       { /* Não faz nada - Skip */                                }
    {LineComment}   {                                                          }
}

<COMMENT>{
   "*/"     { yybegin(YYINITIAL); } 
   [^"*/"]  {                     }
}

// erros
[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }
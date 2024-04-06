package core.LexerAnalyzer;

%%

%unicode
%line
%column
%class Lexer
%function nextToken
%type Token

%{
    
    public class Token {
        public int l, c;
        public TOKEN_TYPE t;
        public String lexeme;
        public Object info;

        public Token(TOKEN_TYPE t, String lex, Object o, int l, int c) {
            this.t = t;
            lexeme = lex;
            info = o;
            this.l = l;
            this.c = c;
        }

        public Token(TOKEN_TYPE t, String lex, int l, int c) {
            this.t = t;
            lexeme = lex;
            info = null;
            this.l = l;
            this.c = c;
        }

        public Token(TOKEN_TYPE t, Object o, int l, int c) {
            this.t = t;
            lexeme = "";
            info = o;
            this.l = l;
            this.c = c;
        }

        @Override
        public String toString() {
            return "[(" + l + "," + c + ") \"" + lexeme + "\" : <" + (info == null ? "" : info.toString()) + ">]";
        }
    }


    public enum TOKEN_TYPE {
        ID,
        NUM,
        EQ,
        PLUS,
        TIMES,
        SEMI,
        AP, // (
        FP, // )
        PRINT,
        WHILE,
    }

    private int ntk;
    
    public int readedTokens(){
       return ntk;
    }
    private Token symbol(TOKEN_TYPE t) {
        ntk++;
        return new Token(t,yytext(), yyline+1, yycolumn+1);
        
    }
    private Token symbol(TOKEN_TYPE t, Object value) {
        ntk++;
        return new Token(t, value, yyline+1, yycolumn+1);
    }
%}

%init{
    ntk = 0; // Isto é copiado direto no construtor do lexer. 
%init}

  
  /* Agora vamos definir algumas macros */
  FimDeLinha  = \r|\n|\r\n
  Brancos     = {FimDeLinha} | [ \t\f]
  numero      = [:digit:] [:digit:]*
  identificador = [:lowercase:]
  LineComment = "//" (.)* {FimDeLinha}
  
%state COMMENT

%%

<YYINITIAL>{
    {identificador} { return symbol(TOKEN_TYPE.ID);   }
    {numero}        { return symbol(TOKEN_TYPE.NUM, Integer.parseInt(yytext()) );  }
    "="             { return symbol(TOKEN_TYPE.EQ);   }
    ";"             { return symbol(TOKEN_TYPE.SEMI); }
    "*"             { return symbol(TOKEN_TYPE.TIMES); }
    "+"             { return symbol(TOKEN_TYPE.PLUS); }
    "/*"            { yybegin(COMMENT);               }
    {Brancos}       { /* Não faz nada  */             }
    {LineComment}   {                       }
}

<COMMENT>{
   "*/"     { yybegin(YYINITIAL); } 
   [^"*/"]* {                     }
}



[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }






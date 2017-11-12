package as_exemplo1;

%%

%line
%column
%type Token
%cup


%{
  public final int yylenght() {
    return yytext().length();
  }

  public final int yyline() {
    return yyline;
  }

  public final int yycolumn() {
    return yycolumn;
  }

  public final int yychar() {
    return yychar;
  }

  public boolean isZzAtEOF() {
    return zzAtEOF;
  }

%}


NONNEWLINE_WHITE_SPACE_CHAR=[\ \t\b]
NEWLINE=\r|\n|\r\n
NUMBER = {DIGIT}*
DIGIT = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

%%

<YYINITIAL> {
        ";" {
            System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.SEMI, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
        "+" {
            System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.PLUS, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
        "*" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.TIMES, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
        "(" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.LPAREN, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
        ")" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.RPAREN, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
        {NUMBER} { 
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
		Token t = new Token(sym.NUMBER, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
		return t;
        }
}

<<EOF>> {
	System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	return (new Token(sym.EOF,yytext(),yyline(),yycolumn(),yychar(),yychar+1)); }

{NONNEWLINE_WHITE_SPACE_CHAR}+ { }

{NEWLINE} { }

. {
	System.out.println("Illegal character: <" + yytext().toString() + ">");
}
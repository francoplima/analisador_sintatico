package exemplo1;
%%

%line
%column
%standalone
%class Teste

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
NEWLINE			 = \r|\n|\r\n
DIGIT            = [0-9]
NUMBER           = {DIGIT}+
LETTER           = [A-Z]|[a-z]
IDENTIFIER       = {LETTER}({LETTER}|{DIGIT})*
LITERAL          = [^"]({DIGIT}|{LETTER})+[^"]
RELOP            = "=" | ">" | ">=" | "<" | "<=" | "<>"
ADDOP            = "+" | "-"
MULOP            = "*" | "/"

%%

<YYINITIAL> {
	"if" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"else" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"then" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"while" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"do" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"read" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
	"write" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	}
    "program" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "declare" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "begin" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "end" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    ";" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "," {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "(" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    ")" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    ":=" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    "integer" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {IDENTIFIER} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {ADDOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {MULOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {NUMBER} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {RELOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
    {LITERAL} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
    }
}

<<EOF>> {
	System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
}

{NONNEWLINE_WHITE_SPACE_CHAR}+ { }

{NEWLINE} { }

. {
    throw new Exception("Illegal character: <" + yytext().toString() + ">");
}

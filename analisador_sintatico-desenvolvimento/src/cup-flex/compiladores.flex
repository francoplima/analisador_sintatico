package principal;

%%

%line
%column
%type Token
%cup


%{
  TabelaSimbolo TS = new TabelaSimbolo();

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
    "program" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.PRG, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    "declare" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.DCL, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    "begin" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
		String id = yytext().toString();
        return new Token(sym.BGN, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    "end" {
		System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.END, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    ";" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.P_VIRG, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    "," {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.VIRG, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
    "integer" {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        return new Token(sym.INTEGER, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
    }
	{IDENTIFIER} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.IDENTIFIER, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
			return t;
		} else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
	{ADDOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.ADDOP, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
            return t;
        } else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
	{MULOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.MULOP, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
            return t;
        } else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
	{NUMBER} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.NUMBER, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
            return t;
        } else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
	{RELOP} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.RELOP, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
            return t;
        } else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
	{LITERAL} {
        System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
        String id = yytext().toString();
        Token t;
        if (!TS.getTabelaSimbolos().containsKey(id)) {  			
			t = new Token(sym.LITERAL, id, yyline(), yycolumn(), yychar(), yychar+yylenght());
			TS.getTabelaSimbolos().put(id, t);
            return t;
        } else {
            t = TS.getTabelaSimbolos().get(id);
            return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
        }
    }
}

<<EOF>> {
	System.out.println("line: "+(yyline+1)+" "+"col: "+(yycolumn+1)+" "+"match: --"+yytext()+"--");
	return (new Token(sym.EOF,yytext(),yyline(),yycolumn(),yychar(),yychar+1));
}

{NONNEWLINE_WHITE_SPACE_CHAR}+ { }

{NEWLINE} { }

. {
	System.out.println("Illegal character: <" + yytext().toString() + ">");
}

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
NEWLINE=\r|\n|\r\n

CHARACTERE       = {ASCII}
DIGIT            = [0-9]
NUMBER           = {DIGIT}+
LETTER           = [A-Z]|[a-z]
IDENTIFIER       = {LETTER}({LETTER}|{DIGIT})*
LITERAL          = {CHARACTERE}+
CONSTANT         = {DIGIT} | {DIGIT}*
RELOP            = [= | > | >= | < | <= | <>]
ADDOP            = [+ | ]
MULOP            = [* | /]
FACTOR           = {VARIABLE} | {CONSTANT} | ({EXPRESSION})
TERM2 		 = {TERM}
TERM             = {FACTOR} | {TERM2} {MULOP} {FACTOR}
SIMPLEEXPR       = {TERM} | {SIMPLEEXPR} {ADDOP} {TERM}
EXPRESSION       = {SIMPLEEXPR} | {SIMPLEEXPR} {RELOP} {SIMPLEEXPR}
WRITABLE         = {SIMPLEEXPR} | {LITERAL}

READSTMT         = READ ({IDENTIFIER})
WRITESTMT        = WRITE ({WRITABLE})
CONDITION        = {EXPRESSION}
WHILESTMT        = do {STMTLIST} {STMTSUFFIX}
STMTSUFFIX       = while {CONDITION} 
STMT             = {ASSIGNSTMT} | {IFSTMT} | {WHILESTMT} | {READSTMT} | {WRITESTMT}
ASSIGNSTMT       = {VARIABLE} := {SIMPLE_EXPR}
IFSTMT           = if {CONDITION} then {STMTLIST} end | if {CONDITION} then {STMTLIST} else {STMTLIST} end
STMTLIST         = ({STMT} | {STMT};)*
TYPE             = integer
IDENTLIST        = ({IDENTIFIER} | {IDENTIFIER},)*
DECL             = {TYPE} {IDENTLIST}
DECLLIST         = {DECL}|{DECL};
BODY        	 = {DECLARE} {DECLLIST} begin {STMTLIST} end | begin {STMTLIST} end
PROGRAM          = {PROGRAM} {IDENTIFIER} {BODY}


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
            }else{
                t = TS.getTabelaSimbolos().get(id);
                return (new Token(t.getTag(), id, yyline(), yycolumn(), yychar(), yychar+yylenght()));
            }
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

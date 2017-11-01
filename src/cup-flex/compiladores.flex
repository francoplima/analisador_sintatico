%%
%standalone

%class Teste
%unicode
%line
%column


%{
private Map<String, List<String>> simbolos = new HashMap<String, List<String>>();

private void armazenar(String lexema, String token) {
    // Se eu não possuo uma lista deste tipo de lexema
    if(simbolos.get(lexema) == null) {
	// Então eu crio a lista vazia
	simbolos.put(lexema, new ArrayList<String>());
    }
    // Então eu adiciono o símbolo a lista
    simbolos.get(lexema).add(token);
}

%}

LINETERMINATOR   = \r|\n|\t|\r\r
WHITESPACE       = {LINETERMINATOR}* | [ \t\f]*
CHARACTERE       = {ASCII}
DIGIT            = [0-9]
NUMBER           = {DIGIT}+
LETTER           = [A-Z | a-z]
VARIABLE         = {LETTER} ({LETTER} | {DIGIT})*
IDENTIFIER       = {LETTER} ({LETTER} | {DIGIT})*
LITERAL          = {CHARACTERE}+
CONSTANT         = {DIGIT} | {DIGIT}*
RELOP            = [= | > | >= | < | <= | <>]
ADDOP            = [+ | ]
MULOP            = [* | /]
FACTOR           = {VARIABLE} | {CONSTANT} | ({EXPRESSION})
TERM2 			 = {TERM}
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

"if"					{ armazenar("reserved", yytext());  }
"else"					{ armazenar("reserved", yytext());  }
"end"					{ armazenar("reserved", yytext());  }
"begin"					{ armazenar("reserved", yytext());  }
"do"					{ armazenar("reserved", yytext());  }
"while"					{ armazenar("reserved", yytext());  }
"integer"				{ armazenar("type", yytext()); }
","            			{ System.out.println("Separator ','"); }
{NUMBER}                { armazenar("number", yytext()); }
{VARIABLE}              { armazenar("variable", yytext()); }




. { throw new RuntimeException("Caractere inválido '" + yytext() + "' na linha " + yyline + " e coluna " + yycolumn); }




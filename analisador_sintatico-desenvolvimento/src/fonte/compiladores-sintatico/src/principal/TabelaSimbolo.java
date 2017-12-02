package principal;

import java.util.Hashtable;

public class TabelaSimbolo {
    private Hashtable<String, Token> tabelaSimbolos;

    public TabelaSimbolo(){
        tabelaSimbolos = new Hashtable<String, Token>();
        String palavra;
        palavra = "program";
        tabelaSimbolos.put(palavra.toString(), (new Token(sym.PRG, palavra.toString())));
    }

    public Hashtable<String, Token> getTabelaSimbolos() {
        return tabelaSimbolos;
    }

    public void putTS(String key, Token value){
        this.tabelaSimbolos.put(key, value);
    }

    public void imprimirTS(){
        System.out.println("Tabela de Símbolos");
        for(Token teste : tabelaSimbolos.values()){
           System.out.print(teste.lexema);
           System.out.println(": " + teste.tag);
           tabelaSimbolos.get(teste);
       }
    }
}
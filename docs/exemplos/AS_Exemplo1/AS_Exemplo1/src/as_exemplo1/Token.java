package as_exemplo1;

public class Token  extends java_cup.runtime.Symbol{
    public int tag;
    public String lexema;
    private int linha;

    private int coluna;
    private int inicio;
    private int fim;

    public Token(int tag, String lexema){
        super(tag);
        this.tag    = tag;
        this.lexema = lexema;
    }

    public Token(int tag, String lexema, int linha, int coluna, int inicio, int fim){
        super(tag, linha, coluna);
        this.tag    = tag;
        this.lexema = lexema;
        this.linha  = linha;
        this.coluna = coluna;
        this.inicio = inicio;
        this.fim    = fim;
    }

    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

}
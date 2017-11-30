package principal;

public class Main {

    public static void main(String[] argv) {
        leArquivo(argv);
    }
    
    public static void leArquivo(String[] argv) {
        argv = new String[] {"F:\\Users\\Guilherme\\Documents\\analisador_lexico\\docs\\arquivos_teste\\teste_1.txt"};
        if (argv.length == 0) {
            System.out.println("Usage : java Yylex <inputfile>");
        } else {
            for (int i = 0; i < argv.length; i++) {                
                Yylex scanner = null;
                try {
                    scanner = new Yylex(new java.io.FileReader(argv[i]));
                    Parser p = new Parser(scanner);
                    p.parse();

                } catch (java.io.FileNotFoundException e) {
                    System.out.println("File not found : \"" + argv[i] + "\"");
                } catch (java.io.IOException e) {
                    System.out.println("IO error scanning file \"" + argv[i] + "\"");
                    System.out.println(e);
                } catch (Exception e) {
                    System.out.println("Unexpected exception:");
                }
            }
        }
    }
}
import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone
%{
    private List<String> tokens = new ArrayList<>();
%}
%{
    public List<String> analizar (String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
            }
        } catch (Exception ex){
            System.out.println("Error al analizar el archivo");
        } finally {
            try{
                in.close();
            }catch(Exception ex){
                System.out.println("Error al cerrar el archivo");
            }
        }
        return this.tokens;
    }
%}
%%

">"     {tokens.add(">" ); System.out.println("Mayor que");}
"<"     {tokens.add("<" ); System.out.println("Menor que");}
"=="    {tokens.add("=="); System.out.println("Igual que");}
"%%"    {tokens.add("%%"); System.out.println("Doble prociento");}
['_'a-zA-Z][0-9a-zA-Z]* {tokens.add("ID"); System.out.println("Identificador");}
[0-9]+ {tokens.add("Num"); System.out.println("Numero");}

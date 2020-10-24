/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;
import java.io.File;

/**
 *
 * @author kedd
 */
public class Programa_principal {
    public static void main(String[] args) {
        String ruta = "D:/Kedd/Documents/NetBeansProjects/AnalizadorLexico/src/codigo/Reglas.flex";
        generarReglas(ruta);
    }
    public static void generarReglas(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}

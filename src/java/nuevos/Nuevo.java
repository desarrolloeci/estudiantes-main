/*
 * Nuevo.java
 *
 * Created on 9 de septiembre de 2003, 20:37
 */

package nuevos;
import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import estudiantes.baseDatos.BaseDatosadm ;
/**
 *
 * @author  Juli�n Garc�a
 * @version 1.0
 */
public class Nuevo {

    private String idInsc;
    private String nom;
    private String ema;
    private String tel;
    private String doc;
    private String tip;
    private String prog;    
    
    /** Creates new Nuevo */
    public Nuevo() {
    }
    public Nuevo(HttpServletRequest request) {
/**
 *
 * @author  Juli�n Garc�a
 * @version 1.0
 * Funci�n: Crea una instancia de un posible aspirante 
 * Parametros:  HttpServletRequest request  Datos recibidos de la P�gina
 *              String idEst   Identificador generado para el aspirante
 */
        nom = new String(request.getParameter("nom")) ;
        ema = new String(request.getParameter("ema")) ;
        tel = new String(request.getParameter("tel")) ;
        doc = new String(request.getParameter("doc")) ;
        tip = new String(request.getParameter("tip")) ;
        prog = new String(request.getParameter("prog")) ;
    }

    public String inserteBD(BaseDatosadm bd) {
        String consulta, sec, mensaje = new String("Error, Faltan Datos");
        
        if (nom.equals("") || doc.equals("") || tel.equals("") )
            return mensaje ;
        sec = bd.sigSecuencia("PAGINSC") ;
        //== El registro es nuevo se crea en la base de datos
        consulta = new String("insert into registro.pginscrip values (") ;
        consulta = consulta + sec + ", '2004-1', '" + nom + "', '" + ema + "', '" + doc + 
                        "', '" + tel + "', getdate(), 0, null, '" + tip + "', '" + prog + "' )" ; 
        if (bd.actualizar(consulta) > 0 ) 
            mensaje = new String(sec) ;
        else 
            mensaje = new String("Error en Inserci�n " + bd.getMensajeBD() ) ;
        return mensaje;
    }      
}

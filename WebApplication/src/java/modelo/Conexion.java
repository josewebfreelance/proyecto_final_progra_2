/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;
/**
 *
 * @author Desarrollo
 */
public class Conexion {
    public Connection conexionBD;
    private final String sgdb="mysql";
    private final String servidor="localhost";
    private final String puerto =":3306";
    private final String bd="dbescuela";
    private final String urlConexion = "jdbc:"+sgdb +"://"+servidor+puerto+"/"+bd; 
    private final String usuario ="root";
    private final String contra ="";
    private final String jdbc ="com.mysql.jdbc.Driver";
    
    public void AbrirConexion(){
    try{
        Class.forName(jdbc);
        conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);
        
    }catch(Exception ex){
    JOptionPane.showMessageDialog(
           null,ex.getMessage(), 
                "Error",
    JOptionPane.ERROR_MESSAGE);
    }
    }
    public void cerrarConexion(){
    try{
        conexionBD.close();
    }catch(Exception ex){
    System.out.println(ex.getMessage());
    }
    }
    
}

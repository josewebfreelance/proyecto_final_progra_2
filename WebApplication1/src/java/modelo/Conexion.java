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
 * @author Carlos Rosales
 */
public class Conexion {
    protected Connection conexionBd;
    
    private final String sgdb = "mysql"; // sqlserver,mysql
    private final String servidor="127.0.0.1"; 
    private final String puerto=":3306";//:3306
    private final String bd = "dbempresa";
    private final String urlConexion = "jdbc:"+sgdb +"://"+servidor+puerto+"/"+bd; //mysql
    
    //private final String urlConexion = "jdbc:"+sgdb +"://"+servidor+puerto+";databaseName="+bd;
    private final String usuario = "root";
    private final String contra = "1234"
            + "";
    private final String jdbc="com.mysql.jdbc.Driver"; // com.microsoft.sqlserver.jdbc.SQLServerDriver,com.mysql.jdbc.Driver
    
    protected void abrirConexion()
    {
        try
        {
        Class.forName(jdbc);
        //conexionBd = DriverManager.getConnection("jdbc:sqlserver://DESARROLLO;databaseName=dbEscuela;user=IsEscuela;password=escuela2016;");
        conexionBd= DriverManager.getConnection(urlConexion,usuario,contra);
        
       //JOptionPane.showMessageDialog(null,"EXITO","Conexion Exitosa",JOptionPane.INFORMATION_MESSAGE);
        }
        catch(Exception ex)
        {
         
        JOptionPane.showMessageDialog(null,ex.getMessage(),"Error en Conexion :(",JOptionPane.ERROR_MESSAGE);
        }
    }
    
    
    protected void cerrarConexion()
    {
        try {
            conexionBd.close();
            }
            catch(Exception ex)
        {        
        JOptionPane.showMessageDialog(null,ex.getMessage(),"Error en Conexion",JOptionPane.ERROR_MESSAGE);
        }

    }
    }




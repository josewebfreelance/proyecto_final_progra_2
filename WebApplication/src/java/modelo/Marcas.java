/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Charly Rosales
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;

public class Marcas {
        private Conexion clsConectar;
    
    private int idMarca;
    private String Marca;
    PreparedStatement parametro;

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }
    
    
    public void setidMarca(int cridMarca){idMarca=cridMarca;}
    public int getidMarca(){return idMarca;} 
     
    
  public DefaultTableModel llenarMarcas(){
      DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           
           String query;
           query = "Select idmarca,marca from dbempresa.marcas order by marcas.idmarca desc";
           ResultSet consulta =  clsConectar.conexionBD.createStatement().executeQuery(query);
            
            String encabezado [] = {"idmarca","marca"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[2];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("idmarca");
                      datos[1] = consulta.getString("marca");
                      tblModelo.addRow(datos);
                    }
              clsConectar.cerrarConexion();
              
              return  tblModelo;            
                 }
                 
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                    System.out.println(ex.getMessage());
                    return  tblModelo;
            }
      }
   
public int ingresar(){
    int retorno =0;
            try{
                
                
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           String query;
           query = "Insert into Marcas(Marca) values(?)"; 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setString(1, getMarca());
           int executar =  parametro.executeUpdate();
             clsConectar.cerrarConexion();
         
             retorno = executar;

            }
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                  System.out.println(ex.getMessage());
                  retorno = 0;
            }
        
           return retorno;
        }   
 public int Modificar(){
     int retorno =0;
            try{
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           String query;
           query = "update Marcas set marca = ? where idMarca=?";
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           
           parametro.setString(1, getMarca());
           parametro.setInt(2, getidMarca());
                  
           int executar =  parametro.executeUpdate();
             clsConectar.cerrarConexion();
         
         retorno = executar;

            }
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                  System.out.println(ex.getMessage());
                  retorno = 0;
            }
        
           return retorno;
        }
  public int Eliminar(){
       int retorno =0;
            try{
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
                      String query;
           query = "delete from  Marcas where idMarca=? " ;                                 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setInt(1, getIdMarca());
           

           int executar =  parametro.executeUpdate();
           clsConectar.cerrarConexion();
         
           
             retorno = executar;

            }
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                  System.out.println(ex.getMessage());
                  retorno = 0;
            }
        
           return retorno;
           
           
        }
  
   
}

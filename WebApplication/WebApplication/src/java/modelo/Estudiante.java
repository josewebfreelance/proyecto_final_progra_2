/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;


public class Estudiante extends Persona {
    private Conexion clsConectar;
    private String carne;
    private int idEstudiante;
    PreparedStatement parametro;
    
    public void setidEstudiante(int pridEstudiante){idEstudiante=pridEstudiante;}
    public int getidEstudiante(){return idEstudiante;} 
     
    public void setCarne(String prCarne){carne=prCarne;}
    public String getCarne(){return carne;}
    
     public List<List<String>> listaTipoSangre(){
    List<List<String>> lista = new ArrayList<List<String>>();
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
              try{
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           String query;
           query = "Select idTipoSangre,TipoSangre from TiposSangre" ;
           ResultSet consulta =  clsConectar.conexionBd.createStatement().executeQuery(query);
           lista.get(0).add("0");
           lista.get(1).add("<< Elija >>");
                  
           while (consulta.next())
                    { 
                        
                        lista.get(0).add(consulta.getString("idtipoSangre"));
                        lista.get(1).add(consulta.getString("tipoSangre"));
                    }
              clsConectar.cerrarConexion();
              
           }
                 
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                  System.out.println(ex.getMessage());
                  lista.get(0).add("0");
                  lista.get(1).add("<< Elija >>");
            }
           return lista;

    }


  public DefaultTableModel llenarEstudiante(){
      DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           
           String query;
           query = "Select Estudiantes.idEstudiante as id, Estudiantes.Carne, Estudiantes.Nombres, Estudiantes.Apellidos, Estudiantes.Direccion, Estudiantes.Telefono, Estudiantes.Correo,  " +
                   "TiposSangre.idTipoSangre , Estudiantes.Fecha_Nacimiento as FechaNacimiento,TiposSangre.idTipoSangre FROM  dbescuela.Estudiantes INNER JOIN dbescuela.tipossangre ON Estudiantes.idTipoSangre = TiposSangre.idTipoSangre order by Estudiantes.idEstudiante desc";
            ResultSet consulta =  clsConectar.conexionBd.createStatement().executeQuery(query);
            
            String encabezado [] = {"id","Carne","Nombres","Apellidos","Direccion","Telefono","Correo","TipoSangre","FechaNacimiento","idTipoSangre"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[10];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("id");
                      datos[1] = consulta.getString("Carne");
                      datos[2] = consulta.getString("Nombres");
                      datos[3] = consulta.getString("Apellidos");
                      datos[4] = consulta.getString("Direccion");
                      datos[5] = consulta.getString("Telefono");
                      datos[6] = consulta.getString("Correo");
                      datos[7] = consulta.getString("idTipoSangre");
                      datos[8] = consulta.getString("Fecha_Nacimiento");
                      datos[9] = consulta.getString("idTipoSangre");
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
           query = "Insert into Estudiantes(carne,nombres,"
                    + "apellidos,direccion,telefono,"
                    + "correo,idtiposangre,fecha_nacimiento)"
                    + "values(?,?,?,?,?,?,?,?)";
            parametro = (PreparedStatement) clsConectar.conexionBd.prepareStatement(query);
           
           parametro.setString(1, getCarne());
           parametro.setString(2, getNombres());
           parametro.setString(3, getApellidos());
           parametro.setString(4, getDireccion());
           parametro.setString(5, getTelefono());
           parametro.setString(6, getCorreo());
           parametro.setInt(7, getIdtiposangre());
           parametro.setString(8, getFecha_nacimiento());
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
           query = "update Estudiantes set Carne = ?,Nombres= ?,Apellidos= ?,Direccion= ?,Telefono= ?,Correo= ?,idTipoSangre= ?,Fecha_Nacimiento= ? " +
                                            "where idEstudiante=?";
           parametro = (PreparedStatement) clsConectar.conexionBd.prepareStatement(query);
           
           parametro.setString(1, getCarne());
           parametro.setString(2, getNombres());
           parametro.setString(3, getApellidos());
           parametro.setString(4, getDireccion());
           parametro.setString(5, getTelefono());
           parametro.setString(6, getCorreo());
           parametro.setInt(7, getIdtiposangre());
           parametro.setString(8, getFecha_nacimiento());
           parametro.setInt(9, getidEstudiante());
                  
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
           query = "delete from  Estudiantes where idEstudiante=? " ;                                 
           parametro = (PreparedStatement) clsConectar.conexionBd.prepareStatement(query);
           parametro.setInt(1, getidEstudiante());
           

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

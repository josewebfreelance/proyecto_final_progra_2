/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Giordy Perez
 */
public class Puestos extends Empleados {
public String puestoTipo;
public int  puestoID;
public Conexion clsConectar;
DefaultTableModel tblModelo;
PreparedStatement parametro;

    public String getPuestoTipo() {
        return puestoTipo;
    }

    public void setPuestoTipo(String puestoTipo) {
        this.puestoTipo = puestoTipo;
    }

    public int getPuestoID() {
        return puestoID;
    }

    public void setPuestoID(int puestoID) {
        this.puestoID = puestoID;
    }


 public List<List<String>> listaPuestos(){
    List<List<String>> lista = 
            new ArrayList<List<String>>();
    lista.add(new ArrayList<String>());
    lista.add(new ArrayList<String>());
    try{
        clsConectar = new Conexion();
        clsConectar.AbrirConexion();
        String query ="select idPuesto,puesto FROM puestos";
        ResultSet consulta = clsConectar.conexionBD
         .createStatement().executeQuery(query);
        lista.get(0).add("0");
        lista.get(1).add("<< Elija >>");
        while(consulta.next()){
        lista.get(0).add
        (consulta.getString("idPuesto"));
        lista.get(1).add
        (consulta.getString("puesto"));
        }
        clsConectar.cerrarConexion();
    }catch(Exception ex){
        clsConectar.cerrarConexion();
        lista.get(0).add("0");
        lista.get(0).add("Error");
        System.out.println(ex.getMessage());
    }
    return lista;
    }
 
  public DefaultTableModel llenarPuestos(){
      DefaultTableModel tblModelo1= new DefaultTableModel();
           try
            {
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
           
           String query;
           query = "Select puestos.puesto,puestos.idPuesto FROM   puestos order by  puestos.idPuesto desc";
           ResultSet consulta =  clsConectar.conexionBD.createStatement().executeQuery(query);
            String encabezado [] = {"IdPuestos","Puesto"};
            tblModelo1.setColumnIdentifiers(encabezado);
            String datos[]= new String[2];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("idPuesto");
                      datos[1] = consulta.getString("puesto");
                      tblModelo1.addRow(datos);
                    }
              clsConectar.cerrarConexion();
              return  tblModelo1;            
                 }
                 
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                    System.out.println(ex.getMessage());
                    return  tblModelo1;
            }
      }
   
  
  public DefaultTableModel llenarEmpleado(){
      DefaultTableModel tblModelo1= new DefaultTableModel();
           try
            {
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
           
           String query;
           query = "SELECT\n" +
"  empleados.idEmpleado,\n" +
"  empleados.nombres,\n" +
"  empleados.apellidos,\n" +
"  empleados.direccion,\n" +
"  empleados.telefono,\n" +
"  empleados.DPI,\n" +
"  empleados.genero,\n" +
"  empleados.fecha_nacimiento,\n" +
"  empleados.idPuesto,\n" +
"  empleados.fecha_inicio_labores ,\n" +
"  empleados.fechaingreso ,\n" +
"  puestos.idPuesto\n" +                  
"FROM dbempresa.empleados\n" +
"  INNER JOIN dbempresa.puestos \n" +
"		ON empleados.idPuesto = puestos.idPuesto\n" +
"order by\n" +
"  empleados.idEmpleado desc";
           ResultSet consulta =  clsConectar.conexionBD.createStatement().executeQuery(query);
            String encabezado [] = {"idEmpleado","nombres","apellidos","direccion","telefono","DPI","genero","fecha_nacimiento","idPuesto","fecha_inicio_labores","fechaingreso","idPuesto"};
            tblModelo1.setColumnIdentifiers(encabezado);
            String datos[]= new String[12];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("idEmpleado");
                      datos[1] = consulta.getString("nombres");
                      datos[2] = consulta.getString("apellidos");
                      datos[3] = consulta.getString("direccion");
                      datos[4] = consulta.getString("telefono");
                      datos[5] = consulta.getString("DPI");
                      datos[6] = consulta.getString("genero");
                      datos[7] = consulta.getString("fecha_nacimiento");
                      datos[8] = consulta.getString("idPuesto");
                      datos[9] = consulta.getString("fecha_inicio_labores");
                      datos[10] = consulta.getString("fechaingreso");
                      datos[11] = consulta.getString("idPuesto");
                      tblModelo1.addRow(datos);
                    }
              clsConectar.cerrarConexion();
              return  tblModelo1;            
                 }
                 
        catch(SQLException ex)
            {
                  clsConectar.cerrarConexion();
                    System.out.println(ex.getMessage());
                    return  tblModelo1;
            }
      }
  
public int ingresar(){
    int retorno =0;
            try{
                
                
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
           String query;
           query = "INSERT INTO empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso) " +
                                            "Values(?,?,?,?,?,?,?,?,?,now())";
                      
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setString(1, getNombre());
           parametro.setString(2, getApellido());
           parametro.setString(3, getDireccion());
           parametro.setString(4, getTelefono());
           parametro.setString(5, getDpi());
           parametro.setString(6, getGenero());
           parametro.setString(7, getFechaNacimiento());
           parametro.setInt(8, getTipopuesto());
           parametro.setString(9, getFecha_inicioLab());
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

public int ingresarpuesto(){
    int retorno =0;
            try{
                
                
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
           String query;
           query = "INSERT INTO puestos(Puesto) " +
                                            "Values(?)";
                      
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setString(1, getPuestoTipo());
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
           clsConectar.AbrirConexion();
           String query;                                                                           
           query = "update empleados set nombres = ?,apellidos= ?,direccion= ?,telefono= ?,DPI= ?,genero=?,fecha_nacimiento=?,idPuesto= ?,fecha_inicio_labores=?,fechaingreso= now() " +
                                            "where idEmpleado=?";
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           
           parametro.setString(1, getNombre());
           parametro.setString(2, getApellido());
           parametro.setString(3, getDireccion());
           parametro.setString(4, getTelefono());
           parametro.setString(5, getDpi());
           parametro.setString(6, getGenero());
           parametro.setString(7, getFechaNacimiento());
           parametro.setInt(8, getTipopuesto());
           parametro.setString(9, getFecha_inicioLab());
           parametro.setInt(10, getIdEmpleados());
                  
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
 
 public int Modificarpuesto(){
     int retorno =0;
            try{
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
           String query;
           query = "update puestos set Puesto = ?" +
                                            "where idPuestos=?";
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);

           parametro.setString(1, getPuestoTipo());
           parametro.setInt(2, getPuestoID());
                   
                  
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
           clsConectar.AbrirConexion();
                      String query;
           query = "DELETE FROM  empleados where idEmpleado=?  " ;                                 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setInt(1, getIdEmpleados());
           
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
  
  public int Eliminarpuestos(){
       int retorno =0;
            try{
           clsConectar = new Conexion();
           clsConectar.AbrirConexion();
                      String query;
           query = "DELETE FROM  puestos where idPuestos=?  " ;                                 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setInt(1, getPuestoID());
           

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

/*
 * To change this template, choose Tools | Templates
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


public class Productos extends Inventario {
    private Conexion clsConectar;
    
    private int idProducto;
    PreparedStatement parametro;
    
    public void setidProductos(int cridProductos){idProducto=cridProductos;}
    public int getidProductos(){return idProducto;} 
     
    
    public List<List<String>> listaTipoMarca(){
    List<List<String>> lista = new ArrayList<List<String>>();
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
              try{
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           String query;
           query = "Select idmarca,marca from dbempresa.marcas" ;
           ResultSet consulta =  clsConectar.conexionBD.createStatement().executeQuery(query);
           lista.get(0).add("0");
           lista.get(1).add("<< Elija >>");
                  
           while (consulta.next())
                    { 
                        
                        lista.get(0).add(consulta.getString("idmarca"));
                        lista.get(1).add(consulta.getString("marca"));
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


  public DefaultTableModel llenarProductos(){
      DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           clsConectar = new Conexion();
           clsConectar.abrirConexion();
           
           String query;
           query = "Select productos.idProducto as id, productos.producto, productos.Descripcion, productos.Imagen, productos.precio_costo, productos.precio_venta, productos.existencia, productos.fecha_ingreso, marcas.idmarca, marcas.marca FROM dbempresa.productos INNER JOIN dbempresa.marcas ON productos.idmarca = marcas.idmarca order by productos.idproducto desc";
           ResultSet consulta =  clsConectar.conexionBD.createStatement().executeQuery(query);
            
            String encabezado [] = {"id","Producto","marca","Descripcion","Imagen","precio_costo","precio_venta","existencia","fecha_ingreso","idmarca"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[10];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("id");
                      datos[1] = consulta.getString("Producto");
                      datos[2] = consulta.getString("idmarca");
                      datos[3] = consulta.getString("Descripcion");
                      datos[4] = consulta.getString("Imagen");
                      datos[5] = consulta.getString("precio_costo");
                      datos[6] = consulta.getString("precio_venta");
                      datos[7] = consulta.getString("existencia");
                      datos[8] = consulta.getString("fecha_ingreso");
                      datos[9] = consulta.getString("marca");
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
           query = "Insert into productos(producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fecha_ingreso) values(?,?,?,?,?,?,?,?)"; 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setString(1, getProducto());
           parametro.setInt(2, getIdMarca());
           parametro.setString(3, getDescripcion());
           parametro.setString(4, getImagen());
           parametro.setDouble(5, getPrecio_costo());
           parametro.setDouble(6, getPrecio_venta());
           parametro.setInt(7, getExistencia());
           parametro.setString(8, getFecha_ingreso());
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
           query = "update productos set producto = ?,idMarca= ?,Descripcion= ?,Imagen= ?,precio_costo= ?,precio_venta= ?,existencia= ?,fecha_ingreso= ?  where idProducto=?";
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           
           parametro.setString(1, getProducto());
           parametro.setInt(2, getIdMarca());
           parametro.setString(3, getDescripcion());
           parametro.setString(4, getImagen());
           parametro.setDouble(5, getPrecio_costo());
           parametro.setDouble(6, getPrecio_venta());
           parametro.setInt(7, getExistencia());
           parametro.setString(8, getFecha_ingreso());
           parametro.setInt(9, getidProductos());
                  
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
           query = "delete from  productos where idProducto=? " ;                                 
           parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
           parametro.setInt(1, getidProductos());
           

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

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
 * @author jlemusu
 */
public class VentasDetalle {

    PreparedStatement parametro;

    private Conexion clsConectar;

    private int idVentaDetalle, idVenta, idProducto;
    private String cantidad, precioUnitario;

    public int getIdVentaDetalle() {
        return idVentaDetalle;
    }

    public void setIdVentaDetalle(int idVentaDetalle) {
        this.idVentaDetalle = idVentaDetalle;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(String precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int ingresarDetalle() {
        int retorno = 0;
        try {

            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "INSERT INTO ventas_detalle(idVenta, idProducto, cantidad, precio_unitario)Values(?,?,?,?)";

            parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdVenta());
            parametro.setInt(2, getIdProducto());
            parametro.setString(3, getCantidad());
            parametro.setString(4, getPrecioUnitario());
            int executar = parametro.executeUpdate();
            clsConectar.cerrarConexion();

            retorno = executar;

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
            retorno = 0;
        }

        return retorno;
    }

    public DefaultTableModel llenarDetalleVenta(int ventaId) {
        DefaultTableModel tblModelo = new DefaultTableModel();
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();

            String query;
            query = "SELECT * FROM dbempresa.ventas_detalle where idVenta = " + ventaId + "";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"idventa_detalle", "idVenta", "idProducto", "cantidad", "precio_unitario"};

            tblModelo.setColumnIdentifiers(encabezado);
            String datos[] = new String[5];
            while (consulta.next()) {
                datos[0] = consulta.getString("idventa_detalle");
                datos[1] = consulta.getString("idVenta");
                datos[2] = consulta.getString("idProducto");
                datos[3] = consulta.getString("cantidad");
                datos[4] = consulta.getString("precio_unitario");
                tblModelo.addRow(datos);
            }
            clsConectar.cerrarConexion();
            return tblModelo;
        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
            return tblModelo;
        }
    }

    public List<List<String>> selectGenerico(String queryDb, String id, String nombre) {
        List<List<String>> clientes = new ArrayList<List<String>>();
        clientes.add(new ArrayList<String>());
        clientes.add(new ArrayList<String>());

        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = queryDb;
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                clientes.get(0).add(consulta.getString(id));
                clientes.get(1).add(consulta.getString(nombre));
            }

            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return clientes;
    }

}

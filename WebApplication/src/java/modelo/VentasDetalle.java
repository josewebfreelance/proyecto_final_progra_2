/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
            query = "INSERT INTO ventas_detalle(idVenta, idProducto, cantidad, precio_unitario) "
                    + "Values(?,?,?,?)";

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

}

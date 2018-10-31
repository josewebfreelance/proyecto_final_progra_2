/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author jlemusu
 */
public class Ventas {

    private Conexion clsConectar;

    private int idVentas, noFactura, idCliente, idEmpleado;
    private String serie, fechaFactura, fechaIngreso;

    public int getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(int idVentas) {
        this.idVentas = idVentas;
    }

    public int getNoFactura() {
        return noFactura;
    }

    public void setNoFactura(int noFactura) {
        this.noFactura = noFactura;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFechaFactura() {
        return fechaFactura;
    }

    public void setFechaFactura(String fechaFactura) {
        this.fechaFactura = fechaFactura;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public DefaultTableModel llenarTabla() {
        DefaultTableModel tblModelo = new DefaultTableModel();
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();

            String query;
            query = "SELECT * FROM ventas";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            String encabezado[] = {"id", "factura", "serie", "fechafactura", "idcliente", "idempleado", "fechaingreso"};

            tblModelo.setColumnIdentifiers(encabezado);

            String datos[] = new String[7];
            while (consulta.next()) {
                datos[0] = consulta.getString("idVenta");
                datos[1] = consulta.getString("nofactura");
                datos[2] = consulta.getString("serie");
                datos[3] = consulta.getString("fechafactura");
                datos[4] = consulta.getString("idcliente");
                datos[5] = consulta.getString("idempleado");
                datos[6] = consulta.getString("fechaingreso");
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

}

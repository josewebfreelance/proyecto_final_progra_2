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
public class Ventas {

    PreparedStatement parametro;

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
            query = "select\n"
                    + "dbempresa.ventas.idVenta,\n"
                    + "dbempresa.ventas.nofactura,\n"
                    + "dbempresa.ventas.serie,\n"
                    + "dbempresa.ventas.fechafactura,\n"
                    + "dbempresa.ventas.fechaingreso,\n"
                    + "dbempresa.ventas.idCliente,\n"
                    + "dbempresa.ventas.idempleado,\n"
                    + "dbempresa.clientes.nombres as nombresCliente,\n"
                    + "dbempresa.clientes.apellidos as apellidosCliente,\n"
                    + "dbempresa.empleados.nombres as nombresEmpleados,\n"
                    + "dbempresa.empleados.apellidos as apellidosEmpleados\n"
                    + "from dbempresa.ventas\n"
                    + "inner join dbempresa.clientes\n"
                    + "inner join dbempresa.empleados\n"
                    + "on \n"
                    + "dbempresa.clientes.idCliente = dbempresa.ventas.idcliente and dbempresa.empleados.idEmpleado = dbempresa.ventas.idempleado;";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            String encabezado[] = {"id", "factura", "serie", "fechafactura", "idcliente", "idempleado", "fechaingreso"};

            tblModelo.setColumnIdentifiers(encabezado);

            String datos[] = new String[7];
            while (consulta.next()) {
                datos[0] = consulta.getString("idVenta");
                datos[1] = consulta.getString("nofactura");
                datos[2] = consulta.getString("serie");
                datos[3] = consulta.getString("fechafactura");
                datos[4] = consulta.getString("nombresCliente");
                datos[5] = consulta.getString("nombresEmpleados");
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

    public int ingresar() {
        int retorno = 0;
        try {

            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "INSERT INTO ventas(noFactura,serie,fechaFactura,idCliente,idEmpleado,fechaIngreso) "
                    + "Values(?,?,?,?,?,now())";

            parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNoFactura());
            parametro.setString(2, getSerie());
            parametro.setString(3, getFechaFactura());
            parametro.setInt(4, getIdCliente());
            parametro.setInt(5, getIdEmpleado());
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

    public int obtenerUltimoId() {
        int retorno = 0;
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT idVenta FROM dbempresa.ventas ORDER BY idVenta DESC LIMIT 0,1;";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            if (consulta.next()) {
                retorno = Integer.parseInt(consulta.getString("idVenta"));
            }

            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
            return retorno;
        }

        return retorno;
    }

    public List<List<String>> obtenerVenta(String ultima) {
        List<List<String>> ultimaVenta = new ArrayList<List<String>>();
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
        ultimaVenta.add(new ArrayList<String>());
                                    
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            
            query = "SELECT * FROM dbempresa.ventas " + ultima;
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                ultimaVenta.get(0).add(consulta.getString("idVenta"));
                ultimaVenta.get(1).add(consulta.getString("nofactura"));
                ultimaVenta.get(2).add(consulta.getString("serie"));
                ultimaVenta.get(3).add(consulta.getString("fechafactura"));
                ultimaVenta.get(4).add(consulta.getString("idCliente"));
                ultimaVenta.get(5).add(consulta.getString("idEmpleado"));
                ultimaVenta.get(6).add(consulta.getString("fechaingreso"));
            }

            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return ultimaVenta;
    }

}

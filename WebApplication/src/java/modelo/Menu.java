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
import javax.swing.JOptionPane;

/**
 *
 * @author jlemus
 */
public class Menu {

    private Conexion clsConectar;
    PreparedStatement parametro;

    private int id, padre;
    private String menu;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPadre() {
        return padre;
    }

    public void setPadre(int padre) {
        this.padre = padre;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public List<List<String>> obtenerMenu() {
        List<List<String>> lista = new ArrayList<List<String>>();
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());        
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "Select * from menu";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                lista.get(0).add(consulta.getString("idmenu"));
                lista.get(1).add(consulta.getString("padre"));
                lista.get(2).add(consulta.getString("menu"));
            }
            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return lista;

    }

}

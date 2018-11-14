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
import java.util.LinkedList;
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
    private String menu, url;

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    /*public List<List<String>> obtenerListaMenu() {
        List<List<String>> lista = new ArrayList<List<String>>();
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT * FROM menu";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                lista.get(0).add(consulta.getString("idmenu"));
                lista.get(1).add(consulta.getString("padre"));
                lista.get(2).add(consulta.getString("menu"));
                lista.get(3).add(consulta.getString("url"));
            }
            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return lista;
    }*/

public List<Menu> obtenerListaMenu() {

        List<Menu> listaa = new ArrayList();
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT * FROM menu";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                Menu item = new Menu();
                int idOb = Integer.parseInt(consulta.getString("idmenu"));
                int padreOb = Integer.parseInt(consulta.getString("padre"));
                String menuOb = consulta.getString("menu");
                String urlOb = consulta.getString("url");

                    item.setId(idOb);
                    item.setPadre(padreOb);
                    item.setMenu(menuOb);
                    item.setUrl(urlOb);

                listaa.add(item);

            }

            System.out.println(listaa.size());
            /*for (int i = 0; i < listaa.size(); i++) {
                System.out.println(listaa);
            }*/

            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return listaa;
    }

    @Override
    public String toString() {
        return "{" + "id:" + id + ", padre:" + padre + ", menu:\"" + menu + "\", url:\"" + url + "\"}";
    }

    public List<List<String>> obtenerMenu(int id) {
        List<List<String>> lista = new ArrayList<List<String>>();
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        lista.add(new ArrayList<String>());
        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT * FROM menu where padre = '" + id + "'";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                lista.get(0).add(consulta.getString("idmenu"));
                lista.get(1).add(consulta.getString("padre"));
                lista.get(2).add(consulta.getString("menu"));
                lista.get(3).add(consulta.getString("url"));
            }
            clsConectar.cerrarConexion();

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        return lista;
    }
}
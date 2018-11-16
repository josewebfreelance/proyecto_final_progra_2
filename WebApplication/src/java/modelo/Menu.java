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

/**
 *
 * @author jlemus
 */
public class Menu {

    private Conexion clsConectar;
    PreparedStatement parametro;

    public static class NodoDB {

        private int id, padre;
        private String menu, url;

        public NodoDB(int id, int padre, String menu, String url) {
            this.id = id;
            this.padre = padre;
            this.menu = menu;
            this.url = url;
        }

    }

    public static class Nodo {

        private int id, padre;
        private String menu, url;
        List<Nodo> hijos = new ArrayList<>();

        public Nodo(int id, int padre, String menu, String url) {
            this.id = id;
            this.menu = menu;
            this.url = url;
            this.padre = padre;
        }

        @Override
        public String toString() {
            return "{" + "id: " + id + ", padre:" + padre + ", menu: '" + menu + "', url: '" + url + "', hijos:" + hijos + "}";
        }

    }

    public Nodo obtenerMenu() {
        List<NodoDB> listaDB = new ArrayList<>();
        Nodo respuesta = null;

        try {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT * FROM menu";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {
                int idOb = Integer.parseInt(consulta.getString("idmenu"));
                int padreOb = Integer.parseInt(consulta.getString("padre"));
                String menuOb = consulta.getString("menu");
                String urlOb = consulta.getString("url");

                listaDB.add(new NodoDB(idOb, padreOb, menuOb, urlOb));
            }

            Nodo raiz = null;
            for (NodoDB db : listaDB) {
                if (db.padre == 0) {
                    raiz = new Nodo(db.id, db.padre, db.menu, db.url);
                } else {
                    recursivo(raiz, db);
                }
            }
            
            respuesta = raiz;
            
            System.out.println(raiz);

        } catch (SQLException ex) {
            clsConectar.cerrarConexion();
            System.out.println(ex.getMessage());
        }
        
        return respuesta;
    }

    static void recursivo(Nodo nodo, NodoDB db) {
        if (db.padre == nodo.id) {
            nodo.hijos.add(new Nodo(db.id, db.padre, db.menu, db.url));
        } else {
            for (Nodo hijo : nodo.hijos) {
                recursivo(hijo, db);
            }
        }
    }

}

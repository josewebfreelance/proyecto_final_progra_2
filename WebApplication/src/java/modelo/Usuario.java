/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author jlemus
 */
public class Usuario {

    private Conexion clsConectar;
    PreparedStatement parametro;

    private String usuario;
    private String contrasenia;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int registrar() throws NoSuchAlgorithmException {
        int retorno = 0;
        try {
            if (getUsuario() != "" && getContrasenia() != "") {
                clsConectar = new Conexion();
                clsConectar.abrirConexion();
                String query;
                query = "Insert into usuarios(usuario, contrasenia)"
                        + "values(?,?)";
                parametro = (PreparedStatement) clsConectar.conexionBD.prepareStatement(query);
                parametro.setString(1, getUsuario());
                parametro.setString(2, sha256(getContrasenia()));
                int executar = parametro.executeUpdate();
                clsConectar.cerrarConexion();
                retorno = executar;
            } else {
                retorno = 0;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(
                    null, ex.getMessage(),
                    "Error",
                    JOptionPane.ERROR_MESSAGE);
        }

        return retorno;
    }

    public int iniciarSesion() throws NoSuchAlgorithmException, SQLException {
        int retorno = 0;
        String contraseniaIngresada = sha256(getContrasenia());

        if (getContrasenia().equals("") || getUsuario().equals("")) {
            retorno = 0;
        } else {
            clsConectar = new Conexion();
            clsConectar.abrirConexion();
            String query;
            query = "SELECT * FROM usuarios where usuario = '" + getUsuario() + "' AND contrasenia = '" + contraseniaIngresada + "'";
            ResultSet consulta = clsConectar.conexionBD.createStatement().executeQuery(query);

            if (consulta.next()) {
                clsConectar.cerrarConexion();
                retorno = 1;
            } else {
                retorno = 0;
            }
        }

        return retorno;
    }

    static String sha256(String input) throws NoSuchAlgorithmException {
        final MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }

        return sb.toString();
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author jlemus
 */
public class sr_usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            Usuario clsUsuario = new Usuario();
            clsUsuario.setUsuario(request.getParameter("txt_usuario"));
            clsUsuario.setContrasenia(request.getParameter("txt_contrasenia"));

            elegirPantalla(request.getParameter("pantalla"), clsUsuario);
            if (clsUsuario.iniciarSesion() > 0) {
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usr", clsUsuario);

                response.sendRedirect("tablero/tablero.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_usuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_usuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(sr_usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void elegirPantalla(String pantalla, Usuario entidad) throws NoSuchAlgorithmException, SQLException {
        if (pantalla == "login") {
            entidad.iniciarSesion();
        }
        if (pantalla == "registrar") {
            entidad.registrar();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sr_usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sr_usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

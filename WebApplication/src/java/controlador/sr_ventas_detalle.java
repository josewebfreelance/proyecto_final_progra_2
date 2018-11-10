/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.VentasDetalle;

/**
 *
 * @author jlemusus
 */
public class sr_ventas_detalle extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            VentasDetalle clsVentasDetalle = new VentasDetalle();

            clsVentasDetalle.setIdVenta(Integer.parseInt(request.getParameter("txt_idventa")));
            clsVentasDetalle.setIdProducto(Integer.parseInt(request.getParameter("txt_idproducto")));
            clsVentasDetalle.setCantidad(request.getParameter("txt_cantidad"));
            clsVentasDetalle.setPrecioUnitario(request.getParameter("txt_precio"));
            
            System.out.println(request.getParameter("txt_venta_edicion"));
            System.out.println(request.getParameter("txt_idventa"));

            if (request.getParameter("txt_idventa") == "" && clsVentasDetalle.ingresarDetalle() > 0) {
                response.sendRedirect(request.getContextPath() + "/ventas/crud_ventas.jsp?seleccionado=3&&nuevo=true");
            }

            if (request.getParameter("txt_idventa") != "" && clsVentasDetalle.ingresarDetalle() > 0) {
                response.sendRedirect(request.getContextPath() + "/ventas/crud_ventas.jsp?seleccionado=3&&edicion=true&&venta="+Integer.parseInt(request.getParameter("txt_idventa")));

            }
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
        processRequest(request, response);
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
        processRequest(request, response);
        
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

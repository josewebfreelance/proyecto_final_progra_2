/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Puestos;

/**
 *
 * @author Giordy Perez
 */
public class Servlet_puesto extends HttpServlet {

   
    protected void accion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Puestos clsPuestos1 = new Puestos();
            clsPuestos1.setPuestoTipo(request.getParameter("txtPuesto1"));
            clsPuestos1.setPuestoID(Integer.parseInt(request.getParameter("txtId1")));

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Empleado</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            
            
            if (request.getParameter("btnAgregar1") !=null){
                 if (clsPuestos1.ingresarpuesto()>0){
                response.sendRedirect("/proyecto_empresa/puestos/Puestos_.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='/proyecto_empresa/puestos/Puestos_.jsp'></a>");
                }
            }
            
           if (request.getParameter("btnModificar1") !=null){
                 if (clsPuestos1.Modificarpuesto()>0){
                response.sendRedirect("/proyecto_empresa/puestos/Puestos_.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='/proyecto_empresa/puestos/Puestos_.jsp'></a>");
                }
            }
           
           if (request.getParameter("btnEliminar1") !=null){
                 if (clsPuestos1.Eliminarpuestos()>0){
                response.sendRedirect("/proyecto_empresa/puestos/Puestos_.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='proyecto_empresa/puestos/Puestos_.jsp'></a>");
                }
            }
           
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        accion(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        accion(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

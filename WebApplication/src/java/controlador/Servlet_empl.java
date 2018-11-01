/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modelo.Puestos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Giordy Perez
 */
public class Servlet_empl extends HttpServlet {

   
    protected void accion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Puestos clsPuestos1 = new Puestos();
            clsPuestos1.setIdEmpleados(Integer.parseInt(request.getParameter("txtid")));
            clsPuestos1.setNombre(request.getParameter("txtNombres"));
            clsPuestos1.setApellido(request.getParameter("txtApellidos"));
            clsPuestos1.setDireccion(request.getParameter("txtDireccion"));
            clsPuestos1.setTelefono(request.getParameter("txtTelefono"));
            clsPuestos1.setDpi(request.getParameter("txtDpi"));
            clsPuestos1.setGenero(request.getParameter("rBGenero"));
            clsPuestos1.setFechaNacimiento(request.getParameter("txtFNacimiento"));
            clsPuestos1.setTipopuesto(Integer.parseInt(request.getParameter("droppuesto")));
            clsPuestos1.setFecha_inicioLab(request.getParameter("txtFILab"));
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Empleado</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            if (request.getParameter("btnAgregar") != null)
            {
                if (clsPuestos1.ingresar()>0){
                    response.sendRedirect("/proyecto_empresa/empleados/Empleados.jsp");
                }
            else{
                    out.println("<h1>Error...</h1>");
                    out.println("<a href='/proyecto_empresa/empleados/Empleados.jsp'></a>");
                }
            }
            if (request.getParameter("btnModificar") !=null)
            {
                if (clsPuestos1.Modificar() >0){
                response.sendRedirect("/proyecto_empresa/empleados/Empleados.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='/proyecto_empresa/empleados/Empleados.jsp'></a>");
                }
            }
            if (request.getParameter("btnEliminar") !=null){
                 if (clsPuestos1.Eliminar()>0){
                response.sendRedirect("/proyecto_empresa/empleados/Empleados.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='proyecto_empresa/empleados/Empleados.jsp'></a>");
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

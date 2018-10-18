
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Estudiante;

public class EstudianteServlet extends HttpServlet {

   
    protected void accion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            modelo.Estudiante clsEstudiante = new modelo.Estudiante();
            
            clsEstudiante.setidEstudiante(Integer.parseInt(request.getParameter("txtid")));
            clsEstudiante.setCarne(request.getParameter("txt_carne"));
            clsEstudiante.setNombres(request.getParameter("txt_nombres"));
            clsEstudiante.setApellidos(request.getParameter("txt_apellidos"));
            clsEstudiante.setDireccion(request.getParameter("txt_direccion"));
            clsEstudiante.setTelefono(request.getParameter("txt_telefono"));
            clsEstudiante.setCorreo(request.getParameter("txt_correo"));
            clsEstudiante.setIdtiposangre(Integer.parseInt(request.getParameter("drop_sangre")));
            clsEstudiante.setFecha_nacimiento(request.getParameter("txt_nacimiento"));
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Proyecto Final CR</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            if (request.getParameter("btnAgregar") != null)
            {
                
                if (clsEstudiante.ingresar()>0){
                response.sendRedirect("index.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='index.jsp'></a>");
                }
            }
            if (request.getParameter("btnModificar") !=null)
            {
                if (clsEstudiante.Modificar() >0){
                response.sendRedirect("index.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='index.jsp'></a>");
                }
            }
            if (request.getParameter("btnEliminar") !=null){
                 if (clsEstudiante.Eliminar()>0){
                response.sendRedirect("index.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='index.jsp'></a>");
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

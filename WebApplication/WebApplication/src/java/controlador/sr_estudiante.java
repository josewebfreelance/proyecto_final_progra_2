
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Estudiante;

/**
 *
 * @author Charly Rosales
 */
public class sr_estudiante extends HttpServlet {

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
            Estudiante clsEstudiante = new Estudiante();
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
            if (clsEstudiante.ingresar()>0){
                out.println("<p> Ingreso Exitoso</p>");
            }else{
            out.println("<p> XXXX Error XXXX</p>");
            }
            /*out.println("<h1>Servlet sr_estudiante at " + request.getContextPath() + "</h1>");*/
            
            /*out.println("<h1>Datos Formulario</h1>");*/
            /*
            out.println("<p>"+request.getParameter("txt_carne")+"<p>");
            out.println("<p>"+request.getParameter("txt_nombres")+"<p>");
            out.println("<p>"+request.getParameter("txt_apellidos")+"<p>");
            out.println("<p>"+request.getParameter("txt_direccion")+"<p>");
            out.println("<p>"+request.getParameter("txt_telefono")+"<p>");
            out.println("<p>"+request.getParameter("txt_correo")+"<p>");
            out.println("<p>"+request.getParameter("drop_sangre")+"<p>");
            out.println("<p>"+request.getParameter("txt_nacimiento")+"<p>");
            */
            
            out.println("</body>");
            out.println("</html>");
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

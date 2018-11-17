
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MarcasServlet extends HttpServlet {

   
    protected void accion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            modelo.Marcas clsMarcas = new modelo.Marcas();
            if (request.getParameter("txt_idmarca1").isEmpty()) 
            {
                clsMarcas.setIdMarca(0);
            }
            else 
            {
                clsMarcas.setIdMarca(Integer.parseInt(request.getParameter("txt_idmarca1")));
            }
            
            clsMarcas.setMarca(request.getParameter("txt_marcas"));
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Proyecto Final CR</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            if (request.getParameter("btnAgregar") != null)
            {
                out.println("<h1>Agregar..</h1>");
                if (clsMarcas.ingresar()>0){
                response.sendRedirect("Marcas/Marcas.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='Marcas/Marcas.jsp'></a>");
                }
            }
            if (request.getParameter("btnModificar") !=null)
            {
                out.println("<h1>mmm..</h1>");
                if (clsMarcas.Modificar() >0){
                response.sendRedirect("Marcas/Marcas.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='Marcas/Marcas.jsp'></a>");
                }
            }
                if (request.getParameter("btnEliminar") !=null){
                 if (clsMarcas.Eliminar()>0){
                response.sendRedirect("Marcas/Marcas.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='Marcas/Marcas.jsp'></a>");
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

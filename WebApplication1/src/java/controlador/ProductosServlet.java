
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductosServlet extends HttpServlet {

   
    protected void accion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            modelo.Productos clsProductos = new modelo.Productos();
            
            clsProductos.setidProductos(Integer.parseInt(request.getParameter("txt_id")));
            clsProductos.setProducto(request.getParameter("txt_producto"));
            clsProductos.setIdMarca(Integer.parseInt(request.getParameter("txt_idmarca")));
            clsProductos.setDescripcion(request.getParameter("txt_descripcion"));
            clsProductos.setImagen(request.getParameter("txt_imagen"));
            clsProductos.setPrecio_costo(Integer.parseInt(request.getParameter("txt_precio_costo")));
            clsProductos.setPrecio_venta(Integer.parseInt(request.getParameter("txt_precio_venta")));
            clsProductos.setExistencia(Integer.parseInt(request.getParameter("txt_existencia")));
            clsProductos.setFecha_ingreso(request.getParameter("txt_fecha_ingreso"));
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Proyecto Final CR</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            if (request.getParameter("btnAgregar") != null)
            {
                
                if (clsProductos.ingresar()>0){
                response.sendRedirect("index.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='index.jsp'></a>");
                }
            }
            if (request.getParameter("btnModificar") !=null)
            {
                if (clsProductos.Modificar() >0){
                response.sendRedirect("index.jsp");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='index.jsp'></a>");
                }
            }
            if (request.getParameter("btnEliminar") !=null){
                 if (clsProductos.Eliminar()>0){
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ProductosServlet extends HttpServlet {

    private File fileUploadDirectory;

    // Constantes donde se definen las rutas para guardar la imagen fisica
    public static final String UPLOAD_PATH = "/home/jlemusu/NetBeansProjects/proyecto_final_progra_2/WebApplication/web/assets/imagenes_cargadas";
    // Nombre de la carpeta donde se guarda
    public static final String UPLOAD_DIR = "productos";

    // Ruta para guardar en la Base de datos
    public static final String UPLOAD_PATH_DB = "/assets/imagenes_cargadas";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        try {

            modelo.Productos clsProductos = new modelo.Productos();

            clsProductos.setidProductos(Integer.parseInt(request.getParameter("txt_id")));
            clsProductos.setProducto(request.getParameter("txt_producto"));
            clsProductos.setIdMarca(Integer.parseInt(request.getParameter("txt_idmarca")));
            clsProductos.setDescripcion(request.getParameter("txt_descripcion"));
            //clsProductos.setImagen(request.getParameter("txt_imagen"));
            clsProductos.setPrecio_costo(Double.parseDouble(request.getParameter("txt_precio_costo")));
            clsProductos.setPrecio_venta(Double.parseDouble(request.getParameter("txt_precio_venta")));
            clsProductos.setExistencia(Integer.parseInt(request.getParameter("txt_existencia")));
            clsProductos.setFecha_ingreso(request.getParameter("txt_fecha_ingreso"));

            /*
                    CARGA DE IMAGEN
             */
            OutputStream salida = null;
            InputStream i = null;
            try {
                // Ruta de carga
                String uploadPath = UPLOAD_PATH + File.separator + UPLOAD_DIR;

                // Si no se ha creado la carpeta se creara
                fileUploadDirectory = new File(uploadPath);
                if (!fileUploadDirectory.exists()) {
                    fileUploadDirectory.mkdirs();
                }

                // Se obtiene la imagen desde el formulario
                Part part = request.getPart("imagen1");// 

                // Se extrae el nombre del archivo
                String fileName = getFileName(part);//file name

                // Se cambia el nombre del archivo para evitar duplicados
                fileName = fileName.replaceAll("\\W", "_");
                String fileNamePrefix = fileName + "_";
                String fileNameSuffix = "." + getFileExtension(part);

                // Se arma la ruta final
                String rutaFinal = uploadPath + File.separator + fileNamePrefix + fileNameSuffix;

                // Se llena la variable que se encargara de la salida del archivo
                salida = new FileOutputStream(new File(rutaFinal));

                // Contador
                int read = 0;

                // Lectura del archivo
                i = part.getInputStream();
                final byte[] bytes = new byte[1024];

                while ((read = i.read(bytes)) != -1) {
                    salida.write(bytes, 0, read);
                }

                // Metodo set que agregara la ruta al formulario para ser guardada en la Base de Datos
                
                clsProductos.setImagen(UPLOAD_PATH_DB + File.separator + UPLOAD_DIR + File.separator + fileNamePrefix + fileNameSuffix);

            } catch (Exception e) {

                // Se cierra el archivo de esta manera se guarda fisicamente.
                if (salida != null) {
                    salida.close();
                }
                if (salida != null) {
                    i.close();
                }

            }

            /*
                    CARGA DE IMAGEN
             */


            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Empleado</title>");            
            
            out.println("</head>");
            out.println("<body>");
            
            if (request.getParameter("btnAgregar") != null)
            {
                if (clsProductos.ingresar()>0){
                    response.sendRedirect(request.getContextPath() + "/productos/Productos.jsp?seleccionado=5");
                }
            else{
                    out.println("<h1>Error...</h1>");
                    out.println("<a href='" + request.getContextPath() + "/productos/Productos.jsp?seleccionado=5'></a>");
                }
            }
            if (request.getParameter("btnModificar") !=null)
            {
                if (clsProductos.Modificar() >0){
                response.sendRedirect(request.getContextPath() + "/productos/Productos.jsp?seleccionado=5");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='" + request.getContextPath() + "/productos/Productos.jsp?seleccionado=5'></a>");
                }
            }
            if (request.getParameter("btnEliminar") !=null){
                 if (clsProductos.Eliminar()>0){
                response.sendRedirect(request.getContextPath() + "/productos/Productos.jsp?seleccionado=5");
                 }
            else{
                out.println("<h1>Error...</h1>");
                out.println("<a href='" + request.getContextPath() + "/productos/Productos.jsp?seleccionado=5'></a>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getFileName(Part part) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private String getFileExtension(Part part) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

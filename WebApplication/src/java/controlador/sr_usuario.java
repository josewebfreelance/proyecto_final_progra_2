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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Usuario;

/**
 *
 * @author jlemus
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class sr_usuario extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private File fileUploadDirectory;
    public static final String UPLOAD_PATH = "/home/jlemusu/NetBeansProjects/proyecto_final_progra_2/WebApplication/web/assets/imagenes_cargadas";
    public static final String UPLOAD_DIR = "usuario";
    public static final String UPLOAD_PATH_DB = "/assets/imagenes_cargadas";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession sesion = request.getSession(true);
            Usuario clsUsuario = new Usuario();
            clsUsuario.setUsuario(request.getParameter("txt_usuario"));
            clsUsuario.setContrasenia(request.getParameter("txt_contrasenia"));

            if (request.getParameter("pantalla").equals("login")) {
                if (clsUsuario.iniciarSesion() > 0) {
                    sesion.setAttribute("usr", request.getParameter("txt_usuario"));
                    response.sendRedirect("tablero/tablero.jsp?seleccionado=0");
                } else {
                    sesion.invalidate();
                    response.sendRedirect("index.jsp");
                }
            }

            if (request.getParameter("pantalla").equals("registrar")) {

                /*
                    CARGA DE IMAGEN
                 */
                
                OutputStream salida = null;
                InputStream i = null;
                try {
                    String uploadPath = UPLOAD_PATH + File.separator + UPLOAD_DIR;
                    fileUploadDirectory = new File(uploadPath);
                    if (!fileUploadDirectory.exists()) {
                        fileUploadDirectory.mkdirs();
                    }

                    Part part = request.getPart("imagen");//
                    String fileName = getFileName(part);//file name
                    fileName = fileName.replaceAll("\\W", "_");
                    String fileNamePrefix = fileName + "_";
                    String fileNameSuffix = "." + getFileExtension(part);
                    
                    String rutaFinal = uploadPath + File.separator + fileNamePrefix + fileNameSuffix;

                    salida = new FileOutputStream(new File(rutaFinal));
                    int read = 0;

                    i = part.getInputStream();
                    final byte[] bytes = new byte[1024];

                    while ((read = i.read(bytes)) != -1) {
                        salida.write(bytes, 0, read);
                    }
                    clsUsuario.setImagen(UPLOAD_PATH_DB + File.separator + UPLOAD_DIR + File.separator + fileNamePrefix + fileNameSuffix);
                    
                } catch (Exception e) {
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
                System.out.println(clsUsuario.getUsuario());
                                System.out.println(clsUsuario.getContrasenia());
                                                System.out.println(clsUsuario.getImagen());
                if (clsUsuario.registrar() > 0) {
                    response.sendRedirect(request.getContextPath() + "/index.jsp?crearUsuario=true");
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(sr_usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(sr_usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static String getFileName(Part nameFile) {
        String fileName = nameFile.getSubmittedFileName();
        return fileName.substring(0, fileName.indexOf("."));
    }

    private static String getFileExtension(Part file) {
        String fileName = file.getContentType();
        if (fileName.lastIndexOf("/") != -1 && fileName.lastIndexOf("/") != 0) {
            return fileName.substring(fileName.lastIndexOf("/") + 1);
        } else {
            return "";
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

<%-- 
    Document   : usuarios
    Created on : 15/10/2018, 08:28:38 AM
    Author     : jlemus
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <%@include file="../componentes_estaticos/encabezado_pagina.jsp" %>
    </head>
    <body>
        <div class="container-fluid col-lg-4 col-lg-offset-4">
            <h2>Registro de usuario</h2>
            <form action="sr_usuario" method="post" enctype="multipart/form-data" class="offset-4 col-4">
                <input type="hidden" name="pantalla" value="registrar">
                <input type="file" name="imagen">                
                
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" name="txt_usuario" placeholder="Nombre de usuario">
                </div>
                <div class="form-group">
                    <label for="contrasenia">Contrase&ntilde;a</label>
                    <input type="password" class="form-control" name="txt_contrasenia" placeholder="Contrase&ntilde;a">
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
                <a href=""></a>
            </form>
        </div>
    </body>
</html>

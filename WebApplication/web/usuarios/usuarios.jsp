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
        <i class="fas fa-user"></i>
        <div class="container-fluid col-lg-6 col-lg-offset-3">
            <h2>Registro de usuario</h2>
            <form action="sr_usuario" method="post" enctype="multipart/form-data" class="offset-4 col-4">
                <input type="hidden" name="pantalla" value="registrar">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="img-registrar-usuario"></div>
                        <input type="file" name="imagen">
                    </div>
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" name="txt_usuario" placeholder="Nombre de usuario">
                        </div>
                        <div class="form-group">
                            <label for="contrasenia">Contrase&ntilde;a</label>
                            <input type="password" class="form-control" name="txt_contrasenia" placeholder="Contrase&ntilde;a">
                        </div>
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">Registrar</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>

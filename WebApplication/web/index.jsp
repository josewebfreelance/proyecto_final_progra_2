<%-- 
    Document   : login
    Created on : 14/10/2018, 12:47:58 AM
    Author     : jlemus
--%>
<% session.setAttribute("usr", ""); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    boolean crearUsuario = Boolean.parseBoolean(request.getParameter("crearUsuario"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./assets/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="./assets/css/styles.css"/>
        <link rel="stylesheet" href="./assets/css/vivify.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <form action="sr_usuario" method="post" class="col-lg-offset-4 col-lg-4">
                <input type="hidden" name="pantalla" value="login">
                <h3 class="text-center">Acceso de usuario</h3>
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" name="txt_usuario" placeholder="Nombre de usuario" required>
                </div>
                <div class="form-group">
                    <label for="contrasenia">Contrase&ntilde;a</label>
                    <input type="password" class="form-control" name="txt_contrasenia" placeholder="Contrase&ntilde;a" required>
                </div>
                <div class="col-lg-12 text-right">
                    <a href="usuarios/usuarios.jsp">Registrarse</a>
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>

                <div class="row">
                    <div class="col-lg-12" style="margin-top: 15px">
                        <%
                            if (crearUsuario) {
                                out.println("<div class=\"alert alert-success vivify popIn delay-250\" role=\"alert\">Usuario creado Exitosamente</div>");
                            }
                        %>                        
                    </div>
                </div>
            </form>

        </div>
    </body>
</html>

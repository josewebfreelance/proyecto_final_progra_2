<%-- 
    Document   : login
    Created on : 14/10/2018, 12:47:58 AM
    Author     : jlemus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./assets/bootstrap/css/bootstrap.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <form action="sr_usuario" method="post" class="col-lg-offset-4 col-lg-4">
                <input type="hidden" name="pantalla" value="login">
                <h3 class="text-center">Acceso de usuario</h3>
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" name="txt_usuario" placeholder="Nombre de usuario">
                </div>
                <div class="form-group">
                    <label for="contrasenia">Contrase&ntilde;a</label>
                    <input type="password" class="form-control" name="txt_contrasenia" placeholder="Contrase&ntilde;a">
                </div>
                <div class="col-lg-12 text-right">
                    <a href="usuarios/usuarios.jsp">Registrarse</a>
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>
            </form>
        </div>
    </body>
</html>

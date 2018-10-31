<%-- 
    Document   : usuarios
    Created on : 15/10/2018, 08:28:38 AM
    Author     : jlemus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <form action="sr_usuario" method="get"  class="offset-4 col-4">
                <input type="hidden" name="pantalla" value="registrar">
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" name="txt_usuario" placeholder="Nombre de usuario">
                </div>
                <div class="form-group">
                    <label for="contrasenia">Contrase&ntilde;a</label>
                    <input type="password" class="form-control" name="txt_contrasenia" placeholder="Contrase&ntilde;a">
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>
    </body>
</html>

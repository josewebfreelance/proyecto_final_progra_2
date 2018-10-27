<%-- 
    Document   : tablero
    Created on : 17/10/2018, 12:28:21 AM
    Author     : jlemus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.css">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <%
                                    /*HttpSession objSesion = request.getSession(false);
                                    String usuario = (String) objSesion.getAttribute("usr");
                                    out.println("s" + usuario);*/
                                %>
                                Usuario
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Cerrar sesi&oacute;n</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="container-fluid">
            <div class="btn-group-vertical col-lg-2" role="group">
                <%
                    Menu clsMenu = new Menu();
                    List<List<String>> lista = clsMenu.obtenerMenu();

                    for (int i = 0; i < lista.get(0).size(); i++) {
                        out.println("<button type='button' class='btn btn-default'>" + lista.get(2).get(i) + "</button>");
                    }
                %>
            </div>
            <div class="col-lg-10">
                contenido
            </div>
        </div>

        <script src="../assets/bootstrap/js/bootstrap.js"/>
        <script src="../assets/bootstrap/js/jquery-3.2.1.min.js"/>
    </body>
</html>

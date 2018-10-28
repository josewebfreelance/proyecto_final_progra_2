<%-- 
    Document   : tablero
    Created on : 17/10/2018, 12:28:21 AM
    Author     : jlemus
--%>
<%
    if (session.getAttribute("usr").equals("")) {
        response.sendRedirect("/proyecto_final_progra_2/");
    }
%>
<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.css">
        <script src="../assets/bootstrap/js/jquery-3.3.1.js"></script>
        <script src="../assets/bootstrap/js/bootstrap.js"></script>
        <script src="../assets/js/scripts.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <% out.println(session.getAttribute("usr")); %>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="sr_tablero" method="post">                                     
                                        <input type="submit" value="Cerrar sesi&oacute;n">
                                    </form>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="btn-group-vertical col-lg-2" role="group">
                    <%
                        Menu clsMenu = new Menu();
                        List<List<String>> lista = clsMenu.obtenerMenu();

                        for (int i = 0; i < lista.get(0).size(); i++) {
                            out.println("<div class='btn-group' role='group'>");
                            if (Integer.parseInt(lista.get(1).get(i)) == 0) {
                                out.println(""
                                        + "<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
                                        + lista.get(2).get(i) + "<span class='caret'></span>"
                                        + "</button>"
                                );
                            }
                            if (Integer.parseInt(lista.get(0).get(i)) == Integer.parseInt(lista.get(1).get(i))) {
                                out.println(""
                                        + "<ul class='dropdown-menu'>"
                                        + "<li><a href='#'>" + lista.get(2).get(i) + "</a></li>"
                                        + "</ul>");
                            }
                            out.println("</div>");
                        }
                    %>
                </div>
                <div class="col-lg-10">
                    contenido
                </div>                
            </div>           
        </div>

    </body>
</html>

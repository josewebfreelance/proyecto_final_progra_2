<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<div class="btn-group-vertical col-lg-12" role="group">
    <%! public String test() {
            String f = "test";
            return f;
        }%>
    <%
        Menu clsMenu = new Menu();
        List<List<String>> listaSize, listaMenu;
        listaSize = clsMenu.obtenerListaMenu();

        String pagina_activa = (String) request.getParameter("seleccionado");

        for (int i = 0; i < listaSize.get(0).size(); i++) {
          %>  
          <%= test() %>
        <%

            listaMenu = clsMenu.obtenerMenu(Integer.parseInt(listaSize.get(0).get(i)));

            out.println(""
                    + "<div class='btn-group' role='group'>"
                    + "<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
                    + listaSize.get(2).get(i)
                    + "<span class='caret'></span>"
                    + "</button>"
                    + "<ul class='dropdown-menu'>");

            for (int j = 0; j < listaMenu.get(0).size(); j++) {
                System.out.println(Integer.parseInt(listaMenu.get(1).get(j)));
                if (Integer.parseInt(listaSize.get(0).get(i)) == Integer.parseInt(listaMenu.get(1).get(j))) {
                    out.println("<li><a href='#'>" + listaMenu.get(2).get(j) + "</a></li>");
                }
            }

            out.println("</ul>"
                    + "</div>");

            /*out.println(""
                    + "<a id='" + listaSize.get(0).get(i) + "' href='../" + listaSize.get(3).get(i) + ".jsp?seleccionado=" + listaSize.get(0).get(i) + "' class='btn btn-default dropdown-toggle'>"
                    + listaSize.get(2).get(i)
                    + "</a>"
            );
            out.println("<script>activarMenu(" + Integer.parseInt(pagina_activa) + "," + listaSize.get(0).get(i) + ");</script>");*/

 /*listaMenu = clsMenu.obtenerMenu(Integer.parseInt(listaSize.get(0).get(i)));
            out.println("<label>" + listaMenu.get(2) + "</label>");*/
        }
    %>
</div>

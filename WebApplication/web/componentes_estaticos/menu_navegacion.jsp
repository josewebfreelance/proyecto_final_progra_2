<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<div class="btn-group-vertical col-lg-12" role="group">
    <%
        Menu clsMenu = new Menu();
        List<List<String>> listaMenu = clsMenu.obtenerListaMenu();

        String pagina_activa = (String) request.getParameter("seleccionado");
        System.out.println(listaMenu.get(0).size());

        for (int i = 0; i < listaMenu.get(0).size(); i++) {
            out.println(""
                    + "<a id='" + listaMenu.get(0).get(i) + "' href='../" + listaMenu.get(3).get(i) + ".jsp?seleccionado=" + listaMenu.get(0).get(i) + "' class='btn btn-default dropdown-toggle'>"
                    + listaMenu.get(2).get(i)
                    + "</a>"
            );
            out.println("<script>activarMenu(" + Integer.parseInt(pagina_activa) + "," + listaMenu.get(0).get(i) + ");</script>");
        }
    %>
</div>

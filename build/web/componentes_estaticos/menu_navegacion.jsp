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
        List<List<String>> lista = clsMenu.obtenerMenu();

        String pagina_activa = (String) request.getParameter("seleccionado");

        for (int i = 0; i < lista.get(0).size(); i++) {
            out.println(""
                    + "<a id='" + lista.get(0).get(i) + "' href='../" + lista.get(3).get(i) + ".jsp?seleccionado=" + lista.get(0).get(i) + "' class='btn btn-default dropdown-toggle'>"
                    + lista.get(2).get(i)
                    + "</a>"
            );
            out.println("<script>activarMenu(" + Integer.parseInt(pagina_activa) + "," + lista.get(0).get(i) + ");</script>");
        }
    %>
</div>

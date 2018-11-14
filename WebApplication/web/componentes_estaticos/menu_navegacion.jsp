<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<div class="header-menu">
    <h4>SISAD</h4>  
</div>
<ol class="col-lg-12" role="group">
    <li>
        <%
            Menu clsMenu = new Menu();
            List<List<String>> listaMenu;
            List<Menu>listaSize = clsMenu.obtenerListaMenu();

            String urlMenu = "";

            out.println(listaSize);
            
            String pagina_activa = (String) request.getParameter("seleccionado");

            for (int i = 0; i < listaSize.get(0).size(); i++) {

                listaMenu = clsMenu.obtenerMenu(Integer.parseInt(listaSize.get(0).get(i)));

                // out.println("<script>obtenerMenu('"+listaSize.get(0).get(i)+"');</script>");
                
                if (Integer.parseInt(listaSize.get(1).get(i)) == 0) {
                    out.println("<span class=\"menu-header-group\">" + listaSize.get(2).get(i) + "</span>");
                }

                out.println("<ul class=\"menu-group\">");
                for (int j = 0; j < listaMenu.get(0).size(); j++) {
                    if (listaMenu.get(3).get(j) != null) {
                        urlMenu = request.getContextPath() + listaMenu.get(3).get(j) + ".jsp?seleccionado=" + listaMenu.get(1).get(j);
                    } else {
                        urlMenu = request.getContextPath() + "/tablero/tablero.jsp?seleccionado=0";
                    }

                    if (Integer.parseInt(listaMenu.get(1).get(j)) != 0 && Integer.parseInt(listaSize.get(0).get(i)) == Integer.parseInt(listaMenu.get(1).get(j))) {
                        out.println("<li><a href='" + urlMenu + "'>" + listaMenu.get(2).get(j) + "</a></li>");
                    }

                }
                out.println("</ul>");
            }
        %>
    </li>
</ol>

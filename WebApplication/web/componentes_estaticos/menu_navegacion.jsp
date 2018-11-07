<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<ol class="col-lg-12" role="group">
    <li>
        <%
            Menu clsMenu = new Menu();
            List<List<String>> listaSize, listaMenu;
            listaSize = clsMenu.obtenerListaMenu();

            String pagina_activa = (String) request.getParameter("seleccionado");

            for (int i = 0; i < listaSize.get(0).size(); i++) {
                listaMenu = clsMenu.obtenerMenu(Integer.parseInt(listaSize.get(0).get(i)));

                if (Integer.parseInt(listaSize.get(1).get(i)) == 0) {
                    out.println(listaSize.get(2).get(i));
                }               

                for (int j = 0; j < listaMenu.get(0).size(); j++) {
                    out.println("<ul>");
                    if (Integer.parseInt(listaMenu.get(1).get(j)) != 0 && Integer.parseInt(listaSize.get(0).get(i)) == Integer.parseInt(listaMenu.get(1).get(j))) {
                        out.println("<li><a href='"+request.getContextPath() + listaMenu.get(3).get(j)+".jsp?seleccionado="+listaMenu.get(1).get(j)+"'>" + listaMenu.get(2).get(j) + "</a></li>");
                    }
                    out.println("</ul>");
                }

                
            }
        %>
    </li>
</ol>

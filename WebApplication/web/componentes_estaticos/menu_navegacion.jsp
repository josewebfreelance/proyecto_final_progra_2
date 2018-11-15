<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>
<%@page import="modelo.Menu"%>
<%
    Menu clsMenu = new Menu();
    out.println("<script> menus = " + clsMenu.obtenerMenu() + "; obtenerMenu(menus);</script>");
%>
<div class="header-menu">
    <h4>SISAD</h4>  
</div>
<ol class="col-lg-12 menu-dinamico" role="group">
    <li>
    </li>
</ol>

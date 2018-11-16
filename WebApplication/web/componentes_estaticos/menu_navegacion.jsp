<%-- 
    Document   : menu_navegacion
    Created on : 28/10/2018, 11:50:31 PM
    Author     : jlemus
--%>
<%@page import="modelo.Menu"%>
<% Menu clsMenu = new Menu(); %>
<div class="header-menu">
    <h4>SISAD</h4>
</div>
<div class="col-lg-12 menu-dinamico" role="group">
</div>
<script>
    menus = <%= clsMenu.obtenerMenu() %>
    menuDinamico = document.querySelector(".menu-dinamico");
    obtenerMenu();
</script>
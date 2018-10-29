<%-- 
    Document   : ventas
    Created on : 28/10/2018, 10:42:45 PM
    Author     : jlemus
--%>
<%
    if (session.getAttribute("usr").equals("")) {
        response.sendRedirect("/proyecto_final_progra_2/");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../componentes_estaticos/encabezado_pagina.jsp" %>
    </head>
    <body>
        <%@include file="../componentes_estaticos/barra_navegacion.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2">
                    <%@include file="../componentes_estaticos/menu_navegacion.jsp" %>
                </div>
                <div class="col-lg-10">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <th>No. factura</th>
                            <th>Serie</th>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Empleado</th>
                            <th>Fecha ingreso</th>
                            </thead>
                            <tbody id="tbl_estudiante">
                                <tr><td>1</td></tr>
                            </tbody>
                        </table>
                    </div>                
                </div>           
            </div>
    </body>
</html>

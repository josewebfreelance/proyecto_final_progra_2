<%-- 
    Document   : ventas
    Created on : 28/10/2018, 10:42:45 PM
    Author     : jlemus
--%>
<%@page import="modelo.Ventas"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
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
                                <%  
                                    Ventas clsVentas  = new Ventas();
                                    DefaultTableModel tblModelo = new DefaultTableModel();
                                    tblModelo = clsVentas.llenarTabla();
                                    for (int a = 0; a < tblModelo.getRowCount(); a++) {
                                        out.println("<tr data-idestudiante=" + tblModelo.getValueAt(a, 0).toString() + " data-idts=" + tblModelo.getValueAt(a, 0).toString() + " >");
                                        out.println("<td>" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 2).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                                        out.println("</tr>");
                                    }

                                %>
                            </tbody>
                        </table>
                    </div>                
                </div>           
            </div>
    </body>
</html>

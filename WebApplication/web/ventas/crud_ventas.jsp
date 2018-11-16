<%-- 
    Document   : crud_ventas
    Created on : 7/11/2018, 08:49:09 AM
    Author     : jlemusus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.VentasDetalle"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Ventas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean nuevo = Boolean.parseBoolean(request.getParameter("nuevo"));
    boolean edicion = Boolean.parseBoolean(request.getParameter("edicion"));

    int idVentaEdicion = Integer.parseInt(request.getParameter("venta"));

    Ventas clsVentas = new Ventas();
    VentasDetalle clsVentasDetalle = new VentasDetalle();
    int idVenta = 0;

    String filtroUltima = "ORDER BY idVenta DESC LIMIT 0,1";
    String filtroEdicion = "where idVenta = " + idVentaEdicion;

    List<List<String>> ultimaVenta = clsVentas.obtenerVenta(filtroUltima);
    List<List<String>> edicionVenta = clsVentas.obtenerVenta(filtroEdicion);

    if (nuevo == true && idVentaEdicion != 0) {
        for (int i = 0; i < ultimaVenta.get(0).size(); i++) {
            idVenta = Integer.parseInt(ultimaVenta.get(0).get(i));

        }
    }

    if (edicion == true) {
        idVenta = idVentaEdicion;
    }

%>
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
                    <div class="vivify fadeIn">
                        <h1>
                            <%
                                if (nuevo == true && idVentaEdicion == 0) {
                                    out.println("Venta nueva");
                                }
                                if (edicion == true && idVentaEdicion != 0) {
                                    out.println("Edici&oacute;n de venta");
                                }
                            %>
                        </h1>
                        <form action="sr_ventas" method="post" class="well">

                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <label for="txt_factura">Factura</label>
                                    <input type="text" class="form-control" id="txt_factura" name="txt_factura" placeholder="factura" required>                                                
                                </div>
                                <div class="form-group col-lg-3">
                                    <label for="txt_serie">Serie</label>
                                    <input type="text" class="form-control" id="txt_serie" name="txt_serie" value="" placeholder="serie" required>                                                
                                </div>
                                <div class="form-group col-lg-offset-3 col-lg-3">
                                    <label for="txt_fecha_factura">Fecha</label>
                                    <input type="date" class="form-control" id="txt_fecha_factura" name="txt_fecha_factura" value="" placeholder="Fecha factura" required>                                                
                                </div>                                           
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <select id="txt_id_cliente" name="txt_id_cliente" class="form-control"  >
                                        <%                                        List<List<String>> cliente = clsVentasDetalle.selectGenerico("SELECT idCliente, nombres, apellidos FROM dbempresa.clientes", "idCliente", "nombres", "apellidos");

                                            for (int i = 0; i < cliente.get(0).size(); i++) {
                                                out.println("<option value='" + cliente.get(0).get(i) + "'>" + cliente.get(1).get(i) + " " + cliente.get(2).get(i) + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-lg-3">
                                    <select id="txt_id_empleado" name="txt_id_empleado" class="form-control"  >
                                        <%
                                            List<List<String>> empleado = clsVentasDetalle.selectGenerico("SELECT idEmpleado, nombres FROM dbempresa.empleados", "idEmpleado", "nombres", "");

                                            for (int i = 0; i < empleado.get(0).size(); i++) {
                                                out.println("<option value='" + empleado.get(0).get(i) + "'>" + empleado.get(1).get(i) + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-lg-3">
                                    <input onchange="this.form.submit()" type="date" class="form-control" id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" placeholder="Fecha ingreso" required>                                               
                                </div>
                            </div>
                        </form>

                        <table class="table" id="tableDetalleVenta">
                            <thead>
                            <th></th>
                            <th hidden="hidden"></th>
                            <th hidden="hidden">idVenta</th>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio unitario</th>
                            </thead>
                            <tbody>
                                <%
                                    if ((nuevo == true && idVentaEdicion != 0) || edicion == true) {
                                        DefaultTableModel tblModelo = new DefaultTableModel();
                                        tblModelo = clsVentasDetalle.llenarDetalleVenta(idVenta);

                                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                                            out.println("<tr>");
                                            out.println("<td>" + (a + 1) + "</td>");
                                            out.println("<td hidden=\"hidden\"><input type=\"number\" name=\"txt_id_venta_detalle\" value=\"" + tblModelo.getValueAt(a, 0).toString() + "\"></td>");
                                            out.println("<td hidden=\"hidden\"><input type=\"number\" name=\"txt_id_venta\" value=\"" + tblModelo.getValueAt(a, 1).toString() + "\"></td>");
                                            /*out.println("<td><select id=\"txt_idproducto\" name=\"txt_idproducto\" class=\"form-control\">");
                                                List<List<String>> producto = clsVentasDetalle.selectGenerico("SELECT idProducto, producto FROM dbempresa.productos", "idProducto", "producto");
                                                for (int i = 0; i < producto.get(0).size(); i++) {
                                                    out.println("<option value='" + producto.get(0).get(i) + "'>" + producto.get(1).get(i) + "</option>");
                                                }
                                            out.println("</select></td>");*/
                                            out.println("<td><input class=\"form-control\" type=\"number\" name=\"txt_id_producto\" value=\"" + tblModelo.getValueAt(a, 2).toString() + "\"></td>");
                                            out.println("<td><input class=\"form-control\" type=\"number\" name=\"txt_cantidad\" value=\"" + tblModelo.getValueAt(a, 3).toString() + "\"></td>");
                                            out.println("<td><input class=\"form-control\" type=\"number\" name=\"txt_precio_unitario\" value=\"" + tblModelo.getValueAt(a, 4).toString() + "\"></td>");
                                            out.println("</tr>");

                                            // out.println("<script>obtenerProductoId('" + tblModelo.getValueAt(a, 2).toString() + "');</script>");
                                        }
                                    }

                                %>
                            <form method="post" action="sr_ventas_detalle">

                                <tr>
                                    <td></td>
                                    <td hidden="hidden"><input class="form-control" type="number" name="txt_iddetalle"></td>
                                    <td hidden="hidden"><input type="hidden" id="txt_idventa" name="txt_idventa" ></td>
                                    <td>
                                        <select id="txt_idproducto" name="txt_idproducto" class="form-control" autofocus>
                                            <%                                            List<List<String>> producto = clsVentasDetalle.selectGenerico("SELECT idProducto, producto FROM dbempresa.productos", "idProducto", "producto", "");
                                                for (int i = 0; i < producto.get(0).size(); i++) {
                                                    out.println("<option value='" + producto.get(0).get(i) + "'>" + producto.get(1).get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td><input class="form-control" name="txt_cantidad" type="number" placeholder="Cantidad"></td>
                                    <td><input onchange="this.form.submit()" class="form-control" name="txt_precio" type="number" placeholder="Precio"></td>
                                </tr>
                            </form>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <%
            if (nuevo == true && idVentaEdicion == 0) {
                out.println("<script>fechaDefault(\"#txt_fecha_factura\");</script>");
                out.println("<script>generarFactura(\"#txt_factura\", \"" + (clsVentas.obtenerUltimoId() + 1) + "\");</script>");
                out.println("<script>generarSerieFactura(\"#txt_serie\");</script>");
            }

            if (nuevo == true && idVentaEdicion != 0) {
                for (int i = 0; i < ultimaVenta.get(0).size(); i++) {

                    out.println("<script>obtenerValoresVenta('" + ultimaVenta.get(0).get(i) + "',"
                            + "'" + ultimaVenta.get(1).get(i) + "',"
                            + "'" + ultimaVenta.get(2).get(i) + "',"
                            + "'" + ultimaVenta.get(3).get(i) + "',"
                            + "'" + ultimaVenta.get(4).get(i) + "',"
                            + "'" + ultimaVenta.get(5).get(i) + "',"
                            + "'" + ultimaVenta.get(6).get(i) + "');</script>");
                }
            }
            if (edicion == true) {

                for (int i = 0; i < edicionVenta.get(0).size(); i++) {

                    out.println("<script>obtenerValoresVenta('" + edicionVenta.get(0).get(i) + "',"
                            + "'" + edicionVenta.get(1).get(i) + "',"
                            + "'" + edicionVenta.get(2).get(i) + "',"
                            + "'" + edicionVenta.get(3).get(i) + "',"
                            + "'" + edicionVenta.get(4).get(i) + "',"
                            + "'" + edicionVenta.get(5).get(i) + "',"
                            + "'" + edicionVenta.get(6).get(i) + "');</script>");
                }
            }

        %>

    </body>
</html>

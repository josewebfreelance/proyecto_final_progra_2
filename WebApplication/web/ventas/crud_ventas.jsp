<%-- 
    Document   : crud_ventas
    Created on : 7/11/2018, 08:49:09 AM
    Author     : jlemusus
--%>

<%@page import="modelo.VentasDetalle"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Ventas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean enCurso = Boolean.parseBoolean(request.getParameter("enCurso"));
    Ventas clsVentas = new Ventas();
    VentasDetalle clsVentasDetalle = new VentasDetalle();
    int idVenta = 0;

    List<List<String>> ultimaVenta = clsVentas.obtenerUltimaVenta();

    for (int i = 0; i < ultimaVenta.get(0).size(); i++) {
        idVenta = Integer.parseInt(ultimaVenta.get(0).get(i));
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
                    <form action="sr_ventas" method="post" >

                        <div class="row">
                            <div class="form-group col-lg-3">
                                <input type="text" class="form-control" id="txt_factura" name="txt_factura" placeholder="factura" required>                                                
                            </div>
                            <div class="form-group col-lg-3">
                                <input type="text" class="form-control" id="txt_serie" name="txt_serie" value="" placeholder="serie" required>                                                
                            </div>
                            <div class="form-group col-lg-offset-3 col-lg-3">
                                <input type="date" class="form-control" id="txt_fecha_factura" name="txt_fecha_factura" value="" placeholder="Fecha factura" required>                                                
                            </div>                                           
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-2">
                                <select id="txt_id_cliente" name="txt_id_cliente" class="form-control"  >
                                    <%                                        List<List<String>> cliente = clsVentasDetalle.selectGenerico("SELECT idCliente, nombres FROM dbempresa.clientes", "idCliente", "nombres");

                                        for (int i = 0; i < cliente.get(0).size(); i++) {
                                            out.println("<option value='" + cliente.get(0).get(i) + "'>" + cliente.get(1).get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <select id="txt_id_empleado" name="txt_id_empleado" class="form-control"  >
                                    <%
                                        List<List<String>> empleado = clsVentasDetalle.selectGenerico("SELECT idEmpleado, nombres FROM dbempresa.empleados", "idEmpleado", "nombres");

                                        for (int i = 0; i < empleado.get(0).size(); i++) {
                                            out.println("<option value='" + empleado.get(0).get(i) + "'>" + empleado.get(1).get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <input onchange="this.form.submit()" type="date" class="form-control" id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" placeholder="Fecha ingreso" required>                                               
                            </div>
                        </div>

                        <!--<div class="modal-footer">
                            <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info" >
                            <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                            <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if (!confirm("¿Desea Eliminar?"))
                                   return false" class="btn btn-danger btn-lg" >
                                   <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>-->

                    </form>

                    <h3>Detalle</h3>
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
                                if (enCurso == true) {
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
                                    <select id="txt_idproducto" name="txt_idproducto" class="form-control"  >
                                        <%                                            List<List<String>> producto = clsVentasDetalle.selectGenerico("SELECT idProducto, producto FROM dbempresa.productos", "idProducto", "producto");
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

        <%            if (enCurso == true) {
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
        %>

    </body>
</html>

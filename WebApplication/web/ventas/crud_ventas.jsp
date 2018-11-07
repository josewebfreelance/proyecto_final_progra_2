<%-- 
    Document   : crud_ventas
    Created on : 7/11/2018, 08:49:09 AM
    Author     : jlemusus
--%>

<%@page import="modelo.Ventas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Ventas clsVentas = new Ventas();
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
                    <form action="sr_ventas" class="form-horizontal" method="post" >                            

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
                                <input type="text" class="form-control" id="txt_id_cliente" name="txt_id_cliente" value="" placeholder="cliente">                                                
                            </div>
                            <div class="form-group col-lg-2">
                                <input type="text" class="form-control" id="txt_id_empleado" name="txt_id_empleado" value="" placeholder="empleado" required>                                                
                            </div>
                            <div class="form-group col-lg-2">
                                <input type="date" class="form-control" id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" placeholder="Fecha ingreso" required>                                               
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                            <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                            <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if (!confirm("¿Desea Eliminar?"))
                                   return false" class="btn btn-danger btn-lg" >
                                   <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>

                        <table class="table" id="tableDetalleVenta">
                            <thead>
                            <th hidden="hidden">idDetalle</th>
                            <th hidden="hidden">idVenta</th>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio unitario</th>
                            <th></th>
                            </thead>
                            <tbody>
                                <tr id="1">
                                    <td hidden="hidden"></td>
                                    <td></td>
                                    <td>
                                        <select class="form-control" name="producto1">
                                            <option value="1">producto 1</option>
                                            <option>producto 2</option>
                                        </select>
                                    </td>
                                    <td><input class="form-control" name="cantidad1" type="number" placeholder="Cantidad"></td>
                                    <td><input class="form-control" name="precio1" type="number" placeholder="Precio"></td>
                                    <td>
                                        <button type="button" class="btn btn-primary" onclick="agregarDetalleVenta(1);" >Nuevo</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function agregarDetalleVenta(id, domElement) {
            let tbodyDetalleVenta = document.getElementById("tableDetalleVenta");
            idNuevoDetalle += id;
            const rowM = tbodyDetalleVenta.insertRow(tbodyDetalleVenta.rows.length);
            const cell1 = rowM.insertCell(0);
            const cell2 = rowM.insertCell(1);
            const cell3 = rowM.insertCell(2);
            cell1.innerHTML = "<select class=\"form-control\" name=\"producto" + idNuevoDetalle + "\"><option value=\"1\">producto 1</option><option>producto 2</option></select>";
            cell2.innerHTML = "<input class=\"form-control\" name=\"cantidad" + idNuevoDetalle + "\" type=\"number\" placeholder=\"Cantidad\">";
            cell3.innerHTML = "<input class=\"form-control\" name=\"precio" + idNuevoDetalle + "\" type=\"number\" placeholder=\"Precio\">";
            }
        </script>
    </body>
</html>

<%-- 
    Document   : crud_ventas
    Created on : 7/11/2018, 08:49:09 AM
    Author     : jlemusus
--%>

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
                    <form action="sr_ventas" class="form-horizontal" method="post" >                            
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3 class="modal-title">Venta</h3>
                            </div>
                            <div class="modal-body">
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
                            </div>
                            <div class="modal-footer">
                                <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                                <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                                <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false" class="btn btn-danger btn-lg" >
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>

                        <table>
                            <thead>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio unitario</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select>
                                            <option>producto 1</option>
                                            <option>producto 2</option>
                                        </select>
                                    </td>
                                    <td><input type="number" placeholder="Cantidad"></td>
                                    <td><input type="number" placeholder="Precio"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

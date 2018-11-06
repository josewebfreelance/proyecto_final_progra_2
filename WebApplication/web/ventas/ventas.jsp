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

                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_venta">Nuevo</button>

                    <div id="modal_venta" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <form action="sr_ventas" class="form-horizontal" method="post" >                            
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h3 class="modal-title">Venta</h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="form-group col-lg-2">
                                                <input type="text" class="form-control"  id="txt_id" name="txt_id" value="0" placeholder="id" readonly>                                                    
                                            </div>
                                        </div>
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
                            </form>

                        </div>
                    </div>

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
                                <%                                    Ventas clsVentas = new Ventas();
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
        </div>

        <!--<script type="text/javascript">
            $('#tbl_empleado').on('click', 'tr td', function (evt) {
                var target, idEmpleados, idts, Nombres, Apellidos, Direccion, Telefono, DPI, Genero, FechaNacimiento, Puesto, Inicio_lab;


                target = $(event.target);
                idEmpleados = target.parent().data('id');
                idts = target.parent().data('idpu');
                Nombres = target.parents("tr").find("td").eq(1).html();
                Apellidos = target.parents("tr").find("td").eq(2).html();
                Direccion = target.parents("tr").find("td").eq(3).html();
                Telefono = target.parents("tr").find("td").eq(4).html();
                DPI = target.parents("tr").find("td").eq(5).html();
                Genero = target.parents("tr").find("td").eq(6).html();
                FechaNacimiento = target.parents("tr").find("td").eq(7).html();
                // Puesto = target.parents("tr").find("td").eq(11).html();
                Inicio_lab = target.parents("tr").find("td").eq(9).html();

                $("#txtId").val(idEmpleados);
                $("#txtNombres").val(Nombres);
                $("#txtApellidos").val(Apellidos);
                $("#txtDireccion").val(Direccion);
                $("#txtTelefono").val(Telefono);
                $("#txtDpi").val(DPI);
                $("#rBGenero").val(Genero);
                $("#txtFNacimiento").attr("value", FechaNacimiento);
                $("#droppuesto").val(idts);
                $("#txtFILab").val(Inicio_lab);
                $('#modal_empleado').modal('show');
            });

        </script>-->

    </body>
</html>

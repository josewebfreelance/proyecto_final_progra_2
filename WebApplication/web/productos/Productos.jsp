
<%
    if (session.getAttribute("usr").equals("")) {
        response.sendRedirect("/proyecto_final_progra_2/");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Productos"%>
<jsp:directive.page import="modelo.Productos"></jsp:directive.page>
<jsp:directive.page import="java.util.List"></jsp:directive.page>
<jsp:directive.page import="java.util.ArrayList"></jsp:directive.page>
<jsp:directive.page import="javax.swing.table.DefaultTableModel"></jsp:directive.page>
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
                <div class="col-lg-9 vivify fadeIn delay-100"> 
                    <button type="button" class="btn btn-nuevo-registro vivify popInBottom delay-200" data-toggle="modal" data-target="#modal_productos">Nuevo Producto</button>

                    <!-- Modal -->
                    <div id="modal_productos" class="modal fade" role="dialog">  <!--ACTION ON CLICK VENTANA EMERGENTE--!>
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <form id="frmProductos" class="form-horizontal" action="ProductosServlet" method="post" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title">Datos del Producto</h3>
                                </div>
                                <div class="modal-body">    
                                    <!-- <form action="ProductosServlet" class="form-horizontal" method="post" >!-->
                                    <div class="form-group">
                                        <input type="number" class="form-control"  id="txt_id" name="txt_id" placeholder="id" readonly>    
                                        <input type="text" class="form-control"  id="txt_producto" name="txt_producto" placeholder="Productos" required>
                                        <select id="txt_idmarca" name="txt_idmarca" class="form-control" required>
                                            <%
                                                Productos clsProductos = new Productos();
                                                List<List<String>> lista = clsProductos.listaTipoMarca();

                                                for (int i = 0; i < lista.get(0).size(); i++) {
                                                    out.println("<option value='" + lista.get(0).get(i) + "'>" + lista.get(1).get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                        <input type="text" class="form-control" id="txt_descripcion" name="txt_descripcion" value="" placeholder="Descripcion">
                                        <input type="file" class="form-control" id="imagen1" name="imagen1" placeholder="Imagen">
                                        <input type="number" class="form-control" id="txt_precio_costo" name="txt_precio_costo" value="" placeholder="Precio Costo">
                                        <input type="number" class="form-control" id="txt_precio_venta" name="txt_precio_venta" value="" placeholder="Precio Venta" required>
                                        <input type="number" class="form-control" id="txt_existencia" name="txt_existencia" value="" placeholder="Existencia" required>
                                        <input type="date" class="form-control"  id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" placeholder="Fecha Ingreso" required>
                                        <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                                        <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                                        <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false" class="btn btn-danger btn-lg" >




                                    </div>

                                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-dismiss="modal" data-target="#modal_marcas" onclick="window.open('/WebApplication1/Marcas/Marcas.jsp')">Nueva Marca</button>

                                </div>
                            </form>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>

                    </div>
                </div> 
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <th>Producto</th>
                        <th>Marca</th>
                        <th>Descripcion</th>
                        <th>Imagen</th>
                        <th>Precio Costo</th>
                        <th>Precio Venta</th>
                        <th>Existencia</th>
                        <th>Fecha Ingreso</th>
                        </thead>
                        <tbody id="tbl_productos">
                            <%
                                DefaultTableModel tblModelo = new DefaultTableModel();
                                tblModelo = clsProductos.llenarProductos();
                                for (int a = 0; a < tblModelo.getRowCount(); a++) {
                                    out.println("<tr data-id=" + tblModelo.getValueAt(a, 0).toString() + " data-idtm=" + tblModelo.getValueAt(a, 2).toString() + " >");
                                    out.println("<td>" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 9).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 4) + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 7).toString() + "</td>");
                                    out.println("<td>" + tblModelo.getValueAt(a, 8).toString() + "</td>");
                                    out.println("</tr>");
                                }

                            %>

                        </tbody>
                    </table>

                </div>

                <script type="text/javascript">
                    $('#tbl_productos').on('click', 'tr td', function (event) {
                        var target, id, idMarca, producto, marca, Descripcion, Imagen, precio_costo, precio_venta, existencia, fecha_ingreso;

                        target = $(event.target);
                        id = target.parent().data('id');
                        idMarca = target.parent().data('idtm');
                        producto = target.parents("tr").find("td").eq(0).html();
                        marca = target.parents("tr").find("td").eq(1).html();
                        Descripcion = target.parents("tr").find("td").eq(2).html();
                        Imagen = target.parents("tr").find("td").eq(3).html();
                        precio_costo = target.parents("tr").find("td").eq(4).html();
                        precio_venta = target.parents("tr").find("td").eq(5).html();
                        existencia = target.parents("tr").find("td").eq(6).html();
                        fecha_ingreso = target.parents("tr").find("td").eq(7).html();

                        $("#txt_id").val(id);
                        $("#txt_producto").val(producto);
                        //$("#txt_idmarca").attr('selected','selected'); 
                        $("#txt_idmarca").val(idMarca);
                        $("#txt_descripcion").val(Descripcion);
                        $("#txt_imagen").val(Imagen);
                        $("#txt_precio_costo").val(precio_costo);
                        $("#txt_precio_venta").val(precio_venta);
                        $("#txt_existencia").val(existencia);
                        $("#txt_fecha_ingreso").val(fecha_ingreso);
                        $('#modal_productos').modal('show');

                        $('#modal_productos').on('hidden.bs.modal', function () {
                            $(this).find("input:not([type=submit]), select").val('').end();
                        });

                    });
                </script>   
            </div>
        </div>

    </body>


</html>

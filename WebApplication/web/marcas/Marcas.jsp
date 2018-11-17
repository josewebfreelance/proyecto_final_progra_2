<%
    if (session.getAttribute("usr").equals("")) {
        response.sendRedirect("/proyecto_final_progra_2/");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Marcas"%>
<jsp:directive.page import="modelo.Marcas"></jsp:directive.page>
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
                    <button type="button" class="btn btn-nuevo-registro vivify popInBottom delay-200" data-toggle="modal" data-target="#modal_marcas">+</button>

                    <!--------------------------------- Modal Marcas--------------------------------->

                    <div id="modal_marcas" class="modal fade" role="dialog"> 
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <form id="frmMarcas" class="form-horizontal" action="${pageContext.request.contextPath}/MarcasServlet" method="post">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h3 class="modal-title">Datos de la marca</h3>
                                    </div>
                                    <div class="modal-body">    
                                        <!-- <form action="MarcasServlet" class="form-horizontal" method="post" >!-->
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="txt_idmarca1" name="txt_idmarca1" value="" placeholder="IdMarca" readonly>
                                            <input type="text" class="form-control" id="txt_marcas" name="txt_marcas" value="" placeholder="Marcas" required>
                                            <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                                            <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                                            <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false" class="btn btn-danger btn-lg" >

                                        </div>
                                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-dismiss="modal" data-target="#modal_productos" onclick="opener.top.location.reload();window.close()">Nuevo Producto</button>

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
                            <th>Marcas</th>
                            </thead>
                            <tbody id="tbl_marcas">
                                <%
                                    DefaultTableModel tblModelo1 = new DefaultTableModel();
                                    Marcas clsMarcas = new Marcas();

                                    tblModelo1 = clsMarcas.llenarMarcas();

                                    for (int a = 0; a < tblModelo1.getRowCount(); a++) {
                                        out.println("<tr data-idtm=" + tblModelo1.getValueAt(a, 0).toString() + " >");
                                        out.println("<td>" + tblModelo1.getValueAt(a, 1).toString() + "</td>");
                                        out.println("</tr>");
                                    }

                                %>

                            </tbody>
                        </table>

                    </div>

                    <script type="text/javascript">
                        $('#tbl_marcas').on('click', 'tr td', function (event) {
                            var target, idmarca, marca;

                            target = $(event.target);
                            idmarca = target.parent().data('idtm');
                            /*idmarca = target.parents("tr").find("td").eq(0).html();*/
                            marca = target.parents("tr").find("td").eq(0).html();
                            $("#txt_idmarca1").val(idmarca);
                            $("#txt_marcas").val(marca);
                            $('#modal_marcas').modal('show');

                            $('#modal_marcas').on('hidden.bs.modal', function () {
                                $(this).find("input:not([type=submit]), select").val('').end();
                            });

                        });
                    </script>
                    <!-- fin Modal Marcas-->
                </div>
            </div>
        </div>

    </body>


</html>

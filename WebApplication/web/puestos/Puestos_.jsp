<%-- 
    Document   : index
    Created on : Oct 15, 2018, 22:00 PM
    Author     : Giordy Perez
--%>
<%
    if (session.getAttribute("usr").equals("")) {
        response.sendRedirect("/proyecto_final_progra_2/");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="modelo.Puestos"></jsp:directive.page>
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
                <div class="col-lg-10">                  


                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_puesto">Nuevo</button>
                    <button type="button" class="btn btn-info btn-lg" id="btnReg" onclick="opener.top.location.reload();window.close()" name="btnReg" data-toggle="modal"  >Regresar</button>
                    <!-- Modal -->
                    <div id="modal_puesto" class="modal fade" role="modal">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title">Datos de los Puestos</h3>
                                </div>
                                <div class="modal-body">    
                                    <form action="Servlet_puesto" class="form-horizontal" method="post" >
                                        <div class="form-group">
                                            <input type="text" class="form-control"  id="txtId1" name="txtId1" value="0" placeholder="id" readonly>    
                                            <input type="text" class="form-control" id="txtPuesto1" name="txtPuesto1" value="" placeholder="Puesto" required>
                                            <input type="submit" id="btnAgregar1" name="btnAgregar1" value="Agregar" class="btn btn-info btn-lg" >
                                            <input type="submit" id="btnModificar" name="btnModificar1" value="Modificar" class="btn btn-primary  btn-lg" >
                                            <input type="submit" id="btnEliminar" name ="btnEliminar1" value="Eliminar"
                                                   onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                               return false" class="btn btn-danger btn-lg" >
                                        </div>
                                    </form>



                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>

                        </div>
                    </div> 
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <th>Id</th>
                            <th>Puesto</th>

                            </thead>
                            <tbody id="tbl_puesto">
                                <%                        //Estudiante clsEstudiante2  = new Estudiante();
                                    DefaultTableModel tblModelo2 = new DefaultTableModel();
                                    Puestos clsPuestos1 = new Puestos();
                                    tblModelo2 = clsPuestos1.llenarPuestos();
                                    for (int a = 0; a < tblModelo2.getRowCount(); a++) {
                                        out.println("<td>" + tblModelo2.getValueAt(a, 0).toString() + "</td>");
                                        out.println("<td>" + tblModelo2.getValueAt(a, 1).toString() + "</td>");
                                        out.println("</tr>");
                                    }
                                %>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('#tbl_puesto').on('click', 'tr td', function (evt) {
                var target, id, Puesto;


                target = $(event.target);
                id = target.parents("tr").find("td").eq(0).html();
                Puesto = target.parents("tr").find("td").eq(1).html();


                $("#txtId1").val(id);
                $("#txtPuesto1").val(Puesto);
                $('#modal_puesto').modal('show');


            });
        </script>

    </body>
</html>

<%-- 
    Document   : Empleados
    Created on : Oct 15, 2018, 22:00 PM
    Author     : Giordy Perez
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="modelo.Puestos"></jsp:directive.page>
<jsp:directive.page import="java.util.List"></jsp:directive.page>
<jsp:directive.page import="java.util.ArrayList"></jsp:directive.page>
<jsp:directive.page import="javax.swing.table.DefaultTableModel"></jsp:directive.page>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Empleados</title>
        <link rel="stylesheet" href="../assets/bootstrap/Bootstrap v3.3.7/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/bootstrap/Bootstrap v3.3.7/css/bootstrap-theme.min.css">
        
        <script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.js"></script>
                        
    </head>
    <body>
        <header>
        
         <nav class="navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Navegador</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Giordy</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Incio</a></li>
            <li><a href="#">Nosotros</a></li>
            <li><a href="#contact">Contacto</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sub Menu <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Item 1</a></li>
                <li><a href="#">Item 2</a></li>
                <li><a href="#">Item 3</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          <li><a href="#Exit">Ubicacion</a></li>
          </ul>
            <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Iniciar</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Cerrar</a></li>
    </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    </header>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado">Nuevo</button>
    <!-- Modal -->
    
    
<div id="modal_empleado" class="modal fade" role="dialog">
  <div class="modal-dialog dialog-md">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title">Datos del Empleado</h3>
      </div>
      <div class="modal-body">    
        <form action="Servlet_empl" class="form-horizontal" method="post" >
                <div class="form-group">
                        <input type="text" class="form-control"  id="txtId" name="txtid" value="0" placeholder="id" readonly>    
                        <input type="text" class="form-control" id="txtNombres" name="txtNombres" placeholder="Nombres" required>
                        <input type="text" class="form-control" id="txtApellidos" name="txtApellidos" value="" placeholder="Apellidos" required>
                        <input type="text" class="form-control" id="txtDireccion" name="txtDireccion" value="" placeholder="Direccion" required>
                        <input type="number" class="form-control" id="txtTelefono" name="txtTelefono" value="" placeholder="Telefono">
                        <input type="text" class="form-control" id="txtDpi" name="txtDpi" value="" placeholder="DPI" required>
                        <p>Genéro</p>
                        <input type="radio" id="rBGenero" name="rBGenero" value="0"> Masculino<br>
                        <input type="radio" id="rBGenero" name="rBGenero" value="1" > Femenino<br>
                        </p>
                        <p>Fecha Nacimiento:</p>
                        <input type="date" class="form-control"  id="txtFNacimiento" name="txtFNacimiento" value="" placeholder="Fecha Nacimiento" required></p>
                        <p>Puesto</p>
                        <select id="droppuesto" name="droppuesto" class="form-control"  >
                            
                        <%
                            Puestos clsPuestos  = new Puestos();
                            List<List<String>> lista = clsPuestos.listaPuestos();
                            
                            for(int i=0;i< lista.get(0).size() ;i++){
                               out.println("<option value='" +lista.get(0).get(i) +"'>" +lista.get(1).get(i) +"</option>");
                            }   
                        %>
                        </select></p>
                        <p>Inicio de Labores:</p>
                        <input type="date" class="form-control"  id="txtFILab" name="txtFILab" value="" placeholder="Inicio Labores" required>
                        <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                        <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                        <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" class="btn btn-danger btn-lg" >
                        <input type="submit" id="btnAdd" name="btnAdd" value="Añadir Nuevo Puesto" class="btn btn-info btn-lg" onclick="window.open('/proyecto_empresa/puestos/Puestos_.jsp')" >
                                     
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
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>DPI</th>
                                <th>Genero</th>
                                <th>FechaNacimiento</th>
                                <th>Id P.</th>
                                <th>Fecha Inicio Labores</th>
                                <th>Fecha Ingreso</th>
                                <th>Puesto</th>
                            </thead>
                            <tbody id="tbl_empleado">
                            <% 
                                DefaultTableModel tblModelo1= new DefaultTableModel();
                               tblModelo1 =clsPuestos.llenarEmpleado();
                                          for(int a=0;a< tblModelo1.getRowCount();a++){
                                out.println("<tr data-id="+ tblModelo1.getValueAt(a,0).toString()  +" data-idpu="+ tblModelo1.getValueAt(a,9).toString()  +" >");
                                out.println("<td>" + tblModelo1.getValueAt(a,1).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,2).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,3).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,4).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,5).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,6).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,7).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,8).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,9).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,10).toString()  + "</td>");
                                out.println("<td>" + tblModelo1.getValueAt(a,11).toString()  + "</td>");
                                out.println("</tr>");
                                          }
       
                                        %>
                            
                                        </tbody>
    </table>
                                        
         </div>
   <script type="text/javascript">   
$('#tbl_empleado').on('click','tr td', function(evt){
   var target,idEmpleados,idts,Nombres,Apellidos,Direccion,Telefono,DPI,Genero,FechaNacimiento,Puesto,Inicio_lab;
 
   
   target = $(event.target);
   idEmpleados = target.parent().data('id');
   idts= target.parent().data('idpu');
   Nombres= target.parents("tr").find("td").eq(0).html();
   Apellidos= target.parents("tr").find("td").eq(1).html();
   Direccion= target.parents("tr").find("td").eq(2).html();
   Telefono= target.parents("tr").find("td").eq(3).html();
   DPI= target.parents("tr").find("td").eq(4).html();
   Genero= target.parents("tr").find("td").eq(5).html();
   FechaNacimiento= target.parents("tr").find("td").eq(6).html();
   Puesto= target.parents("tr").find("td").eq(7).html();
   Inicio_lab= target.parents("tr").find("td").eq(8).html();
   
   $("#txtId").val(idEmpleados);
   $("#txtNombres").val(Nombres);
   $("#txtApellidos").val(Apellidos);
   $("#txtDireccion").val(Direccion);
   $("#txtTelefono").val(Telefono);
   $("#txtDpi").val(DPI);
   $("#rBGenero").val(Genero);
   $("#txtFNacimiento").attr("value",FechaNacimiento);
   $("#droppuesto").val(Puesto);
   $("#txtFILab").val(Inicio_lab);
   $('#modal_empleado').modal('show');
});

</script>        
    </body>
    <footer>
        <nav class="navbar navbar-inverse">
        <div class="container">
        <div class="navbar-header">    
                <p class="navbar-brand">Desarollo Web: Giordy Estuardo Perez</p>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    </footer>
</html>

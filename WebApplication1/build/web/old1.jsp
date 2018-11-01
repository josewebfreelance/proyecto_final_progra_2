<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.page import="modelo.Estudiante"></jsp:directive.page>
<jsp:directive.page import="java.util.List"></jsp:directive.page>
<jsp:directive.page import="java.util.ArrayList"></jsp:directive.page>
<jsp:directive.page import="javax.swing.table.DefaultTableModel"></jsp:directive.page>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto Final</title>
                        <Link href="./boostrap/css/bootstrap.css" rel="stylesheet" type="text/css">
                        <Link href="./boostrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
                        <script src="./boostrap/js/jquery-3.2.1.min.js" ></script>
                        <script src="./boostrap/js/bootstrap.js" ></script>
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
          <a class="navbar-brand" href="#">Carlos Rosales</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Incio</a></li>
            <li><a href="#">Nosotros</a></li>
            <li><a href="#contact">Contacto</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sub Menu <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Consulta</a></li>
                <li><a href="#">Graficas</a></li>
                
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
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_productos">Nuevo</button>
    <!-- Modal -->
<div id="modal_productos" class="modal fade" role="dialog">  <!--ACTION ON CLICK VENTANA EMERGENTE--!>
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title">Datos del Producto</h3>
      </div>
      <div class="modal-body">    
        <form action="ProductoServlet" class="form-horizontal" method="post" >
                <div class="form-group">
                        <input type="text" class="form-control"  id="txt_id" name="txt_id" value="0" placeholder="id" readonly>    
                        <input type="text" class="form-control"  id="txt_producto" name="txt_producto" placeholder="Productos" pattern="[E,e]{1}[0-9]{3}" required>
                        <input type="text" class="form-control" id="txt_idmarca" name="txt_idmarca" placeholder="Nombres" required>
                        <%
                            Productos clsProductos  = new Productos();
                            List<List<String>> lista = clsProductos.lis();
                            
                            for(int i=0;i< lista.get(0).size() ;i++){
                               out.println("<option value='" +lista.get(0).get(i) +"'>" +lista.get(1).get(i) +"</option>");
                            }   
                        %>
                        
                        <input type="text" class="form-control" id="txt_descripcion" name="txt_descripcion" value="" placeholder="Descripcion" required>
                        <input type="text" class="form-control" id="txt_imagen" name="txt_imagen" value="" placeholder="Imagen" required>
                        <input type="number" class="form-control" id="txt_precio_costo" name="txt_precio_costo" value="" placeholder="Precio Costo">
                        <input type="email" class="form-control" id="txt_precio_venta" name="txt_precio_venta" value="" placeholder="Precio Venta" required>
                        <select id="dropSangre" name="drop_sangre" class="form-control"  >
                          
                        <%
                            Estudiante clsEstudiante  = new Estudiante();
                            List<List<String>> lista = clsEstudiante.listaTipoSangre();
                            
                            for(int i=0;i< lista.get(0).size() ;i++){
                               out.println("<option value='" +lista.get(0).get(i) +"'>" +lista.get(1).get(i) +"</option>");
                            }   
                        %>
                        <input type="email" class="form-control" id="txt_existencia" name="txt_existencia" value="" placeholder="Existencia" required>
                        <input type="date" class="form-control"  id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" placeholder="Feha Ingreso" required>
                        <input type="submit" id="btnAgregar" name="btnAgregar" value="Agregar" class="btn btn-info btn-lg" >
                        <input type="submit" id="btnModificar" name="btnModificar" value="Modificar" class="btn btn-primary  btn-lg" >
                        <input type="submit" id="btnEliminar" name ="btnEliminar" value="Eliminar" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" class="btn btn-danger btn-lg" >
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
                                <th>Carne</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th>Tipo_Sangre</th>
                                <th>Fecha_nacimiento</th>
                            </thead>
                            <tbody id="tbl_estudiante">
                            <% 
                                //Estudiante clsEstudiante2  = new Estudiante();   // muestra en la tabla inicial los valores
                                DefaultTableModel tblModelo= new DefaultTableModel();
                               tblModelo =clsProductos.llenarEstudiante();
                                          for(int a=0;a< tblModelo.getRowCount();a++){
                                out.println("<tr data-idestudiante="+ tblModelo.getValueAt(a,0).toString()  +" data-idts="+ tblModelo.getValueAt(a,9).toString()  +" >");
                                out.println("<td>" + tblModelo.getValueAt(a,1).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,2).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,3).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,4).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,5).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,6).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,7).toString()  + "</td>");
                                out.println("<td>" + tblModelo.getValueAt(a,8).toString()  + "</td>");
                                out.println("</tr>");
                                          }
                            
                                        %>
                            
                                        </tbody>
    </table>
                                        
         </div>
   
<script type="text/javascript">   
$('#tbl_estudiante').on('click','tr td', function(evt){
   var target,idEstudiante,idTipoSangre,carne,nombres,apellidos,direccion,telefono,correo,tsangre,fnacimiento;
   
   target = $(event.target);
   idEstudiante = target.parent().data('idestudiante');
   idTipoSangre= target.parent().data('idts');
   carne= target.parents("tr").find("td").eq(0).html();
   nombres= target.parents("tr").find("td").eq(1).html();
   apellidos= target.parents("tr").find("td").eq(2).html();
   direccion= target.parents("tr").find("td").eq(3).html();
   telefono= target.parents("tr").find("t").eq(4).html();
   correo= target.parents("tr").find("td").eq(5).html();
   tsangre= target.parents("tr").find("td").eq(6).html();
   fnacimiento= target.parents("tr").find("td").eq(7).html();
   console.log(tsangre);
  
   $("#txtid").val(idEstudiante);
   $("#txt_carne").val(carne);
   $("#txt_nombres").val(nombres);
   $("#txt_apellidos").val(apellidos);
   $("#txt_direccion").val(direccion);
   $("#txt_telefono").val(telefono);
   $("#txt_correo").val(correo);
   //$("#drop_sangre").val(tsangre);
   $("#drop_sangre").attr('selected','selected'); 
   $("#txt_nacimiento").attr("value",fnacimiento);
   $('#modal_productos').modal('show');
   
   
});
</script>
    </body>
    <footer>
        <nav class="navbar navbar-inverse">
        <div class="container">
        <div class="navbar-header">    
                <p class="navbar-brand">Desarrollado por Carlos Rosales</p>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    </footer>
</html>

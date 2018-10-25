<%-- 
    Document   : index
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
        <title>Pagina Puestos</title>
                        <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css"/>
                        <link rel="stylesheet" href="../assets/boostrap/css/bootstrap-theme.css"/>
                        <script src="./boostrap/js/jquery-3.2.1.min.js" ></script>
                        <script src="./boostrap/js/bootstrap.js" ></script>
                        
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
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_puesto">Nuevo</button>
        <button type="button" class="btn btn-info btn-lg" id="btnReg" onclick="opener.top.location.reload();window.close()" name="btnReg" data-toggle="modal"  >Regresar</button>
    <!-- Modal -->
<div id="modal_puesto" class="modal fade" role="dialog">
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
                        <input type="submit" id="btnEliminar" name ="btnEliminar1" value="Eliminar" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" class="btn btn-danger btn-lg" >
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
                                <th>Id Puesto</th>
                                <th>Puesto</th>

                            </thead>
                            <tbody id="tbl_puesto">
                            <% 
                                //Estudiante clsEstudiante2  = new Estudiante();
                                DefaultTableModel tblModelo2= new DefaultTableModel();
                                Puestos clsPuestos1  = new Puestos();
                               tblModelo2 =clsPuestos1.llenarPuestos();
                                          for(int a=0;a< tblModelo2.getRowCount();a++){
                                 out.println("<td>" + tblModelo2.getValueAt(a,0).toString()  + "</td>");
                                out.println("<td>" + tblModelo2.getValueAt(a,1).toString()  + "</td>");
                                out.println("</tr>");
                                          }
                                        %>
                            
                                        </tbody>
    </table>
                                        
         </div>
   <script type="text/javascript">   
$('#tbl_puesto').on('click','tr td', function(evt){
   var target,id,Puesto;
 
   
   target = $(event.target);
   id= target.parents("tr").find("td").eq(0).html();
   Puesto= target.parents("tr").find("td").eq(1).html();
  
   
   $("#txtId1").val(id);
   $("#txtPuesto1").val(Puesto);
   $('#modal_puesto').modal('show');
   
   
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

<%-- 
    Document   : barra_navegacion
    Created on : 28/10/2018, 11:50:05 PM
    Author     : jlemus
--%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<% out.println(request.getContextPath());%>/tablero/tablero.jsp?seleccionado=0" class="dropdown-toggle">Tablero</a>
        </div>      
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <% out.println(session.getAttribute("usr"));%>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#" onclick="cerrarSesion();">Cerrar sesi&oacute;n</a>
                        </li>
                    </ul>
                </li>
            </ul>                     
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

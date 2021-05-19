<%@page import="java.sql.*" %>  

<%
    session = request.getSession();
    String sessionId = session.getId();
    String user = (String) session.getAttribute("usuario");
    String pass = (String) session.getAttribute("contra");
    request.getAttribute("contra");
    if ((Boolean) session.getAttribute("usuarioValido")) {
        %>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Men�</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="css/css.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>

    <body>
        
        <%
        
        
        if (controladores.Toolbox.rol(user, pass) == 1) {
%>

    

<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="menu.jsp">Inicio</a></li>
      <li class="active"><a href="menuparcela.jsp">Parcelas</a></li>
      <li><a href="menuespecies.jsp">Especies</a></li>
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
      <li><a href="menusuarios.jsp">Usuarios</a></li>
    </ul>
    <ul
  </div>
</nav>

<div class="container-fluid text-center" style="margin-top: 100px; background-color: rgba(255, 255, 255, 0.8); padding: 30px;">    
  <div class="row content">
    
    <div class="col-sm-8 text-left"> 
               
<div class="container" >
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="img/carrusel1.jpg" alt="Campo" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
        <img src="img/carrusel2.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>
    
      <div class="item">
        <img src="img/carrusel3.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
          
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Anterior</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Siguiente</span>
    </a>
  </div>
</div>

    
    
    
    
        <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN tipoparcela ON parcela.idtipoparcela = tipoparcela.idtipoparcela + tipoparcela.nombretipo INNER JOIN estado ON parcela.idestado = estado.idestado + estado.nombrestado";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
            
            
        %> 
        
        <div class="centrar">
        <div class="centrartabla">
        
        <h1 style="margin-top: 70px;">Parcelas</h1>
        <table class="table table-hover">
            <thead>
                <tr>

                    <th>ID de la parcela</th>
                    <th>Hect�reas de la parcela</th>
                    <th>Nombre del propietario</th>
                    <th>ID estado</th>
                    <th>Tipo de parcela</th>
                    <th>Referencia</th>
                    <th>Modificar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                        
                %>
                <tr>
                    
                    <td><%=rset.getInt("idparcela")%></td>
                    <td><%=rset.getInt("hectareas")%></td>
                    <td><%=rset.getString("propietario.nombre")%></td>
                    <td><%=rset.getString("estado.nombrestado")%></td>
                    <td><%=rset.getString("tipoparcela.nombretipo")%></td>
                    <td><%=rset.getInt("referencia")%></td>
                    <td><form action="controlador" method="post"><input type="hidden" value="modificarparcela" name="todo"><input type="hidden" value='<%=rset.getInt("idparcela")%>' name="idparcela"><input type="submit" value="Modificar" class="boton"></form></td>
                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbparcela" name="todo"><input type="hidden" value='<%=rset.getInt("idparcela")%>' name="idparcela"><input type="submit" value="Borrar" class="boton"> </form></td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>
        
        <div class="insermenu" style="    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: row;
    align-content: center;
    flex-wrap: wrap;
    width: 50%">
        
        <form action="controlador" method="post" id="irinsertparcela">
        
                    
                   
                    <input type="hidden" value="irinsertparcela" name="todo"/>
                    <input type="submit" value="Insertar otra parcela" class="boton">
                   
        
                </form>

        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Men� principal" class="boton">
        </form>
            
        </div>
    
        </div>
        </div>
    </div>
        
        
       
  </div>
</div>

<% } else if (controladores.Toolbox.rol(user, pass) == 2) {
%>

<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="menu.jsp">Inicio</a></li>
      <li class="active"><a href="menuparcela.jsp">Parcelas</a></li>
      <li><a href="menuespecies.jsp">Especies</a></li>
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
      <li><a href="menusuarios.jsp">Usuarios</a></li>
    </ul>
    <ul
  </div>
</nav>

<div class="container-fluid text-center" style="margin-top: 100px; background-color: rgba(255, 255, 255, 0.8); padding: 30px;">    
  <div class="row content">
        <div class="col-sm-8 text-left"> 
            
            <div class="container" >
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="img/carrusel1.jpg" alt="Campo" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
        <img src="img/carrusel2.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>
    
      <div class="item">
        <img src="img/carrusel3.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
          
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Anterior</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Siguiente</span>
    </a>
  </div>
</div>
    
    
     <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            
            int iduser = controladores.Toolbox.idUser(user);
            
            int idparcela = controladores.Toolbox.parcelaAdmin(iduser);

            String sqlStr = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN tipoparcela ON parcela.idtipoparcela = tipoparcela.idtipoparcela + tipoparcela.nombretipo INNER JOIN estado ON parcela.idestado = estado.idestado + estado.nombrestado WHERE parcela.idparcela = "+ idparcela +";";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
            
            
        %> 
        
         
        <div class="centrar">
        <div class="centrartabla">
        
        <h1 style="margin-top: 70px;">Parcelas</h1>
        <table class="table table-hover">
            <thead>
                <tr>

                    <th>ID de la parcela</th>
                    <th>Hect�reas de la parcela</th>
                    <th>ID propietario</th>
                    <th>ID estado</th>
                    <th>Tipo de parcela</th>
                    <th>Referencia</th>
                    <th>Modificar</th>
                  
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                        
                %>
                <tr>
                    
                    <td><%=rset.getInt("idparcela")%></td>
                    <td><%=rset.getInt("hectareas")%></td>
                    <td><%=rset.getString("propietario.nombre")%></td>
                    <td><%=rset.getString("estado.nombrestado")%></td>
                    <td><%=rset.getString("tipoparcela.nombretipo")%></td>
                    <td><%=rset.getInt("referencia")%></td>
                    <td><form action="controlador" method="post"><input type="hidden" value="modificarparcela" name="todo"><input type="hidden" value='<%=rset.getInt("idparcela")%>' name="idparcela"><input type="submit" value="Modificar" class="boton"></form></td>
                      
                </tr>

                <%

                    }
                %>
            </tbody>
        </table>

        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>
        
        <div class="insermenu" style="    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    align-content: center;
    
    width: 50%">
        
       

        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Men� principal" class="boton">
        </form>
            
        </div>
    
        </div>
        </div>
    </div>
        
        
       
  </div>
</div>


<% } else if (controladores.Toolbox.rol(user, pass) == 3) {
%>


<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="menu.jsp">Inicio</a></li>
      <li class="active"><a href="menuparcela.jsp">Parcela</a></li>
     
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
      
    </ul>
    <ul
  </div>
</nav>

<div class="container-fluid text-center" style="margin-top: 100px; background-color: rgba(255, 255, 255, 0.8); padding: 30px;">    
  <div class="row content">
    
    <div class="col-sm-8 text-left"> 
    
    
   <div class="container" >
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="img/carrusel1.jpg" alt="Campo" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
        <img src="img/carrusel2.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>
    
      <div class="item">
        <img src="img/carrusel3.jpg" alt="Vacas" style="width:100%;">
        <div class="carousel-caption">
          
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Anterior</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Siguiente</span>
    </a>
  </div>
</div>

        <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            
            int iduser = controladores.Toolbox.idUser(user);
            
            int idparcela = controladores.Toolbox.parcelaJornalero(iduser);

            String sqlStr = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN tipoparcela ON parcela.idtipoparcela = tipoparcela.idtipoparcela + tipoparcela.nombretipo INNER JOIN estado ON parcela.idestado = estado.idestado + estado.nombrestado WHERE parcela.idparcela = "+ idparcela +";";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
            
            
        %> 
        
        <div class="centrar">
        <div class="centrartabla">
        
        <h1 style="margin-top: 70px;">Parcelas</h1>
        <table class="table table-hover">
            <thead>
                <tr>

                    <th>ID de la parcela</th>
                    <th>Hect�reas de la parcela</th>
                    <th>ID propietario</th>
                    <th>ID estado</th>
                    <th>Tipo de parcela</th>
                    <th>Referencia</th>
                    <th>Modificar</th>
                   
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                        
                %>
                <tr>
                    
                    <td><%=rset.getInt("idparcela")%></td>
                    <td><%=rset.getInt("hectareas")%></td>
                    <td><%=rset.getString("propietario.nombre")%></td>
                    <td><%=rset.getString("estado.nombrestado")%></td>
                    <td><%=rset.getString("tipoparcela.nombretipo")%></td>
                    <td><%=rset.getInt("referencia")%></td>
                    <td><form action="controlador" method="post"><input type="hidden" value="modificarparcela" name="todo"><input type="hidden" value='<%=rset.getInt("idparcela")%>' name="idparcela"><input type="submit" value="Modificar" class="boton"></form></td>
                      </tr>

                <%

                    }
                %>
            </tbody>
        </table>

        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>
       <div class="insermenu" style="    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    align-content: center;
    
    width: 50%">
        
       

        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Men� principal" class="boton">
        </form>
            
        </div>
    
        </div>
        </div>
    </div>
        
        
       
  </div>
</div>

<% }else  {%>


<html>

    <body>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>

    <h1>No tienes permisos <%=  user%>  </h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% } } else { %>

<html>

    <body>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>

    <h1>El usuario no es valido.</h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% }%>

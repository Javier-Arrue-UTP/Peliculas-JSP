<%-- 
    Document   : programas
    Created on : 12/09/2019, 12:00:38 PM
    Author     : javi0
--%>

<%@page import="Entidades.Contrato"%>
<%@page import="Procesos.Consultar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Programa"%>
<%@page import="Entidades.Programa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programas</title>
        
            <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/estilo_programas.css">
        
    </head>
    
    <body>
<%
    String tipo,email,niños,estado;
    
    niños = request.getParameter("niños"); 
    tipo = request.getParameter("programa");
    email = request.getParameter("email");
    
    LinkedList<Programa> programas = new LinkedList<Programa>();
    Consultar obj = new Consultar();
    
    programas = obj.Busqueda("Todo",tipo,0);
    

    LinkedList<Contrato> contrato= new LinkedList<Contrato>();
        
        
    contrato = obj.Consultar_Contrato(email);
    String fecha_fin=contrato.get(0).getFin_fecha();
    estado = obj.estado_de_cuenta(fecha_fin);
    if(estado.equals("Moroso")){
%>
   <div class="row">
    <div class="col s12 m12">
      <div class="card grey darken-4" style="height: 100vh">
        <div class="card-content white-text center-align">
            <br><br><br><br>
            <h1>Tu cuenta ha sido suspendida. </h1>
            <h2>¡Procede a realizar tu pago para continuar viendo tus programas favoritos!</h2>
        </div>
        <div class="card-action center-align">
          <a href="pagos.jsp?email=<%=email%>&niños=<%=niños%>" class="waves-effect waves-light btn blue">Realizar pago</a>
          <a href="index.html" class="waves-effect waves-light btn blue">Salir</a>
        </div>
      </div>
    </div>
  </div>

    
    <%
        }else{
    %>       
<header>

<!-- DROWPDOWNS PARA BARRA -->
<!-- Dropdown Navegar -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="programas.jsp?programa=Películas&email=<%=email%>&niños=<%=niños%>">Películas</a></li>
        <li><a href="programas.jsp?programa=Series&email=<%=email%>&niños=<%=niños%>">Series</a></li>
    </ul>
    
    
        <!-- Dropdown Cuenta -->
    <ul id="dropdown2" class="dropdown-content">
        <li><a href="perfiles.jsp?email=<%=email%>">Perfiles</a></li>
        <li><a href="mi_lista.jsp?email=<%=email%>&niños=<%=niños%>">Mi lista</a></li>
        <li><a href="cambio_plan.jsp?email=<%=email%>&niños=<%=niños%>">Cambio de plan</a></li>
        <li><a href="pago_historial.jsp?email=<%=email%>&niños=<%=niños%>">Historial de pago</a></li>
        <li><a href="pagos.jsp?email=<%=email%>&niños=<%=niños%>">Seccion de pagos</a></li>
        <li><a href="index.html">Salir</a></li>
    </ul>
        <!-- DROWPDOWNS PARA BARRA -->
        
        <!-- DROWPDOWNS PARA SIDENAV -->
<!-- Dropdown Navegar -->
    <ul id="dropdown3" class="dropdown-content">
        <li><a href="programas.jsp?programa=Películas&email=<%=email%>&niños=<%=niños%>">Películas</a></li>
        <li><a href="programas.jsp?programa=Series&email=<%=email%>&niños=<%=niños%>">Series</a></li>
    </ul>
    
    
        <!-- Dropdown Cuenta -->
    <ul id="dropdown4" class="dropdown-content">
        <li><a href="perfiles.jsp?email=<%=email%>">Perfiles</a></li>
        <li><a href="mi_lista.jsp?email=<%=email%>&niños=<%=niños%>">Mi lista</a></li>
        <li><a href="cambio_plan.jsp?email=<%=email%>&niños=<%=niños%>">Cambio de plan</a></li>
        <li><a href="pago_historial.jsp?email=<%=email%>&niños=<%=niños%>">Historial de pago</a></li>
        <li><a href="pagos.jsp?email=<%=email%>&niños=<%=niños%>">Seccion de pagos</a></li>
        <li><a href="index.html">Salir</a></li>
    </ul>
      <!-- DROWPDOWNS PARA SIDENAV -->

<!--BARRA-->
    <div class="navbar-fixed">
        <nav>
            <div class="nav-wrapper" id="menu">
                <a href="Principal.jsp?email=<%=email%>&niños=<%=niños%>" class="">
                    <span>
                        <img src="Imagenes/Logo.png" alt="" class="logo">
                    </span>
                </a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                              <!-- Dropdown Cuenta -->
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Navegar<i class="material-icons right">arrow_drop_down</i></a></li>
                              <!-- Dropdown Navegar -->
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Cuenta<i class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
            </div>

        </nav>

    </div>

                    
                    <!-- SIDE NAV --->
    <ul class="sidenav" id="mobile-demo">
        <li><a class="dropdown-trigger" href="#!" data-target="dropdown3">Navegar<i class="material-icons right">arrow_drop_down</i></a></li>
        <li><a class="dropdown-trigger" href="#!" data-target="dropdown4">Cuenta<i class="material-icons right">arrow_drop_down</i></a></li>    
    </ul>

</header>

<div>


<!-- Breadcrumbs MUESTRA LA UBICACION ACTUAL-->
<section>
  <nav>
        <div class="nav-wrapper">
                <div class="col s12 container">
                  <a href="Principal.jsp?email=<%=email%>&niños=<%=niños%>" class="breadcrumb">Inicio</a>
                  <a href="#!" class="breadcrumb"><%=tipo%></a>
                </div>
            </div>
  </nav>
</section>


<section>
    <div class="row" id="carta_grande">
            <div class="col s12 m12">
              <div class="card grey lighten-2">
                <div class="card-content black-text hoverable">
                  <h4><%=tipo%></h4>
                  
                    <div class="row">
                      
                       <%
                           for(Programa programa : programas){
                               if(niños.equals(programa.getEdad_rec())){
                       %>
                        <div class="col l3 m6 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator responsive-img" src="<%=programa.getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>
                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.getNombre()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.getDescripcion()%></p>
                                  <br>

                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.getCodigo()%>&tipo=<%=tipo%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
                                  </div>
                                </div>
                              </div>
                        </div>
                        
                        <%
                            }
                            else if(niños.equals("no")){
                        %>
                        <div class="col l3 m6 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator" src="<%=programa.getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>

                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.getNombre()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.getDescripcion()%></p>
                                  <br>

                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.getCodigo()%>&tipo=<%=tipo%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
                                  </div>
                                </div>
                              </div>
                        </div>
                        
                        <%
                        
                            }
                        }
                        %>

                    </div>
                </div>
              </div>
            </div>
    </div>



</section>
  





<footer class="page-footer">
  <div class="container">
    <div class="row">
      <div class="col l6 s12">
        <h5 class="white-text">Footer Content</h5>
        <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
      </div>
      <div class="col l4 offset-l2 s12">
        <h5 class="white-text">Links</h5>
        <ul>
          <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
          <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="footer-copyright">
    <div class="container">
    © 2014 Copyright Text
    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
    </div>
  </div>
</footer>
<%
}
%>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems,{
        coverTrigger:false
    });
  });
    </script>
    
    <script>
    
        document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems);
        });
    
    </script>

    </body>
</html>

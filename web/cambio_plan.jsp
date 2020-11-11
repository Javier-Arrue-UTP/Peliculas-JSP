<%-- 
    Document   : cambio_plan
    Created on : 12/09/2019, 06:16:54 PM
    Author     : javi0
--%>

<%@page import="Entidades.Usuarios"%>
<%@page import="Procesos.Consultar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Contrato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de Plan</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/estilo_programas.css">
        
    </head>
    <body>
    <%
        String estado;
        String email = request.getParameter("email");
        String niños = request.getParameter("niños");  
        int cod;
        
       LinkedList<Contrato> contrato= new LinkedList<Contrato>();
       LinkedList<Contrato> plan= new LinkedList<Contrato>();
       LinkedList<Usuarios> codigo = new LinkedList<Usuarios>();
       
        Consultar consulta = new Consultar();
        
        codigo = consulta.ConsultarUsuarios(email);
        cod = codigo.get(0).getCli_codigo();
       
       
        
        contrato = consulta.Consultar_Contrato(email);
        plan = consulta.Consultar_planes(contrato.get(0).getPlan_tipo());

        String fecha_fin=contrato.get(0).getFin_fecha();
        estado = consulta.estado_de_cuenta(fecha_fin);
        
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
        <nav class="grey darken-4">
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
<!-- Breadcrumbs MUESTRA LA UBICACION ACTUAL-->
    <section>
        <nav>
              <div class="nav-wrapper">
                      <div class="col s12 container">
                        <a href="Principal.jsp?email=<%=email%>&niños=<%=niños%>" class="breadcrumb">Inicio</a>
                        <a href="#!" class="breadcrumb">Cambio de Plan</a>
                      </div>
                  </div>
        </nav>
    </section>



    <section>
        <div class="row" id="carta_grande">
                <div class="col s12 m12">
                  <div class="card grey lighten-2">
                    <div class="card-content black-text hoverable">
                      <h4>Cambio de Planes</h4>
                      <hr>
                      <div class="container">
                        <br>   
                        <!-- PLAN ACTUAL -->
                        <div class="row">
                            <div class="col m6 s12">
                                <div class="center-align"><h5>Tienes el siguiente plan</h5></div>
                                <div class="card hoverable white" >
                                    <div class="card-content black-text">
                                        <span class="card-title"><%=contrato.get(0).getPlan_tipo()%></span>
                                        <hr>
                                        <p>
                                                <label>
                                                        <span><b>POR $ <%=contrato.get(0).getPlan_monto()%>/mes</b></span>
                                                </label>
                                                
                                                
                                        </p>
                                        
                                    </div>
                                </div>
                            </div>
                        
                        
                                <div class="col m6 s12">
                                    <div class="center-align"><h5>Puedes cambiar a</h5></div>
                                    <%
                                        for(Contrato planes : plan){
                                    %>
                                    <div class="card hoverable white">
                                            <div class="card-content black-text">
                                                <span class="card-title"><%=planes.getPlan_tipo()%> </span>
                                                <hr>
                                                <p>
                                                        <label>
                                                            <input class="with-gap" name="plan" type="radio"  value="<%=planes.getPlan_cod()%>" form="formulario" required/>
                                                            <span>Por $<%=planes.getPlan_monto()%>/mes </span>
                                                        </label>
                                                    </p>
                                                
                                            </div>
                                            
                                        </div>
                                    
                                    <%
                                        }
                                    %>

                                        

                                </div>

                                <form action="cambio_plan_guardar.jsp" method="GET" id="formulario">
                                    <div class="center-align">
                                        <input type="hidden" name="niños" value="<%=niños%>">
                                        <button class="btn-large waves-effect waves-light  light-blue " type="submit" name="email" value="<%=email%>">Cambiar Plan</button>
                                    </div>
                                </form>
                                        
                            </div>


                    </div>
                    </div>
                  </div>
                </div>
        </div>
    
    
    
    </section>
      


        <footer class="page-footer grey darken-4">
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

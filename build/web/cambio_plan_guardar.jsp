<%-- 
    Document   : cambio_plan
    Created on : 12/09/2019, 06:16:54 PM
    Author     : javi0
--%>

<%@page import="Procesos.Cambiar"%>
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
        String email = request.getParameter("email");
        String niños = request.getParameter("niños"); 
        
        int cod,plan;
        
       LinkedList<Contrato> contrato= new LinkedList<Contrato>();
       LinkedList<Usuarios> codigo = new LinkedList<Usuarios>();
       
        Consultar consulta = new Consultar();
        Cambiar cambio = new Cambiar();
        
        codigo = consulta.ConsultarUsuarios(email);
        cod = codigo.get(0).getCli_codigo();
       
       
        
        contrato = consulta.Consultar_Contrato(email);
        plan = Integer.parseInt(request.getParameter("plan"));
        
        cambio.Cambiar_plan(cod, plan);
        
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

<!--BARRA-->
    <div class="navbar-fixed">
        <nav class="grey darken-4">
            <div class="nav-wrapper" id="menu">
                <a href="Principal.jsp?email=<%=email%>&niños=<%=niños%>" class="">
                    <span>
                        <img src="Imagenes/Logo.png" alt="" class="logo">
                    </span>
                </a>
                        <ul class="right hide-on-med-and-down">
                                      <!-- Dropdown Cuenta -->
                            <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Navegar<i class="material-icons right">arrow_drop_down</i></a></li>
                                      <!-- Dropdown Navegar -->
                            <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Cuenta<i class="material-icons right">arrow_drop_down</i></a></li>
                        </ul>
                    </div>
        
                </nav>
        
            </div>
    </header>
<!-- Breadcrumbs MUESTRA LA UBICACION ACTUAL-->
    <section>
        <nav>
              <div class="nav-wrapper grey darken-4">
                      <div class="col s12 container">
                        <a href="Principal.jsp?email=<%=email%>" class="breadcrumb">Inicio</a>
                        <a href="cambio_plan.jsp?email=<%=email%>" class="breadcrumb">Cambio de Plan</a>
                      </div>
                  </div>
        </nav>
    </section>



    <section>
        <div class="row" id="carta_grande">
                <div class="col s12 m12">
                  <div class="card grey lighten-2">
                    <div class="card-content black-text hoverable center-align">
                      <h4>¡ El plan ha sido cambiado con éxito ¡</h4>
                      <hr>
                      <div class="container">
                        <br><br> <br> <br><br> <br>     
                        <a class="btn waves-effect waves-light  light-blue" href="cambio_plan.jsp?email=<%=email%>&niños=<%=niños%>">Regresar</a>


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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <script>
          document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems,{
            coverTrigger:false
        });
      });
        </script>
    </body>
</html>

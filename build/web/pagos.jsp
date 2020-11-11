<%-- 
    Document   : pagos
    Created on : 12/12/2019, 03:21:13 PM
    Author     : javi0
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Contrato"%>
<%@page import="Procesos.Consultar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seccion de Pagos</title>
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/estilo_programas.css">
    </head>
<body>
    <%
        String email = request.getParameter("email");
        String niños = request.getParameter("niños");
        int resultado;
        String estado;
                
        Consultar consulta = new Consultar();
        LinkedList<Contrato> contrato= new LinkedList<Contrato>();
        
        contrato = consulta.Consultar_Contrato(email);
        
        
        String fecha_fin=contrato.get(0).getFin_fecha();
        estado = consulta.estado_de_cuenta(fecha_fin);
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
                    
        <!-- DROPDOWNS PARA SIDENAV -->
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
      <!-- DROPDOWNS PARA SIDENAV -->   
      
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
                            <a href="#!" class="breadcrumb">Realizar pago</a>
                          </div>
                      </div>
            </nav>
        </section>
    
    
    
        <section>
            <div class="row" id="carta_grande">
                    <div class="col s12 m12">
                      <div class="card grey lighten-2">
                        <div class="card-content black-text hoverable">
                          <h4>Seccion de pago</h4>
                          <hr>
                          <div class="row">
                              <div class="col l4 s12">

                              </div>
                                <div class="col l4 s12">
                                        <div class="center-align"><h5>Informacion de la cuenta</h5></div>
                                        <div class="card hoverable white" >
                                            <div class="card-content black-text">
                                                <span class="card-title">Plan</span>
                                                <%=contrato.get(0).getPlan_tipo()%> por $<%=contrato.get(0).getPlan_monto()%>/mes
                                                <hr>
                                                <span class="card-title">Estado de cuenta</span>
                                                <div class="row">
                                                        <div class="col s6">
                                                                <%=estado%> 
                                                        </div>
                                                        <div class="col s6">
                                                            <%if(estado.equals("Moroso")){%>
                                   <!-----FORMULARIO-------><form action="realizar_pago.jsp" method="GET"> <!-----FORMULARIO------->
                                                                <button class="btn waves-effect waves-light blue" type="submit" name="email" value="<%=email%>">Pagar
                                                                            <i class="material-icons right">send</i>
                                                                            <input type="hidden" name="plan" value="<%=contrato.get(0).getPlan_cod()%>">
                                                                            <input type="hidden" name="niños" value="<%=niños%>">
                                                                            <h1><%=contrato.get(0).getPlan_cod()%></h1>
                                                                </button>
                                                             </form>
                                                            <%}
                                                                else{
                                                            %>
                                                                <button class="btn waves-effect waves-light blue disabled" type="submit" name="action">Pagar
                                                                 <i class="material-icons right">send</i>
                                                                 <%}%>
                                                                 
                                                        </div>
                                                </div>
                                                    <hr>
                                                    <span class="card-title">Fecha límite</span>
                                                    <%=fecha_fin%>
                                            </div>
                                        </div>
                                    </div>


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

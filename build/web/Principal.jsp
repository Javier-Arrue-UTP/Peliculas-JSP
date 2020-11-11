<%-- 
    Document   : Principal
    Created on : 12/07/2019, 12:21:24 PM
    Author     : javi0
--%>

<%@page import="Entidades.Programa"%>
<%@page import="Entidades.Contrato"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Procesos.Consultar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        
        
            <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

     <!-- Compiled and minified CSS -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <link rel="stylesheet" href="CSS/estilo_principal.css">
    </head>
    <body>
   


<header>
    <%
        String email,niños,estado,gen_nombre;
        int codigo;
        
        niños = request.getParameter("niños");   
        email = request.getParameter("email");
    
        Consultar consulta = new Consultar();
        LinkedList<Contrato> contrato= new LinkedList<Contrato>();
        
        LinkedList<Programa> pelis_cod = new LinkedList<Programa>();
        LinkedList<Programa> series_cod = new LinkedList<Programa>();
        LinkedList<Programa> generos_nombres = new LinkedList<Programa>();
        LinkedList<Programa> programa = new LinkedList<Programa>();
        LinkedList<Programa> genero = new LinkedList<Programa>();
        
        pelis_cod = consulta.pelis_mas_vistas();
        series_cod = consulta.series_mas_vistas();
        generos_nombres = consulta.generos_mas_vistas();
        
        
        contrato = consulta.Consultar_Contrato(email);
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

<!--BUSQUEDA-->

<section>
    <div class="card grey lighten-3" style="">
        <div class="card-content">
            <span class="card-title">Métodos de Búsqueda</span>
        </div>
        <div class="card-tabs">
          <ul class="tabs tabs-fixed-width">
            <li class="tab"><a href="#v_genero" class="grey lighten-3">Por género</a></li>
            <li class="tab"><a href="#v_edad" class="grey lighten-3">Por edad</a></li>
            <li class="tab"><a href="#v_actor" class="grey lighten-3">Por actor</a></li>
          </ul>
        </div>
        <div class="card-content" style="">
            
          <!------------------------------ POR GENERO------------------------------->
          <div id="v_genero" class="center-align">
            <!-- FORMULARIO-->
            <form action="busqueda.jsp" method="GET">
              <div class="input-field col s12">
                  <select name="seleccion" required>
                    <option value="" disabled selected>Escoge un género</option>
                    <option value="Accion">Accion</option>
                    <option value="Comedia">Comedia</option>
                    <option value="Drama">Drama</option>
                    <option value="Ficcion">Ficción</option>
                    <option value="Guerra">Guerra</option>
                    <option value="Musicales">Musicales</option>
                    <option value="Romantica">Romántica</option>
                    <option value="Terror">Terror</option>
                  </select>
                  <label>Materialize Select</label>
              </div>
                 <input type="hidden" name="vista" value="Genero">
                 <input type="hidden" name="niños" value="<%=niños%>">
                 
                <button class="btn waves-effect waves-light  light-blue" type="submit" name="email" value="<%=email%>">Buscar
                        <i class="material-icons right">send</i>
                </button>
                
            </form>
          </div>

          <!------------------------------ POR EDAD ------------------------------>
          <div id="v_edad" class="center-align">
            <!-- FORMULARIO-->
            <form action="busqueda.jsp" method="GET">
              <div class="input-field col s12">
                  <select name="seleccion" required>
                    <option value="" disabled selected>Escoge un rango de edad</option>
                    <option value="Menor 10">Menor de 10</option>
                    <%if(niños.equals("Menor 10")){%>
                    <option value="11 a 17" disabled>De 11 a 17</option>
                    <option value="Mayor 18" disabled>Mayor a 18</option>
                    <%}else if(niños.equals("no")){%>
                    <option value="11 a 17">De 11 a 17</option>
                    <option value="Mayor 18" >Mayor a 18</option>
                    <%}%>
                  </select>
                  <label>Materialize Select</label>
              </div>
                <input type="hidden" name="vista" value="Edad">
                <input type="hidden" name="niños" value="<%=niños%>">
                
                <button class="btn waves-effect waves-light  light-blue" type="submit" name="email" value="<%=email%>">Buscar
                        <i class="material-icons right">send</i>
                </button>
            </form>
          </div>

          <!------------------------------POR ACTOR------------------------------>
          <div id="v_actor" class="center-align">
              <div class="row" style="margin-bottom: 0px;">
                 <!-- FORMULARIO-->
                  <form class="col s12" method="GET" action="busqueda.jsp">
                    <div class="row" style="margin-bottom: 0px;">
                      <div class="input-field col s12">
                        <input id="last_name" type="text" class="validate" name="seleccion" required>
                        <label for="last_name">Nombre de actor</label>
                      </div>
                    </div>
                      <input type="hidden" name="vista" value="Actor">
                      <input type="hidden" name="niños" value="<%=niños%>">
                      
                <button class="btn waves-effect waves-light  light-blue" type="submit" name="email" value="<%=email%>">Buscar
                        <i class="material-icons right">send</i>
                </button>
                  </form>
              </div>


          </div>
        </div>
      </div>



    
</section>


<!--BUSQUEDA-->



<!------------------------------------ GENEROS DESTACADAS-------------------------->
<section>
        <div>
                <div class="col s12 m12">
                  <div class="card" id="carta">
                    <div class="card-content black-text hoverable">

                        <span class="card-title white-text"><b>Generos mas populares</b></span>
                        <div class="col s6">
                            
                      
                            <div class="slider">
                                <form action="busqueda.jsp" method="GET">
                                    <ul class="slides">
                                        <%for(Programa i : generos_nombres){
                                            gen_nombre = i.getNombre();
                                            genero = consulta.consultar_genero(i.getGen_nombre());
                                        %>
                                      <li>
                                        <img src="<%=genero.get(0).getProg_imagen()%>" style="background-size: cover;"> <!-- random image -->
                                        <div class="caption left-align">
                                            <button class="waves-effect waves-light btn-large" id="btn" name="seleccion" value="<%=genero.get(0).getGen_nombre()%>">
                                                <h5><b><%=genero.get(0).getGen_nombre()%></b></h5>
                                            </button>
                                        </div>
                                      </li>
                                      <% } %>
                                    </ul>
                                    
                                    <input type="hidden" name="vista" value="Genero">
                                    <input type="hidden" name="niños" value="<%=niños%>">
                                    <input type="hidden" name="email" value="<%=email%>">
                                </form>
                            </div>
                        </div>

                    </div>
                  </div>
                </div>
              </div>
</section>


<section>
        <div class="row">
                <div class="col s12 m12">
                  <div class="card grey lighten-2">
                    <div class="card-content black-text hoverable">
                      <span class="card-title">Películas mas Vistas</span>
                        <div class="row">
                            <%for(Programa i : pelis_cod){ 
                                codigo = i.getCodigo();
                                 programa = consulta.Busqueda("", "", codigo);
                                    if(niños.equals(programa.get(0).getEdad_rec())){
                            %>
                        <div class="col l3 m4 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator" src="<%=programa.get(0).getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>

                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.get(0).getNombre()%><%=programa.get(0).getEdad_rec()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.get(0).getDescripcion()%></p>
                                  <br>
                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.get(0).getCodigo()%>&tipo=<%=programa.get(0).getPrograma_tipo()%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
                                  </div>
                                </div>
                              </div>
                        </div>
                             <%
                            }else if(niños.equals("no")){
                            %>
                         <div class="col l3 m4 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator" src="<%=programa.get(0).getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>

                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.get(0).getNombre()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.get(0).getDescripcion()%></p>
                                  <br>
                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.get(0).getCodigo()%>&tipo=<%=programa.get(0).getPrograma_tipo()%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
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

        <div class="row">
                <div class="col s12 m12">
                  <div class="card grey lighten-2">
                    <div class="card-content black-text hoverable">
                      <span class="card-title">Series mas Vistas</span>
                        <div class="row">
                            <%for(Programa i : series_cod){ 
                                codigo = i.getCodigo();
                                 programa = consulta.Busqueda("", "", codigo);
                                 if(niños.equals(programa.get(0).getEdad_rec())){
                            %>
                        <div class="col l3 m4 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator" src="<%=programa.get(0).getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>

                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.get(0).getNombre()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.get(0).getDescripcion()%></p>
                                  <br>
                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.get(0).getCodigo()%>&tipo=<%=programa.get(0).getPrograma_tipo()%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
                                  </div>
                                </div>
                              </div>
                        </div>
                        <%
                            }else if(niños.equals("no")){
                            %>
                        <div class="col l3 m4 s6">
                            <div class="card hoverable">
                                <div class="card-image waves-effect waves-block waves-light">
                                  <img class="activator" src="<%=programa.get(0).getProg_imagen()%>" id="imagen" href="index.jsp">
                                </div>

                                <div class="card-reveal">
                                  <span class="card-title grey-text text-darken-4"><%=programa.get(0).getNombre()%><i class="material-icons right">close</i></span>
                                  <p><%=programa.get(0).getDescripcion()%></p>
                                  <br>
                                  <div class="center-align">
                                      <a class="waves-effect waves-light btn blue" href="ver_programa.jsp?email=<%=email%>&codigo=<%=programa.get(0).getCodigo()%>&tipo=<%=programa.get(0).getPrograma_tipo()%>&niños=<%=niños%>"><i class="material-icons right">play_circle_outline</i>Ver</a>
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
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems);
      });

    </script>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.slider');
        var instances = M.Slider.init(elems);
      });


    </script>

    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var elem = document.querySelector('.tabs'); 
        var instance = M.Tabs.init(elem, {
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

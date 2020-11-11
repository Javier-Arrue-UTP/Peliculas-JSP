<%-- 
    Document   : visualizar_programa
    Created on : 12/09/2019, 02:30:52 PM
    Author     : javi0
--%>

<%@page import="Entidades.Usuarios"%>
<%@page import="Entidades.Comentarios"%>
<%@page import="Procesos.Insertar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Programa"%>
<%@page import="Procesos.Consultar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Geminy</title>
        
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/estilo_visualizar.css">
        
        
    </head>

<body class="black">
    <%
    String email,tipo,niños,gen_nombre;
    int codigo,cliente_cod;
    boolean resultado;
    
    niños = request.getParameter("niños");  
    codigo = Integer.parseInt(request.getParameter("codigo"));
    email = request.getParameter("email");
    tipo = request.getParameter("tipo");
    
    
    Consultar obj = new Consultar();
    LinkedList<Programa> programa = new LinkedList<Programa>();
     LinkedList<Usuarios> cli_cod = new LinkedList<Usuarios>() ;//Tendra el codigo de la cuenta 
     
    cli_cod = obj.ConsultarUsuarios(email);
    cliente_cod = cli_cod.get(0).getCli_codigo(); //Almacena el codigo
    
    
    programa = obj.Consultar_programa(codigo);
    gen_nombre = programa.get(0).getGen_nombre();
    
    Insertar obj2 = new Insertar();
    
    resultado = obj.Consultar_favorito(codigo, email);
    
    obj2.insertar_programa_visto(tipo, gen_nombre, cliente_cod, codigo);
    

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
                <nav class="">
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
                        <a href="Principal.jsp?email=<%=email%>&niños=<%=niños%>" class="breadcrumb">Inico</a>
                        <a href="programas.jsp?programa=<%=tipo%>&email=<%=email%>&niños=<%=niños%>" class="breadcrumb"><%=tipo%></a>
                        <a href="#!" class="breadcrumb"><%=programa.get(0).getNombre()%></a>
                      </div>
                  </div>
        </nav>
    </section>



                      <!-- SECCION PRINCIPAL -->
      <section style="background-image: url(<%=programa.get(0).getImagen_fondo()%>);  background-size: cover;">
        
            <div>
                    <div class="col s12 m12">
                      <div class="card" id="carta1">
                        <div class="card-content white-text hoverable">

                            <div class="container">

                                <!------------------------IMAGEN PORTADA-------------------->
                                <div class="row">
                                    <div class="col m4 s12"> 
                                        <div class="row">
                                            <div class="col s12 m11">
                                                <div class="card Medium">  
                                                    <div class="card-image">
                                                        <img src="<%=programa.get(0).getProg_imagen()%>">
                                                        <%
                                                            if(resultado){
                                                        %>
                                                            <button class="btn-floating halfway-fab waves-effect waves-light red" name="favorito" value="true">
                                                                <i class="material-icons">favorite</i>
                                                            </button>
                                                        <%
                                                        }
                                                            else{
                                                        %>
                                                        <form method="get" action="ver_programa.jsp">
                                                            <button class="btn-floating halfway-fab waves-effect waves-light" name="favorito" value="true" id="fav">
                                                                
                                                                <i class="material-icons">favorite_border</i>
                                                            </button>
                                                            <input type="hidden" name="email" value="<%=email%>">
                                                            <input type="hidden" name="codigo" value="<%=codigo%>">
                                                            <input type="hidden" name="tipo" value="<%=tipo%>">
                                                            <input type="hidden" name="niños" value="<%=niños%>">
                                                        
                                                        </form>   
                                                        <%
                                                            String favorito = request.getParameter("favorito");
                                                            if(favorito!=null){
                                                                obj2.Insertar_favorito(email, codigo,cliente_cod);
                                                            }
                                                            }
                                                        %>
                                                       
                                                        
                                                    </div>      
                                                </div>
                                            </div><!------------------------IMAGEN PORTADA-------------------->
                                        </div>
                                    </div>

                                    <!------------------------ INFORMACION DE LA PELICULA --------------------------> 
                                    <div class="col m8 s12">
                                        <div class="row">
                                            <div class="col s12"><h2><b><%=programa.get(0).getNombre()%></b></h2></span>
                                                <p><h5>⏱ <b>Duracion: </b><%=programa.get(0).getDuracion()%> minutos.</h5></p>
                                                <div class="row">
                                                    <div class="col s12 m12">
                                                        <div class="card transparent">
                                                            <div class="card-content white-text">
                                                                <p><h5><b>📑 Descripcion</b></h5></p>
                                                                <p><%=programa.get(0).getDescripcion()%> </p>
                                                            </div>
        
                                                        </div>
                                                    </div>
                                                </div>
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

        <section class="center-align">




            <div class="col s12 hoverable">
                
                <div class="card transparent">
                    <div class="card-content">
                        <iframe width="854 " height="480" src="https://www.youtube.com/embed/<%=programa.get(0).getVideo()%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                        </iframe>

                    </div>
                   
                </div>
            </div>


        </section>
                        
                        <!--------------------- COMENTARIOS ------------------------>
        <section>

                    <div class="container white-text">
                        <hr>
                        <h5>Comentarios<h5>
                            <div class="row">
                                <form  method="get" action="ver_programa.jsp" class="col s12"> <!----------------- FORMULARIO ---------------->
                                  <div class="row">
                                    <div class="input-field col s12">
                                      <i class="material-icons prefix">insert_comment</i>
                                      
                                      <textarea id="icon_prefix2" class="materialize-textarea white-text" name="comentario"></textarea>
                                      
                                      <label for="icon_prefix2">Escribe un comentario...</label>
                                      <div class="right-align">
                                          <button class="waves-effect waves-light btn" id="enviar">Enviar <i class="material-icons right"> send</i></button>
                                      </div>
                                    </div>
                                    <input type="hidden" name="email" value="<%=email%>">
                                    <input type="hidden" name="codigo" value="<%=codigo%>">
                                    <input type="hidden" name="tipo" value="<%=tipo%>">
                                      <input type="hidden" name="niños" value="<%=niños%>">
                                  </div>
                                </form>
                            </div>
                             <%
                                 String comentario = request.getParameter("comentario");
                                 if(comentario!=null){
                                 obj2.InsertarComentario(email, comentario,codigo);
                                 }
                                 LinkedList<Comentarios> coments = new LinkedList<Comentarios>();
                                coments = obj.Consultar_comentario();
                             %>
                                    
                                    

                          <div class="col l2 m12 s12">                             
                            <div class="card transparent" >
                                <div class="card-content white-text">
                                    <hr>
                                    <%
                                        for(Comentarios c : coments){
                                                if(c.getCodigo_prog()==codigo){
                                    %>
                                    
                                    <div class="col s12">                             
                                      <div class="card transparent hoverable" >
                                          <div class="card-content ">
                                              <span class="card-title"><%=c.getEmail()%></span>
                                              <p style="font-size:18px;"><%=c.getComentario()%></p>
                                          </div>
                                      </div>
                                    </div>
                                    <hr>
                                    
                                    <%}
                                        }
                                    
                                    %>

                        
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

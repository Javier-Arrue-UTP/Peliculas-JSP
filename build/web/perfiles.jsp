<%-- 
    Document   : perfiles
    Created on : 11/30/2019, 08:33:14 AM
    Author     : javi0
--%>

<%@page import="Entidades.Contrato"%>
<%@page import="Entidades.Perfiles"%>
<%@page import="java.util.LinkedList"%>
<%@page import = "Entidades.Usuarios"%>
<%@page import = "Procesos.Consultar"%>
<%@page import = "java.util.List"%>
<%@page import = "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <link href="CSS/esitlo_perfiles.css" rel="stylesheet" type="text/css"/>
     <title>Perfiles</title>
     
    </head>
<body class="white-text">
        <%
            String email,estado;
            int cod,i=0;
            email = request.getParameter("email");
            LinkedList<Usuarios> users = new LinkedList<Usuarios>(); //Tendra el nombre de la cuenta principal
            Consultar consulta = new Consultar();

            users = consulta.ConsultarUsuarios(email);
            
            LinkedList<Usuarios> codigo = new LinkedList<Usuarios>() ;//Tendra el codigo de la cuenta 
            LinkedList<Perfiles> perfiles = new LinkedList<Perfiles>(); //Tendra los perfiles de la cuenta
            
           codigo = consulta.ConsultarUsuarios(email);
           cod = codigo.get(0).getCli_codigo(); //Almacena el codigo
           perfiles = consulta.ConsultarPerfiles(cod); 

        %>
    
    
  <section class="container">
        <div class="center-align">
            <img src="Imagenes/Logo.png" alt="" id="logo_inicio">
            <hr>
            <h4>Selecciona tu perfil</h4>
            
            <div class="row">
                <div class="col s2">
                    <a href="Principal.jsp?email=<%=email%>&niños=no">
                    <div class="card blue-grey">
                        <div class="card-content hoverable white-text">
                                <img src="Imagenes/carita.png" class="img_perfil">
                        </div>
                    </div>
                    </a>
                    <h5><%=users.get(0).getCli_nombre()%> (admin)</h5>
                </div>
                
                 
                
                <% for(Perfiles perfil: perfiles){ // CONTINUAR CON ENSEÑAR LOS PERFILES
                    
                  %>  
                  
                <div class="col s2">
                    <a href="Principal.jsp?email=<%=email%>&niños=no" >
                    <div class="card <%=perfil.getColor()%>">
                        <div class="card-content hoverable white-text">
                                <img src="Imagenes/carita.png" class="img_perfil">
                        </div>
                    </div>
                    </a>
                    <h5><%=perfil.getNombre()%></h5>
                </div>
                
                <%
                    i++;
                    }
                %>
                
                <div class="col s3">
                    <a href="Principal.jsp?email=<%=email%>&niños=Menor 10" >
                    <div class="card" id="niños" style="padding:18px;background-image: linear-gradient( 68.7deg,  rgba(29,173,235,1) 13.2%, rgba(137,149,250,1) 29.8%, rgba(229,109,212,1) 48.9%, rgba(255,68,128,1) 68.2%, rgba(255,94,0,1) 86.4% );">
                        <div class="card-content hoverable white-text">
                            <span class="card-title">Niños</span>
                        </div>
                    </div>
                    </a>
                </div>
                
            </div>
            
            <% if(i<3){
            %>    
            <h5>Añadir perfil</h5> 
            <a href="agregar_perfil.jsp?email=<%=email%>"><i class="material-icons medium">add_circle_outline</i></a>
            <%  
            }%>
            <br><br>
            
            <a class="btn waves-effect waves-light  light-blue" href="index.html">Salir</a>

        </div>



    </section>
 <!-- ------------------------------JAVASCRIPT----------------------------------------- -->
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>

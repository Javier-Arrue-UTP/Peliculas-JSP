<%-- 
    Document   : verificar
    Created on : 11/29/2019, 04:09:19 PM
    Author     : javi0
--%>
<%@page import = "Procesos.Verificar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Verificando...</title>
        <link href="CSS/esitlo_perfiles.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body class="grey darken-4 white-text">
        <%
            Verificar verificar = new Verificar();
            String email,contrasena;
            
            boolean result;
            contrasena = request.getParameter("contrasena");
            email = request.getParameter("email");
            
            result = verificar.VerificarUsuario(email,contrasena);
        %>    
        <section class="container center-align">
            <img src="Imagenes/Logo.png" alt="" id="logo_inicio">
            <hr>
        <%    
            if(result){
        %>

            <h3>¡Usuario verificado!</h3>
            <a class="waves-effect waves-light btn  light-blue" href="perfiles.jsp?email=<%=email%>">Continuar</a>

            <a class="waves-effect waves-light btn  light-blue" href="index.html">Salir</a>
        <%
            }
            else{
        %>
        <h3>No se ha encontrado el usuario... Intentalo de nuevo</h3>
         <a class="waves-effect waves-light btn  light-blue" href="index.html">Volver</a>
        <%
        }
        %>
        </section>
        
        
  <!-- ------------------------------JAVASCRIPT----------------------------------------- -->
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>       
        
    </body>
</html>

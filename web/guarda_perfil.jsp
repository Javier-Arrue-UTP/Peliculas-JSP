<%-- 
    Document   : guarda_perfil
    Created on : 11/30/2019, 07:26:43 PM
    Author     : javi0
--%>

<%@page import="Procesos.Consultar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Usuarios"%>
<%@page import="Entidades.Usuarios"%>
<%@page import="Procesos.Insertar"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

     <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="CSS/esitlo_perfiles.css" rel="stylesheet" type="text/css"/>
    
        <title>Guardando...</title>
    </head>
    <body class="white-text">
        <%
            int result,cod;
            Insertar perfil = new Insertar();
            String email,nombre,color;
            email = request.getParameter("email");
            nombre = request.getParameter("nombre");
            color = request.getParameter("color");
            
            LinkedList<Usuarios> codigo = new LinkedList<Usuarios>();
            Consultar consulta = new Consultar();
            
           codigo = consulta.ConsultarUsuarios(email);
            cod = codigo.get(0).getCli_codigo();
            result = perfil.InsertarPerfil(cod,nombre,color);
        %>
        <section class="center-align">
            <div class="container">
                <img src="Imagenes/Logo.png" alt="" id="logo_inicio">
                <hr>
                <%
                    if(result==1){
                %>
                <h4>¡Perfil Creado!</h4>
                <%
                    }else{
                      %>
                <h4>Algo salio mal...</h4>
                      <%
                    }
                %>
                <a class="btn waves-effect waves-light  light-blue" href="perfiles.jsp?email=<%=email%>">Volver</a>
                
            </div>
            
        </section>
    </body>
</html>

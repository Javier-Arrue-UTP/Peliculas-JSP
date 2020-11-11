<%-- 
    Document   : guardar
    Created on : 11/28/2019, 03:30:34 PM
    Author     : javi0
--%>
<%@page import="Procesos.Consultar"%>
<%@page import = "java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Usuarios" %>
<%@page import="Procesos.Insertar" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar</title>
        
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="CSS/guardar.css"> 
    <style>
    </style>
    
    
    </head>
    <body class="white-text">
        <%  
                String num_tarjeta;
                
                int result = 0;
                int plan = Integer.parseInt(request.getParameter("plan"));
                double pago=0;
                
                Insertar insert = new Insertar();
                Usuarios user = new Usuarios();
                
                
                user.setCli_nombre(request.getParameter("nombre"));
                user.setCli_apellido(request.getParameter("apellido"));
                user.setCli_id(request.getParameter("identificacion")); //Quitar
                user.setCli_contraseña(request.getParameter("contraseña"));
                user.setCli_tarjeta_tipo(request.getParameter("tarjeta_tipo"));
                user.setCli_num_tarjeta(request.getParameter("num_tarjeta"));
                user.setCli_email(request.getParameter("email"));
                user.setPlan_codigo(plan);
                 
                result = insert.InsertarUsuario(user);
                
                if(result == 1){ //Si se registro correctamente procede a insertar en Contratos y Pagos.
                 LinkedList<Usuarios> codigo =  new LinkedList<Usuarios>();
                Consultar consulta = new Consultar();
                                    
                String email = request.getParameter("email");;
                codigo = consulta.ConsultarUsuarios(email);
                                    
                int cod = codigo.get(0).getCli_codigo();
                insert.InsertarContrato(user,cod);
                
                if(plan==3){
                    pago = 16.00;
                }else if(plan==2){
                    pago = 14.00;
                }else{
                    pago = 9.00;
                }
                insert.Insertar_pago(plan, cod, pago);
                
                }

        %>
        <div class="container center-align">
            <img src="Imagenes/Logo.png" alt="" id="logo_inicio">
             <hr>
        </div>
        
                           
        <div class="row">
            <div class="col s12">
                 <div class="card" id="carta_inicio">
                    <div class="card-content white-text">
                                      
                        <div class="container center-align">
                             <%            
                                 if(result == 1){ 

                             %>
                             <h5>Te has registro correctamente</h5>
                            <h5>¡Ya puedes empezar a ver tus programas favoritos!</h5>
                            <a class="waves-effect waves-light btn  light-blue" href="index.html">Iniciar sesión</a> 
                            <%
                                }
                                else{
                            %>
                            <h2>A ocurrido un error...</h2>
                            <a class="waves-effect waves-light btn  light-blue" href="Registro2.html">Volver</a>
                            <a class="waves-effect waves-light btn  light-blue" href="index.html">Ir al inicio</a> 
                            <%}%>
                        </div>

                    </div>               
                </div>
            </div>
        </div>
    
        
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>

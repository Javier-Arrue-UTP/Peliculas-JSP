<%@page import="Procesos.Consultar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Entidades.Usuarios"%>
<%@page import="Entidades.Usuarios"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Agregar perfil</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

     <!-- Compiled and minified CSS -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <link href="CSS/esitlo_perfiles.css" rel="stylesheet" type="text/css"/>
    </head>
        <%
            String email;
            email = request.getParameter("email");

        %>
        
<body class="grey darken-4 white-text">

    <section class="container center-align">
        <img src="Imagenes/Logo.png" alt="" id="logo_inicio">
        <hr>
        <h3>Agregar perfil</h3>
        <h6>Agrega un perfil para otra persona que ve geminy</h6>

        <div class="row">
            <form method="POST" action="guarda_perfil.jsp">
                <div class="row">
                    
                    <div class="input-field col s6 white-text">
                      <input id="nombre" type="text" name="nombre" class="validate white-text" required>
                      <label for="nombre">Nombre</label>
                    </div>
                    <div class="input-field col s6 m6">
                        <select class="icons" name="color" required>
                            <option value="" disabled selected>Escoge un color</option>
                            <option value="blue" data-icon="Imagenes/blue.PNG" class="left">Azul</option>
                            <option value="teal" data-icon="Imagenes/teal.PNG" class="left">Verde Azulado</option>
                            <option value="yellow" data-icon="Imagenes/yellow.PNG" class="left">Amarillo</option>
                            <option value="red" data-icon="Imagenes/red.PNG" class="left">Rojo</option>
                            
                        </select>
                        <label>Colores</label>
                    </div>
                    
                </div>
                 <button class="btn waves-effect waves-light  light-blue" type="submit" name="email" value="<%=email%>">Continuar</button>
             </form>
                

           

                
                <a class="btn waves-effect waves-light  light-blue" href="perfiles.jsp?email=<%=email%>">Cancelar</a>
                
        </div>

    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems);
        });

    </script>
</body>
</html>

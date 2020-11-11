/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;
import Entidades.Comentarios;
import Entidades.Contrato;
import Entidades.Pagos;
import Entidades.Programa;
import Entidades.Usuarios;
import Entidades.Perfiles;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.LinkedList;
import java.util.Date;  
import java.text.SimpleDateFormat;  
/**
 *
 * @author javi0
 */
public class Consultar {

    Connection conn;
    
    public Consultar(){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");
        }
        catch (ClassNotFoundException exf){
            System.out.println("Error al registrar el Driver de MYSql"+exf);
        }
        catch (SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (InstantiationException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (IllegalAccessException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    
    public LinkedList<Usuarios> ConsultarUsuarios(String email){
        
        
        LinkedList<Usuarios> users =  new LinkedList<Usuarios>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "SELECT*FROM clientes where cli_email= '" +email+ "'";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Usuarios user = new Usuarios();

                user.setCli_nombre(rset.getString("cli_nombre"));
                user.setCli_apellido(rset.getString("cli_apellido"));
                user.setCli_id(rset.getString("cli_id"));
                user.setCli_contraseña(rset.getString("cli_contraseña"));
                user.setCli_tarjeta_tipo(rset.getString("cli_tarjeta_tipo"));
                user.setCli_num_tarjeta(rset.getString("cli_num_tarjeta"));
                user.setCli_codigo(Integer.parseInt(rset.getString("cli_codigo")));
                user.setCli_email(rset.getString("cli_email"));
                
                users.add(user);
            }
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
    
    
     public LinkedList<Perfiles> ConsultarPerfiles(int codigo){
        
        
        LinkedList<Perfiles> users =  new LinkedList<Perfiles>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "SELECT perfil_nombre,color FROM perfiles where cliente_codigo = " +codigo+ " "; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            

            
            while(rset.next()){
                Perfiles user = new Perfiles();

                user.setNombre(rset.getString("perfil_nombre"));
                user.setColor(rset.getString("color"));
                users.add(user);
            }
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
     
    public LinkedList<Programa> Busqueda (String vista,String seleccion,int cod){
        //Seleccion = lo que se va a buscar dentro de la vista.
        //vista = vista a buscar (Por Generos, Actores, Edad)
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "execute p_búsqueda '"+ vista +"','"+ seleccion +"',"+cod+" "; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);

            while(rset.next()){
                Programa user = new Programa();
                
                user.setCodigo(Integer.parseInt(rset.getString("prog_codigo")));
                user.setNombre(rset.getString("prog_nombre"));
                user.setPrograma_tipo(rset.getString("prog_tipo"));
                user.setDescripcion(rset.getString("prog_descripcion"));
                user.setProg_imagen(rset.getString("prog_imagen"));
                user.setDuracion(Integer.parseInt(rset.getString("prog_duracion")));
                user.setImagen_fondo(rset.getString("imagen_fondo"));
                user.setVideo(rset.getString("prog_video"));
                user.setEdad_rec(rset.getString("prog_edad_rec"));
               //user.setGen_nombre(rset.getString("gen_nombre"));

                
                users.add(user);
            }
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
    
    
    public LinkedList<Programa> Consultar_programa (int cod){
        //Seleccion = lo que se va a buscar dentro de la vista.
        //vista = vista a buscar (Por Generos, Actores, Edad)
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select*from v_todo where prog_codigo= "+cod; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);

            while(rset.next()){
                Programa user = new Programa();
                
                user.setCodigo(Integer.parseInt(rset.getString("prog_codigo")));
                user.setEdad_rec(rset.getString("prog_edad_rec"));
                user.setNombre(rset.getString("prog_nombre"));
                user.setGen_nombre(rset.getString("gen_nombre"));
                user.setPrograma_tipo(rset.getString("prog_tipo"));
                user.setDuracion(Integer.parseInt(rset.getString("prog_duracion")));
                user.setDescripcion(rset.getString("prog_descripcion"));
                user.setProg_imagen(rset.getString("prog_imagen"));
                user.setImagen_fondo(rset.getString("imagen_fondo"));
                user.setVideo(rset.getString("prog_video"));
                
                users.add(user);
            }
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }   
    
    
    
    
        public LinkedList<Comentarios> Consultar_comentario (){
        
        LinkedList<Comentarios> users =  new LinkedList<Comentarios>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select*from comentarios"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            

            
            while(rset.next()){
                Comentarios user = new Comentarios();
                
                user.setEmail(rset.getString("cliente_email"));
                user.setComentario(rset.getString("comentario"));
                user.setCodigo_prog(Integer.parseInt(rset.getString("cod_programa")));
                users.add(user);
            }
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
        
        
        
        public boolean Consultar_favorito (int prog_codigo,String email){

        boolean resultado=false;
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select prog_nombre,prog_codigo from Clientes join Favoritos on Clientes.cli_email = cliente_email\n" +
                            "JOIN Programas ON Programas.prog_codigo = Favoritos.cod_programa "
                                + "where cli_email='"+email+"' and prog_codigo="+prog_codigo+""; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);

           if(rset.next()){
               resultado = true;
           }

            rset.close();
            stmt.close();
            conn.close();
            
            return resultado;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
        
    }
        
        
        
    public LinkedList<Programa> Programas_favoritos (String email){ //Devuelve los cod de los programas favoritos
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
           /* Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");*/

            String query = " select prog_codigo from Clientes join Favoritos on Clientes.cli_email = cliente_email\n" +
                                "JOIN Programas ON Programas.prog_codigo = Favoritos.cod_programa \n" +
                                    "where cli_email= '"+ email+"'"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Programa user = new Programa();
                user.setCodigo(Integer.parseInt(rset.getString("prog_codigo")));
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } /*catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }*/
        return users;
        
    }
    
        public LinkedList<Pagos> Consultar_pagos (String email){ //Devuelve los cod de los programas favoritos
        
        LinkedList<Pagos> users =  new LinkedList<Pagos>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select plan_tipo,pago_fecha,pago_monto from Clientes \n" +
                                "JOIN Contratos ON Clientes.cli_codigo = Contratos.cli_codigo\n" +
                                    "JOIN Pagos ON Pagos.cli_codigo = Contratos.cli_codigo\n" +
                                        "JOIN Planes ON Planes.plan_codigo = Pagos.plan_codigo where cli_email = '"+email+"'"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Pagos user = new Pagos();
                
                user.setPlan_tipo(rset.getString("plan_tipo"));
                user.setPago_fecha(rset.getString("pago_fecha"));
                user.setPago_monto(Double.parseDouble(rset.getString("pago_monto")));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
    
    /**
     *
     * @param email
     * @return
     */
    public LinkedList<Contrato> Consultar_Contrato (String email){
        
        LinkedList<Contrato> users =  new LinkedList<Contrato>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select plan_tipo,fin_fecha,plan_monto,Contratos.plan_codigo from Clientes \n" +
                                "JOIN Contratos ON Clientes.cli_codigo = Contratos.cli_codigo \n" +
                                    "JOIN Planes ON Contratos.plan_codigo = Planes.plan_codigo where cli_email = '"+email+"'"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Contrato user = new Contrato();
                
                user.setPlan_tipo(rset.getString("plan_tipo"));
                user.setFin_fecha(rset.getString("fin_fecha"));
                user.setPlan_monto(Double.parseDouble(rset.getString("plan_monto")));
                user.setPlan_cod(Integer.parseInt(rset.getString("plan_codigo")));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
    
    public LinkedList<Contrato> Consultar_planes (String plan){
        
        LinkedList<Contrato> users =  new LinkedList<Contrato>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select*from Planes WHERE NOT plan_tipo = '" + plan + "'"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Contrato user = new Contrato();
                
                user.setPlan_tipo(rset.getString("plan_tipo"));
                user.setPlan_monto(Double.parseDouble(rset.getString("plan_monto")));
                user.setPlan_cod(Integer.parseInt(rset.getString("plan_codigo")));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }


    public String estado_de_cuenta(String fecha){ //Recibe la fecha fin del contrato
        
        String estado="";
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");
                Date fecha_fin; 
                int result;
                LocalDate date = LocalDate.now(); //Fecha del Sistema
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyy-MM-dd");//Ajusta el formato.
                
                
                
                fecha_fin = new SimpleDateFormat("yyy-MM-dd").parse(fecha); //Conversion del String recibido a tipo Date.
                result = fecha_fin.compareTo(java.sql.Date.valueOf(date)); // Comparacion de la fecha fin del contrato con el sistema.
               
                //Si la fecha del sistema es mayor a la fecha fin del contrato devuelve un numero 0 o menor
                if(result<0){
                    estado = "Moroso";
                }
                else if(result>=0){ //Si la fecha del sistema es menor a la fecha fin del contrato devuelve un numero mayor que cero.
                    estado = "Activo";
                }
                
                
                //date.format(formatter)
                
            conn.close();

            return estado;
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }

        return estado;
    }

     public LinkedList<Programa> pelis_mas_vistas (){
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select TOP 4 prog_visto,count(*) from Programas_vistos where programa_tipo = 'Películas' group by prog_visto order by count(*) desc"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Programa user = new Programa();
                
                user.setCodigo(Integer.parseInt(rset.getString("prog_visto")));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }       

      public LinkedList<Programa> series_mas_vistas (){
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select TOP 4 prog_visto,count(*) from Programas_vistos where programa_tipo = 'Series' group by prog_visto order by count(*) desc"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Programa user = new Programa();
                
                user.setCodigo(Integer.parseInt(rset.getString("prog_visto")));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    } 
     
     
     public LinkedList<Programa> generos_mas_vistas (){
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select TOP 3 programa_genero,count(*) from Programas_vistos group by programa_genero order by count(*) desc"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Programa user = new Programa();
                
                user.setGen_nombre(rset.getString("programa_genero"));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }
 
     public LinkedList<Programa> consultar_genero (String gen_nombre){
        
        LinkedList<Programa> users =  new LinkedList<Programa>();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");

            String query = "select*from Generos where gen_nombre = '" + gen_nombre + "'"; 
      
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Programa user = new Programa();
                
                user.setProg_imagen(rset.getString("gen_imagen"));
                user.setGen_nombre(rset.getString("gen_nombre"));
                
                users.add(user);
            }
            
            rset.close();
            stmt.close();
            conn.close();
            
            return users;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
         } catch (ClassNotFoundException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
        
    }     
     
     
}

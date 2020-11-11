/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;
import Entidades.Usuarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Insertar {
    Connection conn;
    
    public Insertar(){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");
            
        }
        catch (ClassNotFoundException exf){
            System.out.println("Error al registrar el driver de MySQL:"+ exf);
        }
        catch(SQLException ex){
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (InstantiationException ex){
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (IllegalAccessException ex){
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        }
  
    }
    
    public int InsertarUsuario(Usuarios user){
        int resultado = 0;
        try{
       
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO clientes (cli_id,cli_nombre,cli_apellido,cli_num_tarjeta,cli_tarjeta_tipo,cli_contraseña,cli_email) "
                    + "VALUES('"+user.getCli_id()+"','"+user.getCli_nombre()+"','"+ user.getCli_apellido() +"','"+ user.getCli_num_tarjeta() +"',"
                    + "'"+ user.getCli_tarjeta_tipo()+"',"+ user.getCli_contraseña() +",'"+ user.getCli_email()+"')";
            resultado = stmt.executeUpdate(query);
           
            return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        } 
        return resultado;
    }
    
    
        public int InsertarPerfil(int codigo,String nombre,String color){
        int resultado = 0;
        try{
            
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO perfiles (perfil_nombre,cliente_codigo,color) "
                    + "VALUES('"+nombre+"',"+codigo+",'"+color+"')";
            resultado = stmt.executeUpdate(query);
           
            return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        } 
            
        return resultado;
    }
        
        public void InsertarContrato(Usuarios user,int cli_codigo){
        //int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO contratos (cli_codigo,plan_codigo) "
                    + "VALUES ("+cli_codigo+","+user.getPlan_codigo()+")";
            /*resultado =*/ stmt.executeUpdate(query);
           
            //return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        }
            
        //return resultado;
    }
        
    public void Insertar_pago(int plan,int cli_codigo,double pago){

        try{           
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO Pagos (cli_codigo,plan_codigo,pago_monto) "
                    + "VALUES (" + cli_codigo + "," + plan + "," + pago + ")";
             stmt.executeUpdate(query);
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        }

    }
        
        
        
        
        
        public void InsertarComentario(String email,String comentario,int codigo){
        //int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO Comentarios (comentario,cliente_email,cod_programa) "
                    + "VALUES ('"+comentario+"','"+email+"',"+codigo+")";
            /*resultado =*/ stmt.executeUpdate(query);
           
            //return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        } 
            
        //return resultado;
    }
        
        
        public void Insertar_favorito(String email,int codigo, int cod_cliente){
        //int resultado = 0;
        try{           
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO favoritos (cliente_email,cod_programa,cod_cliente)  "
                    + "VALUES ('"+email+"',"+codigo+","+cod_cliente+")";
            /*resultado =*/ stmt.executeUpdate(query);
           
            //return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        } 
            
        //return resultado;
    }
        
        public void insertar_programa_visto(String programa_tipo,String gen_nombre, int cli_cod,int prog_cod){
        //int resultado = 0;
        try{           
            Statement stmt = conn.createStatement();
            String query;
            query = "INSERT INTO Programas_vistos (programa_tipo,programa_genero,cli_codigo,prog_visto) "
                    + "VALUES ('" + programa_tipo + "','"+ gen_nombre +"',"+cli_cod+","+prog_cod+")";
            /*resultado =*/ stmt.executeUpdate(query);
           
            //return resultado;
        }
        catch (SQLException ex){
            System.out.println("Error al registrar el driver de MySQL: "+ex);
            Logger.getLogger(Insertar.class.getName()).log(Level.SEVERE,null,ex);
        } 
            
        //return resultado;
    }    
}


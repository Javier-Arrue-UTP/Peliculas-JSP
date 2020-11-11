/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author javi0
 */
public class Verificar {

    Connection conn;
    
    public Verificar(){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            this.conn = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-UH7R3KP:1433;databaseName=netflix","prueba","123");
        }
        catch (ClassNotFoundException exf){
            System.out.println("Error al registrar el Driver de MYSql"+exf);
        }
        catch (SQLException ex){
            Logger.getLogger(Verificar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (InstantiationException ex){
            Logger.getLogger(Verificar.class.getName()).log(Level.SEVERE,null,ex);
        }
        catch (IllegalAccessException ex){
            Logger.getLogger(Verificar.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    
    public boolean VerificarUsuario(String email, String contraseña){
               
        boolean control;
        control = true;
        try{
            String query = "SELECT*FROM clientes where cli_email = nancy@gmail.com and cli_contraseña = 123";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
           if(rset.next()){
               control = true;
           }
           else{
               control = false;
           }
            rset.close();
            stmt.close();
            conn.close();
            
            return control;
            
        }
        catch(SQLException ex){
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE,null,ex);
        return control;
        
        }
    }
}
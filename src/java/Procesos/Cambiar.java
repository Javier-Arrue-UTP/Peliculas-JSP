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
public class Cambiar {
    Connection conn;
    
        public Cambiar(){
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
    
    public void Cambiar_plan(int cli_cod,int plan_cod){
        try{
           String query = "update Contratos	\n" +
                            "set plan_codigo = "+plan_cod+" \n" +
                                "where cli_codigo ="+cli_cod+"";
           
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            rset.close();
            stmt.close();
            conn.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Cambiar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    public void Actualizar_contrato(int cli_cod){
        try{
           String query = "update Contratos\n" +
                            "set contra_fecha=getdate(),fin_fecha = dateadd(month,1,getdate())\n" +
                                "where cli_codigo = "+cli_cod+"";
           
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(query);
            
            rset.close();
            stmt.close();
            conn.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Cambiar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }    
        
        
        
}

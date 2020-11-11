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


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
/**
 *
 * @author javi0
 */
public class Conectar {
    Connection conn;
    
    public int open(){
        int done = 0;
        
        try{
            
            //Clase driver SQL
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            //Cadena de Conexion
            this.conn = DriverManager.getConnection("jdbc:sqlserver//DESKTOP-UH7R3KP:1433;DatabaseName=netflix","prueba","123");
            done = 1;
        }
        
        catch (ClassNotFoundException exf){
            System.out.println("Error al registrar el driver de SQLSERVER:"+exf);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Conectar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Conectar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Conectar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return done;
    }
    
}


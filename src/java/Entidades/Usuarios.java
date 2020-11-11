/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author javi0
 */
public class Usuarios {

    /**
     * @return the plan_codigo
     */
    public int getPlan_codigo() {
        return plan_codigo;
    }

    /**
     * @param plan_codigo the plan_codigo to set
     */
    public void setPlan_codigo(int plan_codigo) {
        this.plan_codigo = plan_codigo;
    }

    /**
     * @return the cli_num_tarjeta
     */
    public String getCli_num_tarjeta() {
        return cli_num_tarjeta;
    }

    /**
     * @param cli_num_tarjeta the cli_num_tarjeta to set
     */
    public void setCli_num_tarjeta(String cli_num_tarjeta) {
        this.cli_num_tarjeta = cli_num_tarjeta;
    }

    /**
     * @return the cli_id
     */
    public String getCli_id() {
        return cli_id;
    }

    /**
     * @param cli_id the cli_id to set
     */
    public void setCli_id(String cli_id) {
        this.cli_id = cli_id;
    }

    /**
     * @return the cli_nombre
     */
    public String getCli_nombre() {
        return cli_nombre;
    }

    /**
     * @param cli_nombre the cli_nombre to set
     */
    public void setCli_nombre(String cli_nombre) {
        this.cli_nombre = cli_nombre;
    }

    /**
     * @return the cli_apellido
     */
    public String getCli_apellido() {
        return cli_apellido;
    }

    /**
     * @param cli_apellido the cli_apellido to set
     */
    public void setCli_apellido(String cli_apellido) {
        this.cli_apellido = cli_apellido;
    }

    /**
     * @return the cli_tarjeta_tipo
     */
    public String getCli_tarjeta_tipo() {
        return cli_tarjeta_tipo;
    }

    /**
     * @param cli_tarjeta_tipo the cli_tarjeta_tipo to set
     */
    public void setCli_tarjeta_tipo(String cli_tarjeta_tipo) {
        this.cli_tarjeta_tipo = cli_tarjeta_tipo;
    }

    /**
     * @return the cli_contraseña
     */
    public String getCli_contraseña() {
        return cli_contraseña;
    }

    /**
     * @param cli_contraseña the cli_contraseña to set
     */
    public void setCli_contraseña(String cli_contraseña) {
        this.cli_contraseña = cli_contraseña;
    }

    /**
     * @return the cli_codigo
     */
    public int getCli_codigo() {
        return cli_codigo;
    }

    /**
     * @param cli_codigo the cli_codigo to set
     */
    public void setCli_codigo(int cli_codigo) {
        this.cli_codigo = cli_codigo;
    }
    
    public void setCli_email(String cli_email){
        this.cli_email = cli_email;
    }
    public String getCli_email(){
        return cli_email;
    }
 
            
    private String cli_id,cli_nombre,cli_apellido,cli_num_tarjeta,cli_tarjeta_tipo,cli_contraseña,cli_email;
    private int cli_codigo,plan_codigo; //identity PK de la tabla usuarios

    
}

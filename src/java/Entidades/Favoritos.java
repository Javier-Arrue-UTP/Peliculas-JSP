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
public class Favoritos {

    /**
     * @return the favorito
     */
    public String getFavorito() {
        return favorito;
    }

    /**
     * @param favorito the favorito to set
     */
    public void setFavorito(String favorito) {
        this.favorito = favorito;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the codigo_prog
     */
    public int getCodigo_prog() {
        return codigo_prog;
    }

    /**
     * @param codigo_prog the codigo_prog to set
     */
    public void setCodigo_prog(int codigo_prog) {
        this.codigo_prog = codigo_prog;
    }
    
    
    
    
    
    private String favorito;
    private String email;
    private int codigo_prog;
}

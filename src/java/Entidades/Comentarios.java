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
public class Comentarios {

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

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
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
    private String comentario;
    private String email;
    private int codigo_prog;
}

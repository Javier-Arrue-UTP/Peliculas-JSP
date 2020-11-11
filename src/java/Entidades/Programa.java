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
public class Programa {

    /**
     * @return the gen_nombre
     */
    public String getGen_nombre() {
        return gen_nombre;
    }

    /**
     * @param gen_nombre the gen_nombre to set
     */
    public void setGen_nombre(String gen_nombre) {
        this.gen_nombre = gen_nombre;
    }

    /**
     * @return the edad_rec
     */
    public String getEdad_rec() {
        return edad_rec;
    }

    /**
     * @param edad_rec the edad_rec to set
     */
    public void setEdad_rec(String edad_rec) {
        this.edad_rec = edad_rec;
    }

    /**
     * @return the imagen_fondo
     */
    public String getImagen_fondo() {
        return imagen_fondo;
    }

    /**
     * @param imagen_fondo the imagen_fondo to set
     */
    public void setImagen_fondo(String imagen_fondo) {
        this.imagen_fondo = imagen_fondo;
    }

    /**
     * @return the video
     */
    public String getVideo() {
        return video;
    }

    /**
     * @param video the video to set
     */
    public void setVideo(String video) {
        this.video = video;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the programa_tipo
     */
    public String getPrograma_tipo() {
        return programa_tipo;
    }

    /**
     * @param programa_tipo the programa_tipo to set
     */
    public void setPrograma_tipo(String programa_tipo) {
        this.programa_tipo = programa_tipo;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the duracion
     */
    public int getDuracion() {
        return duracion;
    }

    /**
     * @param duracion the duracion to set
     */
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    /**
     * @return the prog_imagen
     */
    public String getProg_imagen() {
        return prog_imagen;
    }

    /**
     * @param prog_imagen the prog_imagen to set
     */
    public void setProg_imagen(String prog_imagen) {
        this.prog_imagen = prog_imagen;
    }

    
    private String nombre,programa_tipo,descripcion,prog_imagen,imagen_fondo,video,edad_rec,gen_nombre;
    private int codigo,duracion;
    
    
}

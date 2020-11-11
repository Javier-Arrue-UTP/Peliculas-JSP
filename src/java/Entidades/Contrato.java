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
public class Contrato {

    /**
     * @return the plan_cod
     */
    public int getPlan_cod() {
        return plan_cod;
    }

    /**
     * @param plan_cod the plan_cod to set
     */
    public void setPlan_cod(int plan_cod) {
        this.plan_cod = plan_cod;
    }
    
    /**
     * @return the plan_tipo
     */
    public String getPlan_tipo() {
        return plan_tipo;
    }

    /**
     * @param plan_tipo the plan_tipo to set
     */
    public void setPlan_tipo(String plan_tipo) {
        this.plan_tipo = plan_tipo;
    }

    /**
     * @return the fin_fecha
     */
    public String getFin_fecha() {
        return fin_fecha;
    }

    /**
     * @param fin_fecha the fin_fecha to set
     */
    public void setFin_fecha(String fin_fecha) {
        this.fin_fecha = fin_fecha;
    }

    /**
     * @return the plan_monto
     */
    public double getPlan_monto() {
        return plan_monto;
    }

    /**
     * @param plan_monto the plan_monto to set
     */
    public void setPlan_monto(double plan_monto) {
        this.plan_monto = plan_monto;
    }
    private String plan_tipo;
    private String fin_fecha;
    private double plan_monto;
    private int plan_cod;
}

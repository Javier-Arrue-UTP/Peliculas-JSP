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
public class Pagos {

    /**
     * @return the pago_monto
     */
    public double getPago_monto() {
        return pago_monto;
    }

    /**
     * @param pago_monto the pago_monto to set
     */
    public void setPago_monto(double pago_monto) {
        this.pago_monto = pago_monto;
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
     * @return the pago_fecha
     */
    public String getPago_fecha() {
        return pago_fecha;
    }

    /**
     * @param pago_fecha the pago_fecha to set
     */
    public void setPago_fecha(String pago_fecha) {
        this.pago_fecha = pago_fecha;
    }

    
    private String plan_tipo;
    private String pago_fecha;
    private double pago_monto;
}

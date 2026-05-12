package org.efectivale.model;

public class Consignatario {

    private Integer clienteId;

    private Integer consignatarioId;

    private String consignatarioNombre;

    private Boolean consignatarioActivo;

    // getters y setters

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public Integer getConsignatarioId() {
        return consignatarioId;
    }

    public void setConsignatarioId(Integer consignatarioId) {
        this.consignatarioId = consignatarioId;
    }

    public String getConsignatarioNombre() {
        return consignatarioNombre;
    }

    public void setConsignatarioNombre(String consignatarioNombre) {
        this.consignatarioNombre = consignatarioNombre;
    }

    public Boolean getConsignatarioActivo() {
        return consignatarioActivo;
    }

    public void setConsignatarioActivo(Boolean consignatarioActivo) {
        this.consignatarioActivo = consignatarioActivo;
    }
}
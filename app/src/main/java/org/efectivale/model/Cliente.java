package org.efectivale.model;

public class Cliente {

    private Integer clienteId;
    private String clienteNombre;
    private Boolean clienteActivo;

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }

    public Boolean getClienteActivo() {
        return clienteActivo;
    }

    public void setClienteActivo(Boolean clienteActivo) {
        this.clienteActivo = clienteActivo;
    }
}
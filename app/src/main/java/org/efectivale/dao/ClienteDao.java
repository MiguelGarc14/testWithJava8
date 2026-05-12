package org.efectivale.dao;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

import org.efectivale.model.Cliente;

@Repository
public class ClienteDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Cliente> obtenerUltimos() {

        return jdbcTemplate.query(
                "SELECT * FROM sp_consultar_clientes()",
                (rs, rowNum) -> {

                    Cliente c = new Cliente();

                    c.setClienteId(
                            rs.getInt("clienteid")
                    );

                    c.setClienteNombre(
                            rs.getString("clientenombre")
                    );

                    c.setClienteActivo(
                            rs.getBoolean("clienteactivo")
                    );

                    return c;
                }
        );
    }

    public Integer agregar(Cliente cliente) {

        return jdbcTemplate.queryForObject(

                "SELECT sp_agregar_cliente(?, ?)",

                Integer.class,

                cliente.getClienteNombre(),

                cliente.getClienteActivo()
        );
    }
}
package org.efectivale.dao;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

import org.efectivale.model.Consignatario;
@Repository
public class ConsignatarioDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Consignatario> obtenerUltimos() {

        return jdbcTemplate.query(

                "SELECT * FROM sp_consultar_consignatarios()",

                (rs, rowNum) -> {

                    Consignatario c =
                            new Consignatario();

                    c.setClienteId(
                            rs.getInt("clienteid")
                    );

                    c.setConsignatarioId(
                            rs.getInt("consignatarioid")
                    );

                    c.setConsignatarioNombre(
                            rs.getString(
                                    "consignatarionombre"
                            )
                    );

                    c.setConsignatarioActivo(
                            rs.getBoolean(
                                    "consignatarioactivo"
                            )
                    );

                    return c;
                }
        );
    }

    public Integer agregar(
            Consignatario consignatario) {

        return jdbcTemplate.queryForObject(

                "SELECT sp_agregar_consignatario(?,?,?)",

                new Object[] {

                        consignatario.getClienteId(),

                        consignatario.getConsignatarioNombre(),

                        consignatario.getConsignatarioActivo()

                },
                Integer.class
        );
    }
}
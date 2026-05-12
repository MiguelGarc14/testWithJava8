package org.efectivale.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import org.efectivale.dao.ConsignatarioDao;
import org.efectivale.model.Consignatario;

@Service
public class ConsignatarioService {

    @Autowired
    private ConsignatarioDao consignatarioDao;

    public List<Consignatario> obtenerUltimos() {

        return consignatarioDao.obtenerUltimos();
    }

    public Integer guardar(
            Consignatario consignatario) {

        return consignatarioDao.agregar(consignatario);
    }
}
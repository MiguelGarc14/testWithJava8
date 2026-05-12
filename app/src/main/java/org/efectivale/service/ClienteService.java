package org.efectivale.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import org.efectivale.dao.ClienteDao;
import org.efectivale.model.Cliente;

@Service
public class ClienteService {

    @Autowired
    private ClienteDao clienteDao;

    public List<Cliente> obtenerUltimos() {
        return clienteDao.obtenerUltimos();
    }

    public Integer guardar(Cliente cliente) {
        return clienteDao.agregar(cliente);
    }
}
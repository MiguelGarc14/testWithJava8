package org.efectivale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import java.util.HashMap;

import org.efectivale.service.ClienteService;
import org.efectivale.model.Cliente;

@Controller
@RequestMapping("/clientes")
public class ClienteController {

    @Autowired
    private ClienteService clienteService;

    @GetMapping
    public String vistaClientes(Model model) {

        model.addAttribute(
                "clientes",
                clienteService.obtenerUltimos()
        );

        return "clientes";
    }

    @PostMapping("/guardar")
    @ResponseBody
    public Map<String, Object> guardar(
            @RequestBody Cliente cliente) {

        Map<String, Object> response =
                new HashMap<>();

        try {

            Integer clienteId =
                    clienteService.guardar(cliente);

            response.put("success", true);
            response.put("clienteId", clienteId);
            response.put("message", "Cliente agregado");
            response.put("clienteNombre", cliente.getClienteNombre());

        } catch(Exception e) {

            response.put("success", false);
            response.put("message", e.getMessage());
        }

        return response;
    }
}
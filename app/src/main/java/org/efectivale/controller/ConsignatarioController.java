package org.efectivale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import java.util.HashMap;

import org.efectivale.service.ConsignatarioService;
import org.efectivale.model.Consignatario;

@Controller
@RequestMapping("/consignatarios")
public class ConsignatarioController {

    @Autowired
    private ConsignatarioService
            consignatarioService;

    @GetMapping
    public String vista(
            Model model) {

        model.addAttribute(

                "consignatarios",

                consignatarioService.obtenerUltimos()
        );

        return "consignatarios";
    }

    @PostMapping("/guardar")
    @ResponseBody
    public Map<String, Object> guardar(
            @RequestBody Consignatario consignatario
    ) {

        Map<String, Object> response =
                new HashMap<>();

        try {

            Integer consignatarioId =  consignatarioService.guardar(consignatario);

            consignatario.setConsignatarioId(consignatarioId);

            response.put("success", true);

            response.put("message", "Consignatario agregado");

            response.put("consignatario", consignatario);

        } catch(Exception e) {

            response.put("success", false);

            response.put(
                    "message",
                    e.getMessage()
            );
        }

        return response;
    }
}
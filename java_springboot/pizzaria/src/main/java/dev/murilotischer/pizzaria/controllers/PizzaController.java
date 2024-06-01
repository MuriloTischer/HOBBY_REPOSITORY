package dev.murilotischer.pizzaria.controllers;

import dev.murilotischer.pizzaria.controllers.services.PizzaService;
import dev.murilotischer.pizzaria.model.entity.DTO.PizzaDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(name = "/pizzas") //indica/mapeia o caminho(endereço) que a pagina deve acessar
@RequiredArgsConstructor
public class PizzaController {
    private final PizzaService pizzaService;
    @PostMapping
    public void cadastrar(@RequestBody PizzaDTO dto){
        pizzaService.criarPizza(dto);
    }
}

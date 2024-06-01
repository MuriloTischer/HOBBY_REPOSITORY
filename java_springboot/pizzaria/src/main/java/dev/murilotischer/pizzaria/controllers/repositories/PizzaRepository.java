package dev.murilotischer.pizzaria.controllers.repositories;

import dev.murilotischer.pizzaria.model.entity.Pizza;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PizzaRepository extends JpaRepository<Pizza, Long> {

}

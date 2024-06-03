package dev.murilotischer.pizzaria.model.entity.DTO;

import dev.murilotischer.pizzaria.model.enums.TipoSabor;
import dev.murilotischer.pizzaria.model.enums.TipoTamanho;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PizzaDTO {
    private Long id;
    @NotBlank
    private String nome;
    @Positive
    private double preco;
    private boolean disponivel;
    private TipoSabor tipoSabor;
    private TipoTamanho tipoTamanho;
}

// DTO = Data Transfer Object
// Cliente -- API -- Servidor/Database

/** Cliente -- API -> tudo que entra na API é DTO
 * pede informaçao/registro (ex: quantos funcionarios tem na empresa)
 * um registro não tem q enviar o id, e-mail completo, numero de cartao ou seja a ideia do DTO é fazer a converão de dados e trazer apenas o que importa.
 */

// API -- Cliente -> tudo que sai da API é DTO

// API -- Servidor/Database Tudo que vai da API para o banco de dados, tem que ser uma entidade

//  Servidor/Database -- API -> Tudo que sai do banco de dados para a API tem que ser uma entidade

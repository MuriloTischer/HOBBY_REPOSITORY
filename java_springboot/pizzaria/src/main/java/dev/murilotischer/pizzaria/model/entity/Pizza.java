package dev.murilotischer.pizzaria.model.entity;

import dev.murilotischer.pizzaria.model.enums.TipoSabor;
import dev.murilotischer.pizzaria.model.enums.TipoTamanho;
import jakarta.persistence.*;
import lombok.*;

@Entity //informa que a class é uma entidade
@Table(name = "tb_pizza") //gera o nome da entidade no banco de dados
//anotaçoes lombok
@Data //essa anotaçao engloba varias anotaçoes -> getter, setter, EqualsAndHashCode, ToString, RequiredArgsConstructor
@AllArgsConstructor //para informaçoes de contrutores da entidade
@NoArgsConstructor //para informaçoes de contrutores da entidade
//@Getter //cria os getters das propriedades
//@Setter //cria os setters das propriedades
//@EqualsAndHashCode //responsavel por criar uma indicaçao entre os registros criados pela entidade caso necessario
public class Pizza {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nome;
    private double preco;
    private boolean disponivel;
    @Enumerated(EnumType.STRING)
    private TipoSabor tipoSabor;
    @Enumerated(EnumType.STRING)
    private TipoTamanho tipoTamanho;

}



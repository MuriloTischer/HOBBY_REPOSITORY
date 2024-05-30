/**
 * O dart aceita apenas duas formas de construtores, 
 * o construtor padrao e o nomeado
 */

class Pessoa {
  String? nome;
  int? idade;
  String? sexo;

// informa-se required no parametro do construtor para informar que é obrigatorio informa-lo
  //construtor padrao
  Pessoa({
    required this.nome,
    required this.idade,
    required this.sexo,
  });

  //contrutor nomeado
  // para criar um segundo contrutor com menos ou mais informaçoes, é necessario criar um construtor nomeado
  Pessoa.nomeado({
    required this.idade,
    required this.sexo,
  });

  //contrutor factory
  //o construtor do tipo factory chamara o metodo que fara uma logica ou uma regra de negocio antes de criar o contrutor
  // é utilizado quando temos uma regra de negocio para criaçao da nossa classe
  Pessoa.vazia();

  factory Pessoa.fabrica(String nomeConstrutor) {
    var nomeFactory = nomeConstrutor + '_Fabrica';
    var pessoa = Pessoa.vazia();
    pessoa.nome;
    return pessoa;
  }
}

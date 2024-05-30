// caracteristicas

class Camiseta {
  String tamanho = 'G';
  String cor = 'Preta';
  String marca = 'Nike';

// para transformar um atributo ou metodos em privado no Dart, 
//informa-se o underline na frente do nome do atributo ou metodo
    String? _cor; 


//atributo static sao os atributos que em teoria nao mudam,
//que nao sofrerao alteraçoes, devem ser unicos e constantes
//eles nao precisam ser instanciados, pois sao atributos de classe.
//ex: atributo de classe
  static String nome = 'Camiseta'; //obs: nessa forma, mesmo sendo static ele ainda pode sofrer alteraçao

//atributos staticos devem ser sempre que possivel e na maioria das vezes também como const
// ficando static const, dessa forma o valor do atributo nao sofrera alteraçoes indevidas
//ou dispercebidas que poderao causar um grande problema em trocas de insformaçoes erradas
  static const String nomeStatico = 'Camiseta'; //com isso o compilador nao permitirar qualquer alteraçao despercebida e desavisada

//metodo de classe
  static String recuperarNome() => nome;

  String? get cor1 => _cor;
  set cor1(String? cor1) {
    if (cor1 == 'Vermelho') {
      throw Exception('Nao pode ser vermelho');
    }
  }

//comportamentos
// funçoes sao os metodos dentro das classes
  String tipoDeLavagem() {
    if (marca == 'Nike') {
      return 'nao pode lavar na maquina';
    } else {
      return 'pode lavar na maquina';
    }
  }
}

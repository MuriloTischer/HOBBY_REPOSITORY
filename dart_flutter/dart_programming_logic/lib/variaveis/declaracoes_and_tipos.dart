void main() {
  //numericos (num, int, double)
  num valorGenerico = 10;
  num valorGenerico2 = 10.0;
  int idade = 10;
  double preco = 10.0;

  // cadeia de caracteres (String)
  String nome = 'Fulano de Tal';

  // booleanos (bool) (verdadeiro ou falso)
  bool isAluno = true;
  bool isProfessor = false;

  //Listas (List) (Array)
  List<String> listaNomes = ['Fulano', 'Ciclano', 'Beltrano'];

  print(listaNomes.length); // 3

  print(listaNomes[0]); // Fulano
  print(listaNomes[1]); // Ciclano
  print(listaNomes[2]); // Beltrano

  //Mapas (Map) (Dicionário)
  Map<String, dynamic> pessoa = {
    'nome': 'Fulano de Tal',
    'idade': 30,
    'isAluno': true,
    'isProfessor': false
  };

  print(pessoa['nome']); // Fulano de Tal
  print(pessoa['idade']); // 30
  print(pessoa['isAluno']); // true
  print(pessoa['isProfessor']); // false

  //Funções (Function)
  void imprimirNome() {
    print('Fulano de Tal');
  }

  imprimirNome();

  //Funções com parâmetros
  void imprimirNomeParametro(String nome) {
    print(nome);
  }

  imprimirNomeParametro('Fulano de Tal');

  //Funções com retorno
  String retornarNome() {
    return 'Fulano de Tal';
  }

  print(retornarNome());

  //Funções com parâmetros e retorno
  String retornarNomeParametro(String nome) {
    return nome;
  }

  print(retornarNomeParametro('Fulano de Tal'));
}

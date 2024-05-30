void main(List<String> args) {
  //map é uma representaçao de chave : valor
  final paciente = <String, String>{
    'nome': 'Murilo Tischer',
  };

  //o mapa pode ser nulo mas se for criado deve conter a chave e o valor nao nulos
  Map<String, String>? pacienteNullSafety = null;

  // o mapa e o valor nao podem ser nulos mas a chave pode ser nula
  var pacienteNullSafety2 = <String?, String>{
    null: 'Murilo',
  };

  //o mapa e a chave nao podem ser nuulos mas o valor pode ser nulo
  var pacienteNullSafety3 = <String, String?>{
    'nome': null,
  };

  var produtos = <String, String>{};
  //só sera adicionado se a chave nao existir
  produtos.putIfAbsent('nome', () => 'Cerveja');
  print(produtos);

  produtos.update('nome', (value) => 'Refrigerante');
  print(produtos);

  //se nao existe determinado valor ou chave dentro do mapa, usa-se o ifAbsent como forma de informar e criar um novo "valor", nesse vaso foi informado o preco e passado o valor para ele
  produtos.update('preco', (value) => '10', ifAbsent: () => '10');

  //Recuperando o valor
  print('Produto ${produtos['nome']}');

  produtos.forEach((key, value) {
    print('Chave: $key: $value');
  });

//para fazer algum processo asyncrono, usa-se o for-in
  for (var entry in produtos.entries) {
    print('Chave: ${entry.key}: ${entry.value}');
  }

  var novoMap = produtos.map((key, value) {
    return MapEntry(key, value.toUpperCase());
  });
  print(novoMap);
}

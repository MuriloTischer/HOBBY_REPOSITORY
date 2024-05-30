import 'dart:convert';

import 'package:consumo_api/controller/alunos_controller.dart';
import 'package:consumo_api/models/telefone.dart';

void main() {
  //AlunoController().findAll();
  //AlunoController().findById('1');
  //AlunoController().update();
  AlunoController().insert();
  
}

void main2(List<String> args) {
  String cidadeJson = '''
{
  "id" : 1,
  "nome": "Leme"
}
''';
// se for um json que começa com [] => ele retorna um => List
//se for um json que começa com {} => ele retorna um => Map
//obs. todas as chaves do json, sempre serão uma String MAP<STRING> a chave da propriedade sempre precisa ser uma String
// e se cada propriedade pode ser algum outro tipo diferente de String,
// então é preciso deixar como dynamic, pois o objeto dynamic pode ser qualquer coisa,
// assim quando o dynamic identificar qual o objeto que esta sendo retornado
//ele irá criar o objeto da maneira correta.

  final cidadeMap = json.decode(cidadeJson);

  print(cidadeMap.runtimeType);
  print(cidadeMap);

  //para imprimir quando for uma lista lista,
  // le-se a lista utilizando um foreach
  //exemplo  ->
  //           cidadeMap.forEach((city) => print(city['nome']));//, ['regiao']

  final telefoneJson =
      ''' 
  {
    "ddd" = 11,
    "telefone" = "989262626"  
  }
  ''';

  final telefone = Telefone.fromJson(telefoneJson);

  print(telefone.ddd);
  print(telefone.telefone);
  print(telefone.toJson());
  print(telefone.toMap());
}

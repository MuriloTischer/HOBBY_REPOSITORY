import 'package:dart_poo/2_construtores/pessoa.dart';

void main(List<String> args) {
  //chamando as propriedades da classe Pessoa pelo construtor sem a obrigatoriedade do required
  // var pessoa = Pessoa(
  //   'Murilo', 35, 'Masculino'
  // );

//chamando as propriedades da classe Pessoa pelo construtor com a obrigatoriedade do required
  var pessoa = Pessoa(
    nome: 'Murilo',
    idade: 35,
    sexo: 'Masculino',
  );
  print(pessoa.nome);

  //chamando construtor nomeado
  var pessoaNomeado = Pessoa.nomeado(
    idade: 35,
    sexo: 'Masculino',
  );

  var pessoaFabrica = Pessoa.fabrica('Murilo');
}

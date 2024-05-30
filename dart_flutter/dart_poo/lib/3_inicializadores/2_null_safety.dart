import 'package:dart_poo/3_inicializadores/cliente.dart';

late final String nome;

/**
 * TOME CUIDADO COM O LATE E O ! (FORCE NON NULL)
 */
void main(List<String> args) {
  var cliente = Cliente(nome: 'Murilo');
  print(cliente.nome);
  // cliente.nome = 'Tischer';
  print(cliente.nome);
  if(cliente.idade != null){
  print(cliente.idade!.toLowerCase());

  }

  nome = 'Murilo T';
  print(nome);
  nome = 'Tischer';
}

import 'package:dart_poo/4_heranca/cachorro.dart';

void main(List<String> args) {
  var cachorro = Cachorro(idade: 10);
  cachorro.tamanho = 'Pequeno';
  print(cachorro.calcularIdadeHumana());
  print(cachorro.recuperarIdade());
  print('''
Cachorro: 
Tamanho: ${cachorro.tamanho}
idade: ${cachorro.idade}
Idade Humana: ${cachorro.calcularIdadeHumana()}
''');
}

import 'package:dart_poo/8_interfaces/carro.dart';
import 'package:dart_poo/8_interfaces/gol.dart';
import 'package:dart_poo/8_interfaces/uno.dart';

void main(List<String> args) {
  var uno = Uno();
  var gol = Gol();

  // print(uno.velocidadeMaxima());
  // print(gol.velocidadeMaxima());

  printarDadosDoCarro(uno);
  printarDadosDoCarro(gol);
}

void printarDadosDoCarro(Carro carro) {
  print('''
Carro ->
Tipo: ${carro.runtimeType}
Portas: ${carro.portas}
Rodas: ${carro.rodas}
Motor: ${carro.motor}
VelocidadeMaxima: ${carro.velocidadeMaxima()},
''');
}

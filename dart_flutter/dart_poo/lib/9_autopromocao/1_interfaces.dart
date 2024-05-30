import 'package:dart_poo/8_interfaces/carro.dart';
import 'package:dart_poo/8_interfaces/gol.dart';
import 'package:dart_poo/8_interfaces/uno.dart';

//Atributos de tipo superior e atributos de classe
// nao sao auto-promovidos para o tipo checado
Carro golCarro2 = Gol();

void main(List<String> args) {
  var uno = Uno();
  var gol = Gol();

  Carro golCarro = Gol();

//quando checamos se a variavel (is)é de um tipo
//caso ela seja, o dart vai automaticamente converter
//essa instancia para a classe do tipo
  if (golCarro is Gol) {
    golCarro.tipoDeRodas();
  }

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
Tipo de Rodas: ${carro is Gol ? carro.tipoDeRodas() : 'nao disponivel'}
''');
}

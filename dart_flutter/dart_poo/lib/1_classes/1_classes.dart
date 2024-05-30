import 'package:dart_poo/1_classes/camiseta.dart';

void main(List<String> args) {
  //Camiseta camisetaNike = new Camiseta();
  // no DART nao é necessario passar o Tipo da classe e também
  // para iniciar uma nova instancia nao é necessario informar a representaçao NEW

  // o modelo abaixo representa como pode ser informado e passado uma nova instancia da classe
  var camiseta =
  Camiseta(); // dessa forma o dart ja entende que é uma nova instancia da classe "Camiseta"
  camiseta.tamanho;
  camiseta.cor;
  camiseta.marca;

//print chamando atributos e metodo static
  print(Camiseta.nome);
  print(Camiseta.recuperarNome());

  print('''
Camista:
Tamanho: ${camiseta.tamanho}
Cor: ${camiseta.cor}
Marca: ${camiseta.marca}
tipoDeLavagem: ${camiseta.tipoDeLavagem()}
''');
}

import 'dart:ffi';

String? nome;

void main() {
  //(a partir dos 5 min do video )

  /*
  * para verificar se a variavel é null, 
  * é necessario fazer uma verificaçao condicional
  * e forçar a variavel superior (usando exclamação)
  * para dizer que essa variavel não é null
  */

  // condicional usando ternario
  var nomeCompleto = ((nome != null) ? nome! + 'Murilo' : 'Murilo Tischer');
  print(nomeCompleto);

  // ou
  String nomeCompleto2;
  if (nome != null) {
    nomeCompleto2 = nome! + 'Murilo';
  } else {
    nomeCompleto2 = 'Murilo Tischer';
  }
  print(nomeCompleto2);

  var nomeLocal = nome;
  if (nomeLocal == null) {
    nomeLocal = 'Murilo';
  }
  var nomeCompleto3 = nomeLocal + 'Tischer';

  print(nomeCompleto3);
}

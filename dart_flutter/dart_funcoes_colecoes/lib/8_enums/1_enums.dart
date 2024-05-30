void main(List<String> args) {
  var cor = Cores.azul;
  if (cor == Cores.azul) {
    print('the color is blue');
  }
  var azul = 'azul';
  //a partir do dart 2.15
  var corAzul = Cores.values.byName(azul);
  print(corAzul);

  var coresMap =
      Cores.values.asMap(); // jeito antigo de chamar um enum para o Map
  print(coresMap);

  var CoresNameMap =
      Cores.values.asNameMap(); // jeito antigo de chamar um enum para o Map
  print(CoresNameMap);
}

enum Cores {
  azul,
  amarelo,
  branco,
  verde,
}

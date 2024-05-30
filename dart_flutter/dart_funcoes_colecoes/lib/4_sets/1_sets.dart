void main(List<String> args) {
  var numerosLista = [];
  numerosLista.add(1);
  numerosLista.add(2);
  numerosLista.add(3);
  numerosLista.add(null);
  numerosLista.add(1);
  numerosLista.add(2);
  print(numerosLista);

  var numeroSet = <int?>{};
  numeroSet.add(1);
  numeroSet.add(2);
  numeroSet.add(3);
  numeroSet.add(3);
  numeroSet.add(null);
  numeroSet.add(1);
  numeroSet.add(2);
  print(numeroSet);

  print('.toSet()');
  print(numerosLista.toSet());

  numeroSet.forEach(print);

  var numero1 = {1, 2, 3, 4, 5, 6};
  var numero2 = {1, 3, 4, 7};
  print('.different()');
  print(numero1.difference(numero2));
  print('----');
  print(numero2.difference(numero1));
  print('----');
  print('.union');
  print(numero1.union(numero2));
  print('----');
  print('.intersection');
  print(numero1.intersection(numero2));
  print('----');
  print('.lookup');
  print(numero1.lookup(2));


}

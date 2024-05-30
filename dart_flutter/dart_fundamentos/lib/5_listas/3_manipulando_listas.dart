void main(List<String> args) {
  final numeros = [1, 2, 3, 4];
  print(numeros);
  numeros.add(1);
  print(numeros);

  final nomes = ['Murilo', 'Mauricio', 'Maria'];
  print(nomes);
  nomes.add('Tati');
  //addAll([]) //? para adicionar novos itens na lista
  print(nomes);
  print(nomes[
      1]); // passa o valor do indice da lista para buscar um item especifico dentro dela.
  print('Adicionando Lucas na lista');
  nomes.insert(0, 'Lucas');
  print(nomes);
  print(nomes[0]);

  //nomes.insertAll(index, element) //? para inserir uma lista de itens

  nomes.remove('Lucas');
  print(nomes);

  nomes.removeWhere((nome) {
    // tudo que tem Where recebe uma funcao que retorna true ou false
    print('Nome procurado $nomes');
    if (nomes == 'Murilo') {
      return true;
    } else {
      return false;
    }
  });
  print(nomes);

  //para fazer uma busca dentro da lista
  //print(nomes[0]); <-  substitui isso, por
  print(nomes.first);

  //print(nomes[nomes.lenght - 1]); <- substituir isso, por
  print(nomes.last);

  // geranddo listas
  final numerosGerados = List.generate(10, (index) => index + 1);
  print(numerosGerados);
  final stringsGerados = List.generate(10, (index) => 'Indice ${index + 1}');
  print(stringsGerados);

  // gerando itens repetidos
  final repeticoes = List.filled(10, '');
  print(repeticoes);

  //gerando calculos com list
  final numerosGeradosParaCalculo = List.generate(100, (index) => index + 1);

  //.fold -> em outras linguagens é conhecido como reduz (um calculo)
  //.fold sozinho transforma a variavel em um tipo generico que é object, pode ser necessario informar
  // o que será usado, ficando por exemplo .fold<int>, que indicará que a variavel é de um tipo inteiro
  var soma = numerosGeradosParaCalculo.fold<int>(
    0,
    (previousValue, numero) => previousValue = previousValue + numero,
  );
  print(soma);

  //Spread operator, que nada mais é que o famoso 3 pontos --> (...)
  //serve para adicionar uma lista dentro de outra lista
  //ao inves de usar um addAll, é possivel usar o spread,
  //por ex: ao criar uma lista.
  //var lista1 = [1,2,3, (use os 3 pontos e em seguida a outra lista desejada)...outraLista]
  var listaNumerosSpreadB = [4, 5, 6];
  var listaNumerosSpread = [1, 2, 3, ...listaNumerosSpreadB];
  print(listaNumerosSpread);

  //collection if
  //é um condicional que pode ser feito dentro da própria lista
  //permitindo ser adionado ou não adicionado algo na lista
  var promocaoAtiva = true;
  var produto = [
    'cerveja',
    'refrigerante',
    if (promocaoAtiva) 'suco de laranja'
  ];
  print(produto);

  // collection for
  //te permite fazer coisas(percorrer e gerar uma lista baseado em um looping) no momento da criaçao da lista
  var listaInts = [1, 2, 3];
  var listaStrings = ['#0', '#1', for (var i in listaInts) '#$i'];
  print(listaStrings);

//lista.join() --> serve para juntar algo
  var string = listaStrings.join(' -> ');
  print(string);
}

void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  var nomes = ['Murilo', 'Tadeu', 'Domingos', 'Tischer'];

  /*
  * Esse tipo de for ( o for-i), é mais usado quando for necessario fazer um tratamento
  * quando necessitar de uma condição para executar ou não executar o looping
  */
  print('Imprimindo numeros com for convencional');
  for (var i = 0; i < numeros.length; i++) {
    print(numeros[i]);
  }

  print('Imprimindo nomes com for convencional');
  for (var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
  }

//usando o break, sera printado todas as condiçoes (nomes),
//até encontrar a condiçao especificada dentro do if
//sempre que precisar controlar o indice do looping, será necessario usar o for-i(convencional)

  print('Imprimindo nomes com for convencional e break');
  for (var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
    if (nomes[i] == 'Domingos') {
      break;
    }
  }
  print('Imprimindo nomes com for convencional e break');
  for (var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
    if (i == 1) {
      break;
    }
  }

  /*
   * O for-in funciona pegando os numeros e fazendo um looping dentro dele
   * "jogando" cada indice para dentro da variavel
   * a diferença é que não sera necessario criar nenhuma variavel de controle,
   * nenhum indice e evita a possibilidade de colocar um erro na verificaçao
   * esse tipo de for, é melhor usado para quando for feito uma verificaçao na lista inteira
   * 
   */

  print('Imprimindo numeros com for-in');
  for (var numero in numeros) {
    print(numero);
  }
  print('Imprimindo nomes com for-in');
  for (var nome in nomes) {
    print(nome);
  }

//usando o break, sera printado todas as condiçoes (nomes),
//até encontrar a condiçao especificada dentro do if
  print('Imprimindo nomes com for-in e break');
  for (var nome in nomes) {
    print(nome);
    if (nome == 'Murilo') {
      break;
    }
  }

//usando o continue, ira pular uma execuçao
// será lido toda a lista, porém, dessa forma o valor mencionado na condiçao if
//não será exibido na execuçao
//
  print('Imprimindo nomes com for convencinal e continue');
  for (var i = 0; i < nomes.length; i++) {
    if (i == 1 || i == 3) {
      continue;
    }
    print(nomes[i]);
  }

//adicionando um for-in dentro de uma lista
  print('Collection for');
  var listaInts = [1, 2, 3];
  var listaStrings = ['#0', '#1', for (var i in listaInts) '#$i'];
}

void main(List<String> args) {
  /**
   * o metodo .where faz um filtro da condiçao
   * where é um metodo de iterable e dentro de iterable terá varios metodos
   * que irao ajudar a filtrar, mapear, tranformar e varias outras funcionalidades
   */
  var numeros = List.generate(10, (index) => index);
  numeros.where((numero) => numero != 5).forEach((numero) => print(numero));
  // um detalhe sobre o forEach é que: ele só deve ser usado caso tenha que fazer uma funçao
  // ou executar alguma coisa que NAO faça nenhuma açao assincrona
  // se for usado alguma requisiçao assincrona, o forEach não deve ser usado (de forma nenhuma)

/**
*  tanto o takeWhile e o where, tranforma a lista em um iterable, o iterable tem algumas caracteristicas especificas
* para acessar um valor de uma lista iterable, é necessario usar o .elementAt()
* a ideia do iterable é de poder fazer açoes encadeadas 
* esse tipo de estrutura é muito parecido com programaçao funcional
* onde é chamado um metodo atrás do outro até chegar ao resultado
*/
  final numerosAte5 = numeros
      .takeWhile((numero) => numero < 6)
      .where((numero) => numero != 5)
      .toList();
  print(numeros[1]);
  print(numerosAte5);

//usando o .skipWhile é possivel trabalhar com a lista, removendo ou adicionando até uma certa situaçao que foi ordenada
//
  final numerosRemoverAte5 = numeros.skipWhile((numero) => numero < 6).toList();
  print(numerosRemoverAte5);

  var nomes = ['Murilo', 'Tadeu', 'Domingos', 'Tischer'];
  var nomesSkip = nomes.skipWhile((nome) {
    if (nome != 'Tadeu') {
      return true;
    } else {
      return false;
    }
  }).toList();
  print(nomesSkip);

/**
 * o map é responsavel por mapear, ele vai pegar uma lista e transformar em uma outra lista
 * ex: é possivel pegar uma lista de inteiro e transformar em uma lista de string
 */
  var numeroStrList = numeros.map((numero) {
    return 'Numero é $numero';
  }).toList();
  print(numeroStrList);

  var numeroList = numeros.map((numero) {
    return numero + 10;
  }).toList();

  //o iterable .reversed irá inverter a ordem dos elementos da lista
  final numerosRevertidos = nomes.reversed.toList();
  print(numerosRevertidos);

  /**
   * Em qualquer sinal de dificuldade, converta o iterable para list novamente 
   * para obter toda a gamma da lista que pode ser usada
   * iterable não é uma lista pura e por esse motivo se faz necessario ser convertido 
   * para uma lista novamente
   */
}

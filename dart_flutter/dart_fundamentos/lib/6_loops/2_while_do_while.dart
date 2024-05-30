void main(List<String> args) {
  /**
   * O while tem uma caracteristica um pouco diferente do for tradicional
   * o for tradicional, tem 3 estruturas ( inicio - condiçao - incremento)
   * ja no while, só temos a condiçao... e essa é a caracteristica principal do while
   * lembre que, como que no while só temos a condiçao,
   * a parte do incremento terá q ser inserido manualmente quando necessario (se quiser)
   */
  var numero = 0;
  print('While Convencional');
  while (numero <= 10) {
    numero++;
  }

  /**
   * o do-while tem caracteristicas parecidas com o while, 
   * porém, difere em um detalhe especifico 
   * a caracteristica do while(a condiçao) vem depois
   * e com isso ele sempre irá executar pelo menos uma vez  .
   * porque ele primeiro executa, para depois checar a condiçao
   */
  print('DoWhile');
  var indice = 0;
  print('While nao sera executado');
  // while (indice > 0) {
  //   print(indice);
  //   indice++;
  // }

  do {
    print(indice);
  } while (indice > 0);
}

void main(List<String> args) {
  var nomeCompleto = 'Murilo Tischer';
  print(nomeCompleto);
  nomeCompleto = 'Murilo Tischer';
  print(nomeCompleto);

  /**
   * variaveis finais:
   * Nao podem ser alteradas depois de inicializadas (Imutaveis),
   * variaveis do tipo de modificador FINAL só podem ser definidas uma unica vez.
   * Sao definidas no programa em tempo de execuçao em (Runtime)
   * a partir do momento que for criado, atribuido e declarado o valor... ele NÃO podera mais ser alterado
   * final -> é um tipo de modificador que faz com que a variavel nao possa ser alterada
   * final -> utilize sem moderaçao
   */
  final nomeCompletoFinal = 'Murilo Tischer';
  final nomeCompletoFinal2 = nomeCompleto;

/**
 * Variaveis const:
 * ela tem as mesmas caracteristicas que o modificador de variavel do tipo final,
 * o const também torna a variavel imutavel.
 * nao podem ser alteradas depois de inicializadas (imutaveis)
 * a diferença de caracteristica do tipo de modificador const é que ele deve estar com os dados setados em momento de compilação
 * sao definidas no programa em tempo de Compilaçao
 * uma variavel de modificador const não pode conter valores inesperados, ela deve conter valores fixos e ja conhecidos no momento de compilação
 * Nao pode receber valores de outras variaveis a nao ser que essas variaveis
 * sejam const tambem
 * const -> utilize sem moderaçao
 */
  const nomeCompletoConst = 'Murilo Tischer';
  const nomeCompletoConst2 = nomeCompletoConst;
}

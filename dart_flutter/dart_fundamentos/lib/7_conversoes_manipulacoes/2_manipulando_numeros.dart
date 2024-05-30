void main(List<String> args) {
  final idade = 30;

  //usando a interpolçao, não será necessario transformar uma variavel em string
  //para conseguir concatenar string com inteiro, sem precisar chamar o .toString()
  // na interpolaçao, ó próprio dart fica responsavel por esse serviço
  print('Sua idade é $idade');

  final valor = -20;
  //para verificar se um valor é negativo ou nao. Pode ser utilizado a propriedade isNegative
  if (valor.isNegative) {
    print(valor);
  }

  final valorDouble = 10.65;
  //usando o .round() o valor sera arredondado, retornando sempre um numero inteiro
  print(valorDouble.round());
  //caso seja necessario retornar um valor com ponto flutuante, será necessario utilizar o .roundToDouble
  //que sera arredondado mas retornara o valor arredondado .0
  print(valorDouble.roundToDouble());

  final valorString1 = '30';

  final valorString = 'Murilo';

  //dessa forma, usando o parse nao sera possivel converter uma string em numerico
  final valorInt = int.parse(valorString1);
// use o tryParse para que ele retorne null e nao dar erro, pois assim o valor int se torna opcional
  final valorInt2 = int.tryParse(valorString);
  print(valorInt);
  print(valorInt2);

  if (valorInt2 != null) {
    print('O valor é ${valorInt2 + 2}');
  }

  final precoCamiseta = 30.5678;
  //com toStringAsFixed é possivel informar a quantidade de casas decimais será utilizado
  print(precoCamiseta.toStringAsFixed(2));
}

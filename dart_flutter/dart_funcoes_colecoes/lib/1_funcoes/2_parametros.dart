import 'package:dart_funcoes_colecoes/1_funcoes/1_funcoes.dart';

void main(List<String> args) {
  //parametros Obrigatorios por default
  //parametros nomeados
  print('A soma de 10 + 10 é: ${somaInteiros(10, 10)}');
  /**
   * parametros nomeados:
   * parametros nomeados sao nullable por default
   * parametros nomeados podem ser promovidos para non-null com checagem de null
   */
  print(
      'A soma de 10.2 + 10.2 é: ${somaDoubles(numero1: 10.2, numero2: 10.2)}');
  print(
      'A soma de 10.2 + 10.2 é: ${somaDoubles(numero2: 10.2, numero1: 10.2)}');

  somaDoublesObrigatorios(numero1: 5.2, numero2: 10.2);
  somaDoublesObrigatorios2(numero1: null, numero2: 10);

  print('chamada com parametros default ${somaDoublesDefault()}');
  print('chamada com parametros default ${somaDoublesDefault(numero1: 10)}');

  //parametro opcional
  somaIntOpcional();
  somaIntOpcional(1);
  somaIntOpcional(1, 1);


  parametrosNormaisComNomeados(1, nome: 'Murilo',idade: 35); //? parametros obrigatorios e requiridos(nomeados) devem ser informados
  parametrosNormaisComNomeados2(1, 'Murilo', 35); // parametros opcionais nao precisam ser mensionados
  // ? ex: parametrosNormaisComNomeados2(1); 'String' e int nao precisam ser informados, pois sao opcionais

  //! PARAMETROS OPCIONAIS E NOMEADOS SEMPRE DEVEM SER INFORMADOS POR ULTIMO.
  //! NUNCA INFORMAR NO COMEÇO DO METODO/FUNÇAO
}

int somaInteiro(int numero1, int numero2) {
  return numero1 + numero2;
}

double somaDoubles({double? numero1, double? numero2}) {
  if (numero1 != null && numero2 != null) {
    return numero1 + numero2;
  }
  return 0.0;
}

double somaDoublesObrigatorios(
    {required double numero1, required double numero2}) {
  return numero1 + numero2;
}

double somaDoublesObrigatorios2(
    {required double? numero1, required double numero2}) {
  numero1 ??= 0;
  // if (numero1 == null) {
  //   numero1 = 0;
  // }
  return numero1 + numero2;
}

double somaDoublesDefault({double numero1 = 0, double numero2 = 0}) {
  return numero1 + numero2;
}

int somaIntOpcional([int numero1 = 0, int numero2 = 0]) {
  return numero1 + numero2;
}

void parametrosNormaisComNomeados(int numero1, {required String nome, required int idade}){}
void parametrosNormaisComNomeados2(int numero1, [String? nome, int? idade]){}
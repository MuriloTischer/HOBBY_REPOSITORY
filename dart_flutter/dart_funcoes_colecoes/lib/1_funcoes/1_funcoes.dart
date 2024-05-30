void main(List<String> args) {
  final valorCalculado = somaInteiros(10, 10);
  print('A soma de dois inteiros é $valorCalculado');
}

int somaInteiros(int numero1, int numero2) {
  print('Exucutando a soma do dois inteiros: ($numero1, $numero2)');
  final soma = numero1 + numero2;
  return soma;

  // para deixar o codigo mais limpo quando o valor da variavel é usado só para retornar o valor,
  // usando menos espaço da memoria, usa-se o retorno direto
  //? return numero1 + numero2;
}

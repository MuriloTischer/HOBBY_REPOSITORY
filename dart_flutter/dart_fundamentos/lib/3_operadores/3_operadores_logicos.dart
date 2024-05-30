void main(List<String> args) {
  /**
   * Operadores logicos são 3 tipos
   * && (E), || (OU), ! (NÃO)
   */
  final nome = 'Murilo';
  final sexo = 'M';
  final idade = 17;

  /**
   *  True && true = true
   * false && true = false
   * true && false = false
   */
  if (sexo == 'M' && idade >= 18 && sexo != 'F') {
    print('Pode entrar');
  } else {
    print('Nao Pode entrar');
  }

  /**
   * Operador || uma das condiçoes precisam ser verdade
   *  true || false = true
   * true || true = true
   * false || true = true
   */
  if (sexo == 'M' || idade >= 18) {
    print('pode entrar');
  } else {
    print('nao pode entrar');
  }

// true && false == false
  if (sexo == 'M' && idade >= 18) {
    print('pode entrar');
  } else {
    print('nao pode entrar');
  }

  if (!(nome == 'Murilo')) {
    print('Não é o ' + nome + ', não pode entrar');
  } else {
    print('É o ' + nome + ', pode entrar');
  }
}

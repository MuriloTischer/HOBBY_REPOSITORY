String? nomeSuperior;
//variaveis de tipo superior não podem ser atribuidos a variaveis locais

void main(List<String> args) {
  String nome = '';
  nome.isEmpty; // pode acessar um metodo dentro de uma funçao nula...

  //para informa que a variavel aceita um valor nulo,
  //coloca-se o sinal de interrogação junto ao tipo
  String?
      nomeNulo; // fazendo isso, uma variavel não conseguira acessar um metodo
  //dentro de uma funçao nula...
  //nomeNulo.isEmpty; --> NÃO (pode/consegue) acessar um metodo dentro de uma funçao nula...

  // para conseguir acessar uma variavel nao nula, faz-se uma checagem
  if (nomeNulo != null) {
    nomeNulo.isEmpty;
  }

  nomeSuperior = '';
  // nomeSuperior.isEmpty; --> não deixa fazer a checagem de variavel superior
  nomeSuperior!
      .isEmpty; //para forçar e garantir que você tem certeza que essa variavel não esta nula
  // coloca-se o a exclamação após a varriavel... (desde que você tenha certeza que ela esta recebendo algum valor)

// cria uma variavel local e associa ela com a variavel superior
// para promover a variavel superior para a local

  var nomeLocal = nomeSuperior; // variavel local recebe a varivel superior
  if (nomeLocal != null) {
    nomeLocal.isEmpty;
  }
}

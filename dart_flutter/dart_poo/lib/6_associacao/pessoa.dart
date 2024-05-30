class Pessoa {
  String? nome;

  //composiçao
  //quando um atributo de associaçao é obriatorio
  //nós estamos falando de composiçao
  Endereco endereco = Endereco();
  CPF cpf = CPF();

  //Agregaçao
  //quando um atributo de associaçao nao é obrigatorio 
  //nós estamos falando de agregaçao
  Telefone? telefone;
}

class Endereco {}

class Telefone {}

class CPF {}

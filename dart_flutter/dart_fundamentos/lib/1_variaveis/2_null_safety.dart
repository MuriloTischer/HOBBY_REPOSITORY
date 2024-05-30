//Variaveis de nivel superior não podem ser inicializadas depois
// nao é permitido >>> String nomeCompletoSuperior; (ela tem que ser inicializada)
String nomeCompletoSuperior = 'Murilo';
String? nomeCompletoSuperiorOpc;
//variaveis de nivel superior que estão fora do escopo, elas nunca serão promovidas para não nulas
void main() {
  //Variaveis locais nao precisam ser inicializadas de cara, porem
//Podem ser criadas sem valor e depois ser atribuido um valor
  String nomeCompleto;

  //dentro do dart, foi adicionado um operador novo que é o operador interrogaçao ( ? )
  //que é inserido junto com o tipo dizendo que a variavel/propriedade aceitará receber valores nulos
  // serve para quando se tem certeza que quer criar uma variavel nula para o desenvolvimento
  String? nomeCompletoOpc;

// atibuindo um valor para a variavel/propriedade deixar de ser null
  nomeCompleto = 'Murilo Tischer';

  //para garantir para o compilador do dart que uma variavel não sera nula, usa-se o operador de exclamaçao ( ! )
  // nota: sempre evitar o uso desse operador, evitar ao maximo
  print(nomeCompletoOpc!.length);

/**
 * Variaveis locais que sao nulas(nullable) por padrao
 * Se for atribuido um valor a ela, autoimaticamente elas sao
 * Promovidas a nao nulo(non-null)
 */

  nomeCompletoOpc = '';

  //variaveis de nivel superior NUNCA sao promovidas para nao nulo (non-null)
  nomeCompletoSuperiorOpc = '';

  print(nomeCompleto.length);
  print(nomeCompletoOpc.length);

// verificando o metodo sem a forma null safety... essa chamada é a maneira "antiga" de trabalhar com esse tipo de verificaçao
  if (nomeCompleto != null) {
    print(nomeCompleto.length);
  }
}

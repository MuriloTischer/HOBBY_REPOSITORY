abstract class Animal {
  String? tamanho;
  final int idade;
  // final String nome;

  Animal({required this.idade});

  int recuperarIdade() {
    return idade;
  }

  int calcularIdadeHumana();
}

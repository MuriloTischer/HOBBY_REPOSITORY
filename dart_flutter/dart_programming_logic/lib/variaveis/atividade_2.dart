/*
 * Descrição da Atividade
* Imagine que você está construindo um sistema para uma escola e você foi convocado para construir um algoritimo onde você irá cadastrar os alunos.

*  Atividade:

* Crie as variáveis que envolvam o cadastro do aluno;
* Atribua valores a elas;
* Faça a impressão de todas as variáveis;
 */

void main() {
  int id;
  String nomeCompleto;
  int idade;
  double altura;
  double peso;
  String paiAluno;
  String maeAluno;
  String turma;
  String turno;
  bool isAlunoBolsista;

  id = 1;
  nomeCompleto = 'Fulano de Tal';
  paiAluno = 'Ciclano';
  maeAluno = 'Beltrana';
  idade = 30;
  altura = 1.80;
  peso = 80.0;
  turma = 'A';
  turno = 'Manhã';
  isAlunoBolsista = true;

  print('Id: $id');
  print('Nome Completo: $nomeCompleto');
  print('Idade: $idade');
  print('Altura: $altura');
  print('Peso: $peso');
  print('Turma: $turma');
  print('Turno: $turno');
  print('É aluno bolsista: $isAlunoBolsista');

  // Exemplo de interpolação de String
  // interpolação de String é utilizando para quando queremos imprimir várias variaveis em uma linha só
  // e para isso utilizamos a aspas simples ' e dentro dela utilizamos o caracter $
  // conforme o exemplo abaixo
  print(
      'Nome Completo: $nomeCompleto -> (pais: $paiAluno/$maeAluno) idade: $idade turma: $turma');
}

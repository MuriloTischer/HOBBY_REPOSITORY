void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista

  print('#1 Lista sem pacientes duplicados');
  final pacienteSemDuplicado =
      pessoas.toSet().map((e) => e.split('|')).toList();
  pacienteSemDuplicado.forEach((p) => print(p[0]));

  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas

  print('----');
  print('#2 Nome e Quantidade de pessoas de cada sexo');
  final mapSexoPessoa = <String, List<String>>{};
  for (var pessoa in pacienteSemDuplicado) {
    final sexoPaciente = pessoa[2].toLowerCase();
    final listaMsculino = mapSexoPessoa['M'] ?? <String>[];
    final listaFeminino = mapSexoPessoa['F'] ?? <String>[];

    if (sexoPaciente == 'masculino') {
      listaMsculino.add(pessoa[0]);
    }
    if (sexoPaciente == 'feminino') {
      listaFeminino.add(pessoa[0]);
    }
    mapSexoPessoa['M'] = listaMsculino;
    mapSexoPessoa['F'] = listaFeminino;
  }
  final masculinos = mapSexoPessoa['M'] ?? <String>[];
  final femininos = mapSexoPessoa['F'] ?? <String>[];
  print('Quantidade dos pacientes Masculinos: (${masculinos.length})');
  print('Nomes: ');
  masculinos.forEach(print);

  print('');
  print('Quantidade dos pacientes Femininos: (${femininos.length})');
  print('Nomes: ');
  femininos.forEach(print);

  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  print('---');
  print('#3 Filtrando pessoas maiores de 18 anos');
  final pessoasMaioresDe18Anos = pacienteSemDuplicado.where((p) {
    final idade = int.tryParse(p[1]) ?? 0;
    return idade > 18;
  }).toList();
  pessoasMaioresDe18Anos.forEach((p) => print(p[0]));

  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

  print('----');
  print('#4 Informando o nome da pessoa mais velha da lista');
  final pessoaOrdenada = [...pacienteSemDuplicado];
  pessoaOrdenada.sort((p1, p2) {
    final idadeP1 = int.tryParse(p1[1]) ?? 0;
    final idadeP2 = int.tryParse(p2[1]) ?? 0;
    return idadeP2.compareTo(idadeP1);
  });

  final pessoaMaisVelha = pessoaOrdenada.first;
  final pessoaMaisNova = pessoaOrdenada.last;

  print(
      '${pessoaMaisVelha[0]} é a pessoa cadastrada mais velha, está com ${pessoaMaisVelha[1]} anos');
 print(
      '${pessoaMaisNova[0]} é a pessoa cadastrada mais nova, está com ${pessoaMaisNova[1]} anos');
}

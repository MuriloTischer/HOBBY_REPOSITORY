void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  numeros.forEach(printAcademia);

  //Expand
  //Array BiDimencional
  var lista = [
    [1, 2],
    [3, 4],
  ];

  var listaNova = lista.expand((numeros) => numeros).toList();
  print(listaNova);
  print('------------');
  //any
  print('.any');
  final listaBusca = ['Murilo', 'Tadeu', 'Domingos', 'Tsicher'];
  if (listaBusca.any((nome) => nome == 'Tadeu')) {
    print('Tem Tadeu');
  } else {
    print('nao tem Tadeu');
  }
  print('------------');
  //.every
  final listaBusca2 = ['Murilo', 'Tadeu', 'Domingos', 'Tischer'];
  if (listaBusca2.every((nome) => nome.contains('T'))) {
    print('todos os nomes tem a letra T');
  } else {
    print('Nem todos os nomes tem a letra T');
  }
  print('------------');

// .sort
  print('.sort');
  print('Ordenando numeros ');
  var listaParaOrdenacao = [99, 22, 10, 0, 9, 35];
  listaParaOrdenacao.sort();
  print(listaParaOrdenacao);

  print('------------');
  print('Ordenando Nome por ordem Alfabetica');
  var listaNomesOrdenacao = ['Murilo', 'Tadeu', 'Domingos', 'Tischer'];
  listaNomesOrdenacao.sort();
  print(listaNomesOrdenacao);

  print('------------');
  print('LISTA 1');
  print('Lista de Pacientes por idade');
  var listaPacientes = [
    'Murilo T|35',
    'Tadeu D|20',
    'Domingos T|30',
    'Tischer|36',
  ];
  var novaListaPacientes = [...listaPacientes];
  novaListaPacientes.sort((paciente1, paciente2) {
    final dadosPaciente1 = paciente1.split('|');
    final dadosPaciente2 = paciente2.split('|');

    final idadePaciente1 = int.parse(dadosPaciente1[1]);
    final idadePaciente2 = int.parse(dadosPaciente2[1]);
    if (idadePaciente1 > idadePaciente2) {
      return 1;
    } else if (idadePaciente1 == idadePaciente2) {
      return 0;
    } else {
      return -1;
    }
  });
  print('Lista Pacientes');
  print(listaPacientes);
  print('');
  print('Nova Lista Pacientes (ordenada)');
  print(novaListaPacientes);

  print('----------------');

//compareTo
  print('LISTA 2');
  print('.sort com CompareTo');
  var listaPacientes2 = [
    'Murilo T|35',
    'Tadeu D|20',
    'Domingos T|30',
    'Tischer|36',
  ];

  listaPacientes2.sort((paciente1, paciente2) {
    final dadosPaciente1 = paciente1.split('|');
    final dadosPaciente2 = paciente2.split('|');

    final idadePaciente1 = int.parse(dadosPaciente1[1]);
    final idadePaciente2 = int.parse(dadosPaciente2[1]);
    return idadePaciente1.compareTo(idadePaciente2);
  });

  print(listaPacientes2);
  print('------------');

//Pacientes por funcao
  print('LISTA 3 POR FUNCAO');
  final listaPacientes3 = [
    'Murilo T|35',
    'Tadeu D|20',
    'Domingos T|30',
    'Tischer|36',
  ];
  print('antes');
  print(listaPacientes3);
  funcaoQualquer(listaPacientes3);
  print('depois');
  print(listaPacientes3);
}

void printAcademia(Object valor) {
  print(valor);
  print('------------');
}

void funcaoQualquer(List<String> pacientes) {
  final localPacientes = [...pacientes];
  localPacientes.sort((paciente1, paciente2) {
    final dadosPaciente1 = paciente1.split('|');
    final dadosPaciente2 = paciente2.split('|');

    final idadePaciente1 = int.parse(dadosPaciente1[1]);
    final idadePaciente2 = int.parse(dadosPaciente2[1]);

    return idadePaciente1.compareTo(idadePaciente2);
  });
  print(localPacientes);
}

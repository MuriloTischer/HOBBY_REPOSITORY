void main(List<String> args) {
  final diaDaSemana = 0;
  var diaDaSemanaStr = '';

  // if (diaDaSemana == 0) {
  //   diaDaSemanaStr = 'Domingo';
  // } else if (diaDaSemana == 1) {
  //   diaDaSemanaStr = 'Segunda-Feira';
  // } else {
  //   diaDaSemanaStr = 'Não identificado';
  // }

// utilizando switch

  switch (diaDaSemana) {
    case 0:
      diaDaSemanaStr = 'Domingo';
      break;
    case 1:
      diaDaSemanaStr = 'Segunda-Feira';
      break;
    default:
      diaDaSemanaStr = 'Não identificado';
      break;
  }
  print(diaDaSemanaStr);

  //condiçao para atender mais de um item
  final idade = 20;
  if (idade >= 18) {
    print('maior de idade');
  } else if (idade > 18) {
    print('menor de idade');
  } else {
    print('ser de outro planeta');
  }

  switch (idade) {
    case 18:
    case 20:
      print('maior de idade ');
      break;
    default:
      print('menor de idade');
      break;
  }

  // se em uma condiçao precisar fazer muitos else ifs...
  //  faz se melhor sempre optar pelo operador switch
}

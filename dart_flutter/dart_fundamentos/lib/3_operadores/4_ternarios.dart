void main() {
/**
 * 
 */

  final idade = 12;
// if condiçao comum
  if (idade >= 12) {
    print('maior de idade');
  } else {
    print('menor de idade');
  }

// if condiçao ternário
// (condiçao) ? faça algo : não faça
  final eMaiorDeIdade = (idade >= 18 ? true : false);
  print('é maior de idade? ' + eMaiorDeIdade.toString());

// a funçao ternaria abaixo, parece ser um codigo simples, porém o jeito de criaçao dele
// pode gerar uma complexibilidade muito grande e as vezes de dificil leitura
  print((idade < 13)
      ? 'Criança'
      : (idade > 12 && idade < 18)
          ? 'Adolecente'
          : 'Adulto');

  // outro ex que mostra a complexibilidade da utilizaçao de um ternario:
  //--> para descobrir se o ano de 2024 é bisexto
  final ano = 2024;
  print((ano % 4 == 0 || ano % 400 == 0 || ano % 100 != 0)
      ? 'Ano Bisexto'
      : 'Não é Bisexto');
}

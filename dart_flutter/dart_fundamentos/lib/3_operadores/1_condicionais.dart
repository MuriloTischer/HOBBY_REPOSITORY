void main() {
/**
 * Operadores relacionais:
 * Temos 6 tipos
 * == (igualdade), != (diferença), > (Maior que), < (Menor que), <= (Menor igual), >= (Maior igual)
 * esses operadores servem para verificar regras de negocio, se pode ou não fazer alguma coisa
 * é sempre utilizado para fazer uma comparaçao 
 */

  final idade = 18;
  // idade é maior que 18 para ter habilitacao
  //regra de negocio para tirar Habilitaçao
  if (idade > 18) {
    print('pode tirar habilitacao');
  } else if (idade == 18) {
    print('pode tirar habilitacao');
  } else {
    print('nao pode tirar habilitacao');
  }
}


// o valor para um variavel (bool) nada mais são que os valores boleanos (boolean)
// bool representa o verdadeiro ou falso das condições

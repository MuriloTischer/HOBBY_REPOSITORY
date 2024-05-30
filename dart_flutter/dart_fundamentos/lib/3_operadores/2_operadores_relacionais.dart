void main() {
  /**
   * temos 6 tipos de operadores relacionais
   * 
   * == (igualdade), != (diferenca), > (Maior que),
   * < (Menor que), <= (Menor igual), >= (Maior igual)
   *     
   * esses operadores servem para verificar regras de negocio, 
   * se pode ou não fazer alguma coisa
   * é sempre utilizado para fazer uma comparaçao 
   */

  final idade = 18;

// regra de negocio para tirar habilitacao
  //regra de negocio para tirar Habilitaçao
  if (idade == 18) {
    print('Pode tirar habilitaçao');
  }
  if (idade > 17) {
    print('Pode tirar habilitaçao');
  }
  if (idade >= 18) {
    print('Pode tirar habilitaçao');
  }

  /*
  * supondo que eu tenho uma loja de produtos para cães
  * alguém entra na loja procurano produtos para gatos
  * e vendo apenas produtos para cães, e preciso informar ao cliente
  * ---> criar uma varivel (pode ser final) com a informação gato..
  * e contrua uma verificaçao condicional que informe ao cliente 
  * que vc não vende produtos para gatos
  */
  final tipoPet = 'gato';

  if (tipoPet != 'cachorro') {
    print('Desculpe, não temos nada para seu gato');
  }
}

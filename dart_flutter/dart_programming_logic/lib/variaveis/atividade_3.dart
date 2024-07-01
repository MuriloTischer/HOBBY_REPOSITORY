/*
 * Descrição da Atividade
*Imagine que você está construindo um sistema para uma loja de roupas e você foi convocado para construir um algoritimo onde você irá cadastrar os produtos da loja.

*Atividade:

*Crie as variáveis que envolvam o cadastro do produto;
*Atribua valores a elas;
*Faça a impressão de todas as variáveis;
 */

void main() {
  int id;
  String nomeProduto;
  double precoProduto;
  int quantidadeProduto;
  String tamanhoProduto;
  String marcaProduto;
  String categoriaProduto;
  bool isProdutoPromocao;

  id = 1;
  nomeProduto = 'Camiseta';
  precoProduto = 50.0;
  quantidadeProduto = 10;
  tamanhoProduto = 'M';
  marcaProduto = 'Nike';
  categoriaProduto = 'Vestuário';
  isProdutoPromocao = true;

  print('Id: $id');
  print('Nome do Produto: $nomeProduto');
  print('Preço do Produto: $precoProduto');
  print('Quantidade do Produto: $quantidadeProduto');
  print('Tamanho do Produto: $tamanhoProduto');
  print('Marca do Produto: $marcaProduto');
  print('Categoria do Produto: $categoriaProduto');
  print('O Produto está em promoção: $isProdutoPromocao');

  print('-----------------------------------');

  print(
      'Nome do Produto: $nomeProduto -> (Marca: $marcaProduto) Preço: $precoProduto Quantidade: $quantidadeProduto');

  print('-----------------------------------');
  print('Produto: $nomeProduto ($marcaProduto)');
  print('Tamanho e Valor: $tamanhoProduto ($precoProduto)');
  print('------------------------------');
}

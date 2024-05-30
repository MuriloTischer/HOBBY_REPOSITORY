void main(List<String> args) {
  var lista = ['Murilo'];
  print(lista);
  //funcao(lista);
  add(lista);
  print(lista);
}

void funcao(List<String> nomes) {
  //nomes.add('Tischer');
  print(nomes.hashCode);
  if (nomes.isEmpty) {
    nomes.clear();
  }
}

void funcao2(String nome) {
  nome += 'xmuProject';
  print(nome);
  print(nome.hashCode);
}

List<String> add(List<String> nomes) {
  var novoNomes = [...nomes];
  novoNomes.add('Murilo Tischer');
  print(novoNomes);
  return novoNomes;
}

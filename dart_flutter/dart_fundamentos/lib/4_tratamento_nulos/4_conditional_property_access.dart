String? nomeCompleto = 'Murilo Tischer';
void main(List<String> args) {
  //if convencional
  var nomeCompletoLocal = nomeCompleto;
  if (nomeCompletoLocal != null) {
    print(nomeCompletoLocal.toUpperCase());
  } else {
    print('Nome não preenchido');
  }

  //usando o null aware operator
  var nomeCompletoLocal2 = nomeCompleto ?? 'Nome não preenchido';
  print(nomeCompletoLocal2.toUpperCase());

//usando o conditional property Access operation
  print(nomeCompleto?.toUpperCase() ?? 'Nome não preenchido');

/*
* sempre lembrar que:
* sempre será trabalhado com variaveis nullsafety nullable
* e sempre será necessario usar o null aware operator e o conditional property access
* a funçao só sera executada se a variavel não for nula, se for nula ela ira ignorar o lado (.toUpperCase[exemplo acima]) 
* e irá printar/executar/retornar nulo
* usando null-aware e ou conditional property access, sempre será evitado null e evitará ter que forçar a variavel usando a (!)
*/
}

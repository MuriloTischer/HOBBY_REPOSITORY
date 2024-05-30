void main(List<String> args) {
  //declaracao normal
  List<int> listNumeros = [1, 2, 3];

  //no dart nao eh necessario declarar o tipo da lista, pois sera atribuido automaticamenter de acordo com a tipagem passada
  var listNumero2 = [1, 2, 3];

  //caso de uma lista sem dados, se ao atribuir o tipo da lis
  //o dart ira entender e transformar em uma tipo dynamic
  List<int> listSemDados = [];
  var listSemDados1 = []; //dessa forma sera atribuido a tipagem dynamic
  var listSemDados2 = <int>[]; //dessa forma sera atribuido a tipagem escolhida no caso INT
  
  
}

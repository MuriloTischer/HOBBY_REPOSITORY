String? nome;

void main() {
  var sobrenome = 'Tischer';
  //var nomeCompleto = nome! + sobrenome;

/* 
* fazendo a utilização das dua interrogaçoes, será utilizado uma condicional
* semelhante ao condicional ternario.. 
*
* ?? --> se o nome for nulo será printado (Murilo), se ele não for,
* será printado o nome/valor que foi definido na variavel + o sobrenome
*/
  var nomeCompleto = (nome ?? 'Murilo') + sobrenome;

  String? nomeCompleto2 = null;
  print(nomeCompleto2 ?? 'Murilo Tischer');
}

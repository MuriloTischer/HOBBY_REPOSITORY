void main() {
  var pessoa = Pessoa()
  //utilizando o cascade
  ..nome = 'Murilo Tischer'
  ..email = 'murilo@email.com'
  ..site = 'murilo.com.br';


  //sem utilizar o cascade
  // pessoa.nome = 'Murilo Tischer';
  // pessoa.email = 'murilo@email.com';
  // pessoa.site = 'murilo.com.br';

  print('''
Pessoa:
Nome: ${pessoa.nome}
Email: ${pessoa.email}
Site: ${pessoa.site}
''');
}

class Pessoa {
  String? nome;
  String? email;
  String? site;
}

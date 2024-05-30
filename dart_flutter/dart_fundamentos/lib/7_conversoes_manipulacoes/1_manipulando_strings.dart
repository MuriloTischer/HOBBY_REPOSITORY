void main(List<String> args) {
  final nome = 'Murilo Tischer';

  //com a tag substring, é possivel pegar parte do nome armazenado na string para ser retornado
  //usando o substring será possivel apartir de qual caracter devera ser printado a string
  var subStringNome = nome.substring(7);
  print(subStringNome);

//um outra forma de fazer é especificando o caracterie que será inciado e o que terminara a leitura
  var subStringNome2 = nome.substring(0, 7);
  print(subStringNome2);

  var sexo = 'Masculino';
  var sexoSigla = sexo.substring(0, 1);
  print(sexoSigla);

  if (sexoSigla == 'M') {
    print('Olá seu sexo é masculino');
  }

//startsWith irá verificar os primeiros caracteries da palavra e retornar a busca
//startsWith é case sensitive, tem que ser exatamente como está escrito
  if (sexo.startsWith('Mas')) {
    print('Olá seu sexo é Masculino');
  }
//para transformar a string em letras minusculas, use o toLowerCase
  if (sexo.toLowerCase().startsWith('mas')) {
    print('Olá seu sexo é masculino');
  }

//contains irá verificar se a palvra existe em alguma parte do testo passado
  if (nome.toLowerCase().contains('tischer')) {
    print('É da familia Tischer');
  }

  //interpolaçao
  var primeiroNome = 'Murilo';
  var segundoNome = 'Tischer';

  var saudacao = 'Ola ' + primeiroNome + segundoNome + ' seja muito bem vindo.';
  print(saudacao);

  //para fazer a interpolaçao, usa-se o caracter $ para receber a varivel
  //com isso, será apresentado a variavel como se estivesse usando a concatenaçao(+), para concatenar as Strings e receber a variavel
  var saudacao2 = 'Ola $primeiroNome $segundoNome seja muito bem vindo.';
  print(saudacao2);

//A interpolaçao tem uma caracteristica, se for utilizar uma variavel simples. Poderá ser colocado apenas o dolar na frente da varioavel
//porem, se for utilizar alguma açao, um metodo dentro dessa variavel por exemplo o toLowerCase
// nao podera ser mais usado apenas o $, quando a variavel for receber um metodo essa interpolaçao terá que ser
//envolvida dentro de chaves{}.. ficando: ${variavel.metodo()}, sempre que a variavel for .algumaCoisa(), terá q ser envolvido em chaves{}
  print('Olá ${primeiroNome.toLowerCase()}');
  print('Soma de 2 + 2 é ${2 + 2}');
  print('olá $primeiroNome');

// capiturando indices de uma lista.
  var paciente = 'Murilo Tischer|36|Especialista Dart e Flutter|SP';
  //o split usará o caractere '|' (ou algum outro que foir informado) como separador e o resultado será atribuído à variável "dadosPaciente".
  var dadosPaciente = paciente.split('|');
  print(dadosPaciente);

  print('Capturando passando todos os dados manualmente, um a um');
  print(dadosPaciente[0]);
  print(dadosPaciente[1]);
  print(dadosPaciente[2]);
  print(dadosPaciente[3]);

  print('Capiturando indice da lista com for-in');
  for (var dado in dadosPaciente) {
    print(dado);
  }

  print('Capturando indice da lista com For-Each');
  dadosPaciente.forEach(print);
  //ou
  dadosPaciente.forEach((dado) => print(dado));

  var pacientes = [
    'Murilo T D Tischer|35|Especialista Dart e Flutter|SP',
    'Mauricio Tadeu Tischer|35|Especialista Dart e Flutter|SP',
    'Maria Ap. Tischer|35|Especialista Dart e Flutter|SP',
    'Tatiane Tischer Machado|35|Especialista Dart e Flutter|SP',
  ];

  for (paciente in pacientes) {
    var dadosPaciente = paciente.split('|');
    var nomeCompleto = dadosPaciente[0];
    print(nomeCompleto);

    var nomes = nomeCompleto.split(
        ' '); //aqui o split é usado com espaço para separar as strings e trazer apenas os dados desejados
    print(nomes.first);
    print(nomes.last);

//para juntar os dois prints, pode ser usado a interpolaçao
    print('${nomes.first} ${nomes.last}');
  }

/** forma não indicada de captura
 *    var nomePasciente = paciente.substring(0, 14);
 *    var idadePasciente = paciente.substring(15, 17);
 *    print(nomePasciente);
 *    print(idadePasciente);
*/
}

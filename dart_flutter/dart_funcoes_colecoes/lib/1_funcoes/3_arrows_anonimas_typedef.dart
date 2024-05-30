void main(List<String> args) {
// funcao anonima, nao tem o padrao de uma funcao
  () {
    print('Funcao anonima');
  }();

  //----

  var nome = '';
  var idade = 1;
  var funcaoQualquer = () {
    print('Chamou a funcao da var');
    return '2000';
  };

  print(funcaoQualquer());


  //nao esta invocando a funcao



  print(somaInteiros(10, 10));

  print('Iniciando Chamada');
  chamarUmaFuncaoDeUmParametro((nome) {
    if (nome.isEmpty) {
      print('O nome veio vazio');
    } else {
      print(nome);
    }
  });
  print('Finalizando chamada');
}
//3 partes
//1 tipo de restorno
// 2 nome
//3 parametros (normais, nomeados e opcionais)

int somaInteiros(int numero1, int numero2) => numero1 + numero2;
void somaInteirosVoid(int numero1, int numero2) => numero1 + numero2;
void chamarUmaFuncaoDeUmParametro(Function(String nome) funcaoQueRecebeNome) {
  var calculo = 1 + 1;
  var nomeCompleto = 'Murilo Tischer';
  print('finalizando a funcao chamarUmaFuncaoDeUmParametro');
  print('invocando FuncaoQueRecebeNome');
  funcaoQueRecebeNome(nomeCompleto);
}

void chamarUmaFuncaoDeUmParametro2(Function(String nome) funcaoQueRecebeNome) {
  var calculo = 1 + 1;
  var nomeCompleto = 'Murilo Tischer';
  print('finalizando a funcao chamarUmaFuncaoDeUmParametro');
  print('invocando FuncaoQueRecebeNome');
  funcaoQueRecebeNome(nomeCompleto);
}

typedef FuncaoQueRecebeNome = void Function(String nome);
typedef FuncaoQueRecebeNomeCompleto = String Function(
  String nome,
  String nomeCompleto, {
  required String? x,
  required String? x2,
  required int? qq,
});

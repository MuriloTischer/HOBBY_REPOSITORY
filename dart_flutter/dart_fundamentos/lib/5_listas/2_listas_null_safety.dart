void main(List<String> args) {
  /**
   * ? = Nullable (aceita nulo)
   * sem nada (padrao) = non-null (nao aceita nulo)
   */

  //nao aceita ser nulo
  var nomes = <String>[];

  //aceita nulo
  List<String>? nomesNulos;

  //! dessa forma isso nao funciona
  //! pois a lista e nem os itens podem ser nulo
  List<String> nomesInternosNaoAceitaNulos = ['Murilo'];
  var nomesInternosNaoAceitaNulos1 = ['Murilo'];

//lista nao pode ser nula mas os itens internos podem ser nulos;
  List<String?> nomesInternosAceitaNulos = ['Murilo', null, 'Tischer', null];
  List<String?>? nomesInternosAceitaNulos1 = ['Murilo', null, 'Tischer', null];

//lista pode ser nula e os itens também podem ser nulos;
  List<String?>? nomesInternosAceitaNulos2 = null;
}

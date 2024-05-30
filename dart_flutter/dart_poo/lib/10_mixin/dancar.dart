import 'package:dart_poo/10_mixin/artista.dart';

mixin Dancar on Artista {
  String dancar() {
    return 'Dança forro';
  }

  @override
  String habilidade() {
    return 'dancar';
  }
}

abstract class ArtistaInterface {}


// mixin veio para dar a oportunidade de termos uma herança multipla
// o mixin pode ser usado de duas formas 

// importante: tomar cuidado com a sobrescrita de metodos com nomes e valores iguais


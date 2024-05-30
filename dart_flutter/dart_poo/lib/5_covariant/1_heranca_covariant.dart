import 'package:dart_poo/5_covariant/banana.dart';
import 'package:dart_poo/5_covariant/fruta.dart';
import 'package:dart_poo/5_covariant/humano.dart';
import 'package:dart_poo/5_covariant/macaco.dart';

void main(List<String> args) {
  var humano = Humano();
  humano.comer(Fruta());

  var macaco = Macaco();
  macaco.comer(Banana('Nanica'));
}

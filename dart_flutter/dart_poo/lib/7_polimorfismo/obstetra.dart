import 'package:dart_poo/7_polimorfismo/medico.dart';

class Obstetra extends Medico {
  @override
  void operar() {
    print('prepara paciente');
    print('nasce bb');
  }
}

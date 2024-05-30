import 'package:dart_poo/7_polimorfismo/medico.dart';

class Anestesista extends Medico {
  @override
  void operar() {
    print('prepara equipamento');
    print('anestesia paciente');
  }
}

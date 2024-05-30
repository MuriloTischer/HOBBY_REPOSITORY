//! bloquear um evento não é correto

import 'dart:io';

void main() {
  print('Iniciando Main');
  print(temperaturaAtual());
  print(previsaoAmanha());
  print('Finalizando Main');
}

String temperaturaAtual() {
  sleep(const Duration(seconds: 3)); //! usar o sleep trava a tela (congela) e isso não é correto fazer
  return 'Esta fazendo 30*';
}

String previsaoAmanha() {
  sleep(const Duration(seconds: 4));
  return 'Amanhã fará 34*';
}

import 'dart:async';

void main() {
  print('Inicio main');
  Timer.run((){
    scheduleMicrotask(() => print('Nova MicroTask 1')); 
    print('Event 1');
  });
  Timer.run(() => print('Evento 2'));
  Timer.run(() => print('Evento 3'));
  scheduleMicrotask(() => print('MircroTask 1'));
  scheduleMicrotask(() => print('MircroTask 2'));
  print('Fim main');
  
}

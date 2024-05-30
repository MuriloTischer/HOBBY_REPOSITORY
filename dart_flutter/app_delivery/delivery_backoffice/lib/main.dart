import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './src/app_module.dart';
import './src/app_widget.dart';
import 'src/core/env/env.dart';

void main() async {
  //importante ter as configuraçoes do binding para que na primeira iteraçao com o URL do backend
  //essa configuraçao ira inicializar o flutter antes mesmo da aplicaçao ser inicializada
  WidgetsFlutterBinding
      .ensureInitialized(); //? inicia o flutter antes da aplicaçao ser inicializada
  await Env.instance.load(); //? faz o load da aplicaçao
  //? executa o projeto
  return runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}

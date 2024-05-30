/* 
 * classe responsavel por fazer a leitura do backend 
 * o encapsulamento do dotenv para ele poder buscar as informações 
 * sem ter que ficar acessando ele diretamente
 */

import 'package:flutter_dotenv/flutter_dotenv.dart';

//class singleton (Design Patterns)
// uma singleton class é uma classe que disponibiliza uma unica instância do arquivo
class Env {
  static Env? _instance;

  Env._();

  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

//3 metodos importantes

//responsavel por fazer o carregamento das variaveis de ambiente
//o dotenv.load ira fazer a leitura do arquivo que foi criado dentro do projeto
  Future<void> load() => dotenv.load();

  //metodo responsavel por buscar a chave que esta sendo solicitada, se não achar sera retornado um nullo
  String? maybeGet(String key) => dotenv.maybeGet(key);

  //metodo do tipo get, é o metodo que ira retornar/buscar a chave dentro do arquivo de configuraçao e se nao existir sera retornado um error.
  String get(String key) => dotenv.get(key);
}

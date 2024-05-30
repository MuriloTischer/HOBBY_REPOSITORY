import 'dart:convert';

import 'package:app_listadetarefas/models/tarefa.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tarefaListKey = 'tarefa_list';

class TarefaRepository {
  late SharedPreferences sharedPreferences;

  void saveTarefaList(List<Tarefa> tarefas) {
    final String jsonString = json.encode(tarefas);
    sharedPreferences.setString(tarefaListKey, jsonString);
  }

  Future<List<void>> getTarefaList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString =
        sharedPreferences.getString(tarefaListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Tarefa.fromJson(e)).toList();
  }
}

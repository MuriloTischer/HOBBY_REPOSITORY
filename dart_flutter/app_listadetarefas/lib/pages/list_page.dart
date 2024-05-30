import 'package:app_listadetarefas/models/tarefa.dart';
import 'package:app_listadetarefas/repositories/tarefa_repository.dart';
import 'package:app_listadetarefas/widgets/lista_tarefa_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController listaDeTarefaController = TextEditingController();
  final TarefaRepository tarefaRepository = TarefaRepository();

  List<Tarefa> tarefas = [];
  Tarefa? deletedTarefa;
  int? deletedTarefaPosicao;
  String? errorText;

  @override
  void initState() {
    super.initState();
    tarefaRepository.getTarefaList().then((value) {
      setState(() {
        tarefas == value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: listaDeTarefaController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex. Estudar Flutter',
                            // errorText: errorText,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            labelStyle: TextStyle(color: Colors.green)),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String text = listaDeTarefaController.text;

                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'O titulo não pode ser vazio.';
                          });
                          return;
                        }

                        setState(() {
                          Tarefa newTarefa = Tarefa(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          tarefas.add(newTarefa);
                          errorText = null;
                        });
                        listaDeTarefaController.clear();
                        tarefaRepository.saveTarefaList(tarefas);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Tarefa tarefa in tarefas)
                        ListaTarefaItem(
                          tarefa: tarefa,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${tarefas.length} tarefas pendentes',
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: showDeleteTarefasConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Text(
                        'Limpar Tudo',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Tarefa tarefa) {
    deletedTarefa = tarefa;
    deletedTarefaPosicao = tarefas.indexOf(tarefa);
    setState(() {
      tarefas.remove(tarefa);
    });
    tarefaRepository.saveTarefaList(tarefas);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${tarefa.title} foi removida com sucesso.',
          style: const TextStyle(
            color: Color(0xff060708),
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              tarefas.insert(
                deletedTarefaPosicao!,
                deletedTarefa!,
              );
            });
            tarefaRepository.saveTarefaList(tarefas);
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showDeleteTarefasConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar tudo?'),
        content:
            const Text('Você tem certeza que deseja apagar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTarefas();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text(
              'Limpar Tudo',
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllTarefas() {
    setState(() {
      tarefas.clear();
    });
    tarefaRepository.saveTarefaList(tarefas);
  }
}

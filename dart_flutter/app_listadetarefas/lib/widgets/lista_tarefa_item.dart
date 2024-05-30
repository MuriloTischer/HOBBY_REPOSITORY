// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_listadetarefas/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ListaTarefaItem extends StatelessWidget {
  final Tarefa tarefa;
  final Function(Tarefa) onDelete;
  const ListaTarefaItem({
    Key? key,
    required this.tarefa,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        // ignore: sort_child_properties_last
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm:ss').format(tarefa.dateTime),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                tarefa.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actionExtentRatio: 0.25,
        actionPane: const SlidableStrechActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Deletar',
            onTap: () {
              onDelete(tarefa);
            },
          )
        ],
      ),
    );
  }
}

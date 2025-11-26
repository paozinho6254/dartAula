import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_tarefas/page/todo_list_page.dart';

import '../model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.onDelete});

  final Todo todo;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.40,
          children: [
            //o que aparece ao slidar
            SlidableAction(
              onPressed: (context) {onDelete(todo);},
              borderRadius: BorderRadius.circular(3),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
            SlidableAction(
              onPressed: (context) {},
              borderRadius: BorderRadius.circular(3),
              icon: Icons.edit,
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.white,
              label: 'Editar',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(3),
            color: Colors.grey[350],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MMM/yyyy - HH:mm').format(todo.date),
                style: TextStyle(fontSize: 13),
              ),
              Text(
                todo.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// aqui a descrição da tarefa
//ExpansionTile(children: [],) interessante explorar depois para dar descrição
//para as tarefas

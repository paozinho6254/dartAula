import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
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
        //aparece no final do item
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.25,
          children: [
            //o que aparece ao slidar
            SlidableAction(
              onPressed: (context) {},
              borderRadius: BorderRadius.circular(3),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
          ],
        ),
      ),
    );
  }
}

// aqui a descrição da tarefa
//ExpansionTile(children: [],) interessante explorar depois para dar descrição
//para as tarefas

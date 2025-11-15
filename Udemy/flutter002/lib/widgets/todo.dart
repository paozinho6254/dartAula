import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.title, required this.date});

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.grey[350],
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$date', style: TextStyle(fontSize: 13)),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // aqui a descrição da tarefa
        ],
      ),
    );
  }
}

//ExpansionTile(children: [],) interessante explorar depois para dar descrição
//para as tarefas

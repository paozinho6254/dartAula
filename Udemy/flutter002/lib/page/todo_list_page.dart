import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tarefas/widgets/todo.dart';

import '../widgets/todo.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          //pra não ficar feio já delimita aqui
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Coloque uma tarefa',
                          hintText: 'Tarefas mano faz algo',
                        ),
                      ),
                    ),
                    // width é tamanho geral
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        //text recebe texto do field
                        String text = todoController.text;
                        //adiciona text no list
                        setState(() {
                          todos.add(text);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1fd4f2),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(7),
                        ),
                      ),
                      child: Icon(Icons.add, size: 28, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //ListView aqui
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (String todo in todos) TodoListItem(title: todo, date: DateTime.now()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text('Você possui ${todos.length} tarefas presentes'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1fd4f2),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(7),
                        ),
                      ),
                      child: Text(
                        'Limpar tudo',
                        style: TextStyle(color: Colors.white),
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
}

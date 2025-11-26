import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tarefas/model/todo.dart';
import 'package:lista_tarefas/widgets/todo_list_item.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];
  Todo? temporariaTodo;
  int? posTemporariaTodo;

  void onDelete(Todo todo) {
    temporariaTodo = todo;
    posTemporariaTodo = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} removida com sucesso',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              todos.insert(posTemporariaTodo!, temporariaTodo!);
            });
          },
          backgroundColor: Color(0xff1fd4f2),
          textColor: Colors.white,
        ),
        duration: Duration(seconds: 5),
      ),
    );
  }

  void deleteAll() {
    setState(() {
      todos.clear();
    });
  }

  void showDialogConfirmationDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('limpar tudo?'),
        content: Text('Você tem certeza que deseja apagar tudo?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              deleteAll();
              Navigator.of(context).pop();
            },
            child: Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

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
                          Todo myTodo = Todo(title: text, date: DateTime.now());
                          todos.add(myTodo);
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
                      for (Todo todo in todos)
                        TodoListItem(todo: todo, onDelete: onDelete),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${todos.length} tarefas presentes',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: showDialogConfirmationDelete,
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

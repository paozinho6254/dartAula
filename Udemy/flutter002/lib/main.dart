import 'package:flutter/material.dart';
import 'package:lista_tarefas/page/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    //inicia a home com a página de tarefas
    return MaterialApp(home: TodoListPage(), debugShowCheckedModeBanner: false);
  }
}

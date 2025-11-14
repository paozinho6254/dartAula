import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  int numTarefas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //pra não ficar feio já delimita aqui
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
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
                    onPressed: () {},
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
              SizedBox(height: 20),
              //ListView aqui
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: CupertinoColors.inactiveGray,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui ${numTarefas} tarefas  presentes'),
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
                      'Lmpar tudo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

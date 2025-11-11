import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //pra não ficar feio já delimita aqui
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Icon(Icons.add, size: 28, color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

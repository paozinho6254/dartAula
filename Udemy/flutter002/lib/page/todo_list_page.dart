import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  
class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //Neste caso se comporta de maneira parecida ao mainAxisAligment
            //Mas ele só fala que vai ocupar o mínimo possível da tela
            //(e não vai funcionar sem o Center pós-body)
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController ,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                onChanged: onChanged,
              ),
              // Quando o botão ser apertado, ele terá escrito 'Entrar' e fará função
              // login (onPressed) ||
              //                   V
              ElevatedButton(onPressed: login, child: Text('entrar'))
            ],
          ),
        ),
      ),
    );
  }
  // Quando chamado, ele imprime o texto colocado no campo de texto no console
  void login(){
    String text = emailController.text;
    print('$text');
    emailController.clear();
  }
  void onChanged(String text){
    print(text);
  }
}

/*
final _cpfFormatter = MaslTextInputFormatter(
  mask: '###.###.###-##'
  filter:
)
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _entrou() {
    print('Aumentou');
  }

  void _saiu() {
    print('Decrementou');
    // if(pessoas > 0){
    //   pessoas--;
    // }
  }

  @override
  Widget build(BuildContext context) {
    int pessoas = 200;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Recebendo!',
            style: TextStyle(fontSize: 48, color: Colors.white),
          ),
          Text('$pessoas', style: TextStyle(color: Colors.white, fontSize: 32)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _entrou,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  fixedSize: const Size(125, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                      side: BorderSide(
                          color: Colors.green, width: 5
                      )
                  ),
                ),
                child: Text(
                  "Entrou",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: _saiu,
                // basicamente o padding é o espaço que o texto ocupa em relação as bordas do botão
                // a constante EdgeInsets.all(32) diz que vai acrescentar 32 pixels de espaço para todos os lados.
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  fixedSize: const Size(125, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    side: BorderSide(
                      color: Colors.red, width: 5,
                    )
                  )
                ),
                child: Text(
                  "Saiu",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

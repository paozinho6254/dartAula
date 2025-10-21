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
    // if (pessoas > 0) {
    //   pessoas--;
    // }
  }

  @override
  Widget build(BuildContext context) {
    int pessoas = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //image: NetworkImage('https://akamai.sscdn.co/uploadfile/letras/albuns/f/a/e/2/791351570015623.jpg'),
            image: AssetImage('assets/images/Avion.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Recebendo!',
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(48),
              child: Text(
                '0',
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
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
                      side: BorderSide(color: Colors.green, width: 5),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(width: 30),
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
                      side: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

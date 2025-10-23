import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pessoas = 0;

  void _entrou() {
    setState(() {
      if (pessoas < 20) {
        pessoas++;
      }
    });
    print(pessoas);
  }

  void _saiu() {
    if (pessoas > 0) {
      setState(() {
        pessoas--;
      });
      print(pessoas);
    }
  }

  bool get isEmpty => pessoas == 0;

  bool get isFull => pessoas == 20;

  bool get isHalf => pessoas >= 7 && pessoas <= 14;

  bool get isAlFull => pessoas > 14 && pessoas < 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //image: NetworkImage('https://akamai.sscdn.co/uploadfile/letras/albuns/f/a/e/2/791351570015623.jpg'),
            image: AssetImage('assets/images/Avion.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isEmpty
                  ? 'Restaurante vazio!'
                  : isHalf
                  ? 'Tá enchendo!!'
                  : isAlFull
                  ? 'Quase cheio!'
                  : isFull
                  ? 'Lotado!'
                  : 'Recebendo!',
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(48),
              child: Text(
                '$pessoas',
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : _entrou,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isFull
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.white,
                    fixedSize: const Size(125, 125),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                      side: BorderSide(
                        color: isFull
                            ? Colors.white.withValues(alpha: 0.0)
                            : Colors.green,
                        width: 5,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: isEmpty ? null : _saiu,
                  // basicamente o padding é o espaço que o texto ocupa em relação as bordas do botão
                  // a constante EdgeInsets.all(32) diz que vai acrescentar 32 pixels de espaço para todos os lados.
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isEmpty
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.white,
                    fixedSize: const Size(125, 125),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                      side: BorderSide(
                        color: isEmpty
                            ? Colors.white.withValues(alpha: 0.0)
                            : Colors.red,
                        width: 5,
                      ),
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

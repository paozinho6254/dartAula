import 'package:flutter/material.dart';

void main() {
  runApp(const ContadorPessoasApp());
}

class ContadorPessoasApp extends StatelessWidget {
  const ContadorPessoasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ContadorPessoas(),
    );
  }
}

class ContadorPessoas extends StatefulWidget {
  const ContadorPessoas({super.key});

  @override
  State<ContadorPessoas> createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorPessoas> {
  int _pessoas = 0;

  void _entrou() {
    setState(() {
      _pessoas++;
    });
  }

  void _saiu() {
    setState(() {
      if (_pessoas > 0) {
        _pessoas--;
      }
    });
  }

  void _zerar() {
    setState(() {
        _pessoas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Pessoas'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pessoas presentes:',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '$_pessoas',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _entrou,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _saiu,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _zerar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Zerar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
            )
          ],
        ),
      ),
    );
  }
}
// lib/main.dart
import 'package:flutter/material.dart';
import 'character_list_screen.dart'; // Importe sua nova tela de lista

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uma-dex Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Defina a tela de lista como a tela inicial
      home: const CharacterListScreen(),
    );
  }
}
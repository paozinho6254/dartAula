import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/sheep_breed.dart';
import 'models/sheep_model.dart';

import 'my_app.dart';

//Aqui o programa diz que espera void (Nada) mas que futuramente terá algo
//ou seja, fará tudo mas não espera um dado, apenas que tudo seja executado em ordem
Future<void> main() async {

  //Esquenta a água pro café
  WidgetsFlutterBinding.ensureInitialized();

  //Bota o pão na torradeira
  await Hive.initFlutter();

  //Quando vier dados do guarda volume 1 (@HiveType(typeId: 1) que é do SheepBreed
  //use-o para ler e escrever
  Hive.registerAdapter(SheepBreedAdapter());
  //o mesmo para este (@HiveType(typeId: 0))
  Hive.registerAdapter(SheepAdapter());

  await Hive.openBox<Sheep>('sheep_box');

  runApp(const MyApp());
}
import 'classe.dart';
import 'dart:io';

void main(){
  stdout.write('Digite seu nome sir: ');
  String nome = stdin.readLineSync()!;
  
  classe c1 = classe();
  c1.hello(nome);
}
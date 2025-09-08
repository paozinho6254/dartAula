import 'dart:io';
import 'carro.dart';

void main (){

  stdout.write('Digite a marca do carro: ');
  String? marca = stdin.readLineSync();           

  stdout.write('Digite o modelo do carro: ');
  String? modelo = stdin.readLineSync();

  stdout.write('Digite o ano do carro: ');
  int? ano = int.tryParse(stdin.readLineSync() ?? '');

  carro meuCarro = carro(marca: marca, modelo: modelo, ano: ano);
  meuCarro.exibirDetalhes();

}
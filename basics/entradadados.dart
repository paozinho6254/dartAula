import 'dart:io';

void main(){
  //Entrada de dados
  //informando o nome
  stdout.write("Diga seu nome! ");
  String? nome = stdin.readLineSync();

  //informando a idade
  stdout.write("Digite sua idade: ");
  String? idadeInput = stdin.readLineSync();
  int idade = int.parse(idadeInput ?? '0'); //se idade for nula converte

print("olá, $nome! você tem $idade anos");

}
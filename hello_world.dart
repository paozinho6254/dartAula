import 'dart:io';

void main() {
  String? input = stdin.readLineSync();

  //Inicio uma variável que possa ser String
  String? nome;

  print('Insira seu nome: ');
  stdout.write('Olá, $input');
  
  //caso queira tirar a variável de nula
  //nome = 'Pãozinho';
  
  //funciona quase como um if/else, basicamente cliente recebe o valor que tiver em nome,
  //porém, se nome não tiver dados (for nulo), ele por meio do ?? receberá um valor "template"
  //sendo esse valor o "Usuário", assim cliente recebe Usuário por padrão.
  String cliente = nome ?? "Usuário";


  

  

}
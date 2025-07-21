//biblioteca básica do dart
import 'dart:io';

void main() {

  print('Insira seu nome: ');
  //Inicializo o input e também já pedindo uma inserção
  String? nome = stdin.readLineSync();

  //Inicio uma variável que possa ser String
  
  if(nome == ""){
    nome = null;
  }

  //caso queira tirar a variável de nula
  //String nome = 'Pãozinho';
  
  //funciona quase como um if/else, basicamente cliente recebe o valor que tiver em nome,
  //porém, se nome não tiver dados (for nulo), ele por meio do ?? receberá um valor "template"
  //sendo esse valor o "Usuário", assim cliente recebe Usuário por padrão.
  String cliente = nome ?? "Usuário";

  print('Seja bem vindo cliente $cliente!');

}
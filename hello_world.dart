//biblioteca básica do dart
import 'dart:io';

void main() {

  print('Insira seu nome: ');
  //Inicializo o nome e também já pedindo uma inserção
  String? nome = stdin.readLineSync();

  //claro, se o usuário por um ponto em branco, nome será considerado null
  if(nome == ""){
    nome = null;
  }
  
  //funciona quase como um if/else, basicamente cliente recebe o valor que tiver em nome,
  //porém, se nome não tiver dados (for nulo), ele por meio do ?? receberá um valor "template"
  //sendo esse valor o "Usuário", assim cliente recebe Usuário por padrão.
  String cliente = nome ?? "Usuário";

  print('Seja bem vindo cliente $cliente!');

}
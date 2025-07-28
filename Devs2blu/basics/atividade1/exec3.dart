import 'dart:io';

void main(){

  stdout.write("Digite um número inteiro: ");
  int? numero = int.tryParse(stdin.readLineSync() ?? '');
  while(numero == null || numero <= 0){
    print('Erro: Por favor, digite um número inteiro válido.');
    stdout.write("Digite um número inteiro: ");
    numero = int.tryParse(stdin.readLineSync() ?? '');
  }

  for(int i = numero; i > 0; i--){
    print(i);
  }



}
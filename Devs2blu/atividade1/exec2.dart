import 'dart:io';

void main(){
  int? idade;
  do{
    stdout.write('Digite sua idade: ');
    idade = int.tryParse(stdin.readLineSync() ?? '');
    if (idade == null) {
      print('Erro: Por favor, digite números inteiros válidos.');
    }
  }while(idade == null);
  

  if(idade < 18){
    print("Acesso negado.");
  }
  else{
    print("Tá liberado");
  }

}
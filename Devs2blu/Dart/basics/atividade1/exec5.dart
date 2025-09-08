import 'dart:io';

void main() {
  stdout.write('Digite uma frase: ');
  String? frase = stdin.readLineSync();
  
  if (frase == null || frase.isEmpty) {
    print('Erro: Nenhuma frase foi digitada.');
    return;
  }
  
  int vogais = 0;
  int consoantes = 0;
  
  String fraseMinuscula = frase.toLowerCase();
  
  for (int i = 0; i < fraseMinuscula.length; i++) {
    String char = fraseMinuscula[i];
    
    if (RegExp(r'[a-z]').hasMatch(char)) {
      if ('aeiou'.contains(char)) {
        vogais++;
      } else {
        consoantes++;
      }
    }
  }
  
  print('Número de vogais: $vogais');
  print('Número de consoantes: $consoantes');
}
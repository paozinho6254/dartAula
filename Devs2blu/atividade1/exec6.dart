import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecreto = random.nextInt(100) + 1;
  int tentativas = 0;
  int? palpite;
  
  print('Bem-vindo ao Jogo de Adivinhação!');
  print('Tente adivinhar o número entre 1 e 100.');
  
  while (palpite != numeroSecreto) {
    stdout.write('Digite seu palpite: ');
    String? entrada = stdin.readLineSync();
    palpite = int.tryParse(entrada ?? '');
    
    if (palpite == null) {
      print('Por favor, digite um número válido.');
      continue;
    }
    
    tentativas++;
    
    if (palpite < numeroSecreto) {
      print('Muito baixo! Tente novamente.');
    } else if (palpite > numeroSecreto) {
      print('Muito alto! Tente novamente.');
    } else {
      print('Parabéns! Você acertou o número $numeroSecreto!');
      print('Número de tentativas: $tentativas');
    }
  }
}
import 'dart:io';

void main() {
  stdout.write('Digite o primeiro número inteiro: ');
  int? num1 = int.tryParse(stdin.readLineSync() ?? '');
  
  stdout.write('Digite o segundo número inteiro: ');
  int? num2 = int.tryParse(stdin.readLineSync() ?? '');
  

  if (num1 == null || num2 == null) {
    print('Erro: Por favor, digite números inteiros válidos.');
    return;
  }
  
  stdout.write('Digite a operação (+, -, *, /): ');
  String? operacao = stdin.readLineSync();
  
  switch (operacao) {
    case '+':
      print('Resultado: $num1 + $num2 = ${num1 + num2}');
      break;
    case '-':
      print('Resultado: $num1 - $num2 = ${num1 - num2}');
      break;
    case '*':
      print('Resultado: $num1 * $num2 = ${num1 * num2}');
      break;
    case '/':
      if (num2 == 0) {
        print('Erro: Divisão por zero não é permitida.');
      } else {
        print('Resultado: $num1 / $num2 = ${num1 / num2}');
      }
      break;
    default:
      print('Erro: Operação inválida. Use +, -, * ou /.');
  }
}
import 'dart:io';

void main(){

  List<double> notas = [];
  List<String> disciplinas = ['Matemática', 'Português', 'Ciências'];
  
  for (int i = 0; i < 3; i++) {
    double? nota;
    bool notaValida = false;
    
    while (!notaValida) {
      stdout.write('Digite a nota de ${disciplinas[i]} (0 a 10): ');
      String? entrada = stdin.readLineSync();
      nota = double.tryParse(entrada ?? '');
      
      if (nota == null || nota < 0 || nota > 10) {
        print('Erro: A nota deve ser um número entre 0 e 10. Tente novamente.');
      } else {
        notaValida = true;
        notas.add(nota);
      }
    }
  }
  
  double media = notas.reduce((a, b) => a + b) / notas.length;
  
  print('\nMédia final: ${media.toStringAsFixed(1)}');
  
  if (media >= 7.0) {
    print('Status: APROVADO');
  } else if (media >= 5.0) {
    print('Status: RECUPERAÇÃO');
  } else {
    print('Status: REPROVADO');
  }

}
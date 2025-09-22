import 'dart:io';

import 'livro.dart';
import 'pessoa.dart';
import 'emprestimo.dart';

void main() {
  List<Pessoa> pessoas = [];
  List<Livro> livros = [];
  List<Emprestimo> emprestimos = [];

  int idLivro = 0;
  int idPessoa = 0;
  int idEmprestimo = 0;

  bool funcionando = true;

  while (funcionando != false) {
    switch (menu()) {
      case 1:


        break;

      //Já da para cadastrar
      case 2 :
        idLivro++;
        stdout.write('Título: ');
        String titulo = stdin.readLineSync() ?? '*Não fornecido*';
        stdout.write('Autor: ');
        String autor = stdin.readLineSync() ?? '*Não fornecido*';
        stdout.write('Ano de lançamento: ');
        int? anoLancamento = int.tryParse(stdin.readLineSync() ?? '') ?? 2000;
        Livro livro = Livro(
          id: idLivro,
          titulo: titulo,
          autor: autor,
          anoLancameto: anoLancamento,
        );
        livros.add(livro);
        print(livro);
        break;

      case 3: 
        if(livros.isEmpty || pessoas.isEmpty){
          print('Não há dados suficientes para executar operação!');
        }
        else{
          switch(menuLivros(livros)){


          }
          //isso aqui é na hora de inserir
          DateTime dataDevolucao = dataEmprestimo.add((Duration(days: 90)));
        }
      break;

      case 5:
        funcionando = false;
        break;
    }
  }
}

int? menu() {
  print(
    '\n**************Menu**************'
    '\n1 - Cadastrar Pessoa'
    '\n2 - Cadastrar Livro'
    '\n3 - Fazer empréstimo'
    '\n4 - Emprestimos presentes'
    '\n5 - Finalizar Programa'
    'Opção: ',
  );
  int? opcao = int.tryParse(stdin.readLineSync() ?? '');
  return opcao;
}

// Faz o menu de livros, onde enquanto eu não escolher um válido ele vai ficar repetindo 
// Futuro: como exceptions para praticar tbm
int? menuLivros(List livros){
  print('Selecione um livro.\n');
  for(Livro livro in livros){
    print(livro);
  } 
  stdout.write('Escolha um livro');
}
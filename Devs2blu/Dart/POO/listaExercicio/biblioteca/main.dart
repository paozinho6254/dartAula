import 'dart:io';

import '../../../../../Udemy/dart002/OOP/Metodos/static_pessoa.dart';
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
        idPessoa++;
        stdout.write('Nome: ');
        String nome = stdin.readLineSync() ?? '*Não fornecido*';
        Pessoa pessoa = Pessoa(id: idPessoa, nome: nome);
        pessoas.add(pessoa);
        print(pessoa);
        break;

      //Já da para cadastrar
      case 2:
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
        if (livros.isEmpty || pessoas.isEmpty) {
          print('Não há dados suficientes para executar operação!');
        } else {
          int? posPessoa = menuPessoas(pessoas);
          int? posLivro = menuLivros(livros);
          idEmprestimo++;

          DateTime dataEmprestimo = DateTime.now();
          Emprestimo(id: idEmprestimo, nomeCliente: pessoaNome, nomeLivro: livroTitulo, dataEmprestimo: dataEmprestimo, dataDevolucao: dataEmprestimo.add((Duration(days: 90))));
          //isso aqui é na hora de inserir
          DateTime ;
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
int? menuLivros(List livros) {
  int? opcao;
  do {
    print('Selecione um livro pelo id.\n');
    for (Livro l in livros) {
      print("${l.id} - ${l.titulo}");
    }
    stdout.write('Escolha um livro: ');
    opcao = int.tryParse(stdin.readLineSync() ?? '');
    if (opcao == null || opcao <= 0 || opcao > livros.length) {
      print('Opção inválida, tente novamente.');
    }
  } while (opcao == null || opcao <= 0 || opcao > livros.length);
  return livros.indexOf(opcao);
}

int? menuPessoas(List pessoas) {
  int? opcao;
  do {
    print("Escolha uma pessoa por id: ");
    for (Pessoa p in pessoas) {
      print('Id: ${p.id} - Nome: ${p.nome}');
    }
    opcao = int.tryParse(stdin.readLineSync() ?? '');
    if (opcao == null || opcao > pessoas.length || opcao <= 0) {
      print('Opção inválida, tente novamente!');
    }
  } while (opcao == null || opcao > pessoas.length);
  return pessoas.indexOf(opcao);
}

//Criar metodos de achar Livro e pessoa
/*
          String pessoaNome;
          for (Pessoa p in pessoas) {
            if (posPessoa == p.id) {
              pessoaNome = p.nome;
            }
          }
          String livroTitulo;
          for (Livro l in livros) {
            if (posLivro = l.id) {
              livroTitulo = l.titulo;
            }
          }
*/
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
      case 1 :
        idPessoa++;
        stdout.write('Nome: ');
        String nome = stdin.readLineSync() ?? '*Não fornecido*';
        Pessoa pessoa = Pessoa(id: idPessoa, nome: nome);
        pessoas.add(pessoa);
        print(pessoa);
        break;

      //Já da para cadastrar
      case 2 :
        idLivro++;
        stdout.write('Título: ');
        String titulo = stdin.readLineSync() ?? '*Não fornecido*';
        stdout.write('Autor: ');
        String autor = stdin.readLineSync() ?? '*Não fornecido*';
        stdout.write('Ano de lançamento: ');
        int anoLancamento = int.tryParse(stdin.readLineSync() ?? '') ?? 2000;
        Livro livro = Livro(
          id: idLivro,
          titulo: titulo,
          autor: autor,
          anoLancameto: anoLancamento,
        );
        livros.add(livro);
        print(livro);
        break;

      case 3 :
        if (livros.isEmpty || pessoas.isEmpty) {
          print('Não há dados suficientes para executar operação!');
        } else {
          // Tratar o ? para tirar
          int posPessoa = menuPessoas(pessoas);
          int posLivro = menuLivros(livros);
          if(posPessoa == 0 || posLivro == 0){
            print('Cancelando operação...');
            break;
          }
            else{         
              Pessoa pessoa = procuraPessoa(pessoas, posLivro);
              Livro livro = procuraLivro(livros, posPessoa);

              DateTime dataEmprestimo = DateTime.now();
              DateTime dataDevolucao = dataEmprestimo;

              idEmprestimo++;
              Emprestimo emprestimo = Emprestimo(
              id: idEmprestimo,
              idCliente: pessoa.id,
              idLivro: livro.id,
              nomeCliente: pessoa.nome,
              nomeLivro: livro.titulo,
              dataEmprestimo: dataEmprestimo,
              dataDevolucao: dataDevolucao,
            );
            emprestimos.add(emprestimo);
            print('\nEmprestimo realizado com sucesso!\n'
            '$emprestimo');
          }
        }
        break;
      
      case 4 : 
        mostrarEmprestimos(emprestimos);
      break;

      case 5:
        funcionando = false;
        break;
    }
  }
}

int? menu() {
  stdout.write(
    '\n**************Menu**************'
    '\n1 - Cadastrar Pessoa'
    '\n2 - Cadastrar Livro'
    '\n3 - Fazer empréstimo'
    '\n4 - Emprestimos presentes'
    '\n5 - Finalizar Programa'
    '\nOpção: ',
  );
  int? opcao = int.tryParse(stdin.readLineSync() ?? '');
  return opcao;
}

// Futuro: como exceptions para praticar tbm
int menuLivros(List livros) {
  int? opcao;
  do {
    print('\nSelecione um livro pelo id.');
    for (Livro l in livros) {
      print('Id: ${l.id} - Título: ${l.titulo} - Autor: ${l.autor}');
    }
    stdout.write('\nID: ');
    opcao = int.tryParse(stdin.readLineSync() ?? '');
    if (opcao == null || !livros.any((l) => l.id == opcao) && opcao != 0) {
      print('Opção inválida, tente novamente.');
    }
  } while (opcao == null || !livros.any((l) => l.id == opcao) && opcao != 0);
  return opcao;
}

int menuPessoas(List pessoas) {
  int? opcao;
  do {
    print("\nSelecione uma pessoa pelo id: ");
    for (Pessoa p in pessoas) {
      print('Id: ${p.id} - Nome: ${p.nome}');
    }
    stdout.write('\nID: ');
    opcao = int.tryParse(stdin.readLineSync() ?? '');
    if (opcao == null || !pessoas.any((p) => p.id == opcao) && opcao != 0) {
      print('Opção inválida, tente novamente!');
    }
  } while (opcao == null || !pessoas.any((p) => p.id == opcao) && opcao != 0);
  return opcao;
}

Pessoa procuraPessoa(List<Pessoa> pessoas, int posPessoa) {
  for (Pessoa p in pessoas) {
    if (posPessoa == p.id) {
      return p;
    }
  }
  throw Exception('Pessoa com id $posPessoa não encontrada');
}

Livro procuraLivro(List<Livro> livros, int posLivro) {
  for (Livro l in livros) {
    if (posLivro == l.id) {
      return l;
    }
  }
  throw Exception('Pessoa com id $posLivro não encontrada');
}

void mostrarEmprestimos(List<Emprestimo> emprestimos){
  if(emprestimos.isEmpty){
    print('\nLista de emprestimos vazia! \nTente cadastrar um empréstimo para aparecer aqui!');
  }
  else{
    print('Empréstimos em andamento:\n');
    for(Emprestimo e in emprestimos){
      print(e);
    }
  }
}


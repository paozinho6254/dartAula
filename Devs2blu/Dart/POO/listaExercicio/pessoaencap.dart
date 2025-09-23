import 'dart:io';

class Pessoa {
  String _nome;
  int _idade;

  Pessoa({required String nome, required int idade})
    : this._nome = nome,
      this._idade = idade;

  set setNome(String nome) {
    this._nome = nome;
  }

  get getNome {
    return _nome;
  }

  set setIdade(int valor) {
    while (valor < 0) {
      if (valor < 0) {
        print('Idade inválida! Tente novamente: ');
      }
      valor = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    }
    this._idade = valor;
  }

  get getIdade {
    return _idade;
  }
}

void main() {
  stdout.write('Digite o nome da pessoa: ');
  String nome = stdin.readLineSync() ?? '';
  stdout.write('idade: ');
  int idade = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  Pessoa pessoa = Pessoa(nome: nome, idade: idade);

  pessoa.setIdade = -10;
}

import 'dart:io';
import 'produto.dart';

void main() {
  
  stdout.write('Digite o nome do produto: ');
  String? nome = stdin.readLineSync();

  // Verifica se o nome é nulo ou vazio e define um valor padrão
  nome = (nome == null || nome.trim().isEmpty) ? 'Produto Desconhecido' : nome;

  stdout.write('Digite o preço do produto: ');
  double? preco = double.tryParse(stdin.readLineSync() ?? '');

  Produto meuProduto = Produto(nome, preco ?? 0.0);
  meuProduto.exibirDetalhes();

}
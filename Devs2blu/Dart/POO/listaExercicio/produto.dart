class Produto {
  String? _nome;
  double? _preco;
  int? _quantidade;

  Produto({String? nome, double? preco, int? quantidade}) {
    this.nome = nome ?? "Não informado";
    this.preco = preco ?? 0.0;
    this.quantidade = quantidade ?? 0;
  }

  String get nome {
    return _nome ?? "Não informado";
  }

  set nome(String input) {
    _nome = input.isEmpty ? "Não informado" : input;
  }

  double get preco {
    return _preco ?? 0.0;
  } 

  set preco(double input) {
    _preco = input < 0 ? 0.0 : input;
  } 

  int get quantidade {
    return _quantidade ?? 0;
  } 

  set quantidade(int input) {
    _quantidade = input < 0 ? 0 : input;
  }

  double valorTotalEstoque() {
    return preco * quantidade;
  }

  @override
  String toString() {
    return "Produto: $nome, Preço: R\$${preco.toStringAsFixed(2)}, Quantidade: $quantidade, Valor Total em Estoque: R\$${valorTotalEstoque().toStringAsFixed(2)}";
  }
}


void main() {
  Produto produto = Produto(nome: "Caneta", preco: 1.50, quantidade: 100);
  print(produto);
  
  produto.preco = -5.0; 
  produto.quantidade = -10; 
  print(produto);
  
  produto.nome = "";
  print(produto);
}
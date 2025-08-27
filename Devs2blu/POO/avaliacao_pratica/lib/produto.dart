class Produto {
  String nome;
  double _preco = 0.0; // atributo privado

  // Construtor
  Produto(this.nome, double preco) {
    this.preco = preco; // usa o setter para validar
  }

  // get
  double get preco {
   return _preco;
  }

  // set com validação
  set preco(double valor) {
    if (valor < 0) {
      print("Preço não pode ser negativo. Definindo como 0.");
      _preco = 0.0;
    } else {
      _preco = valor;
    }
  }

  // Método para exibir os dados de produto
  void exibir() {
    print("Produto: $nome - Preço: R\$ ${_preco.toStringAsFixed(2)}");
  }
}
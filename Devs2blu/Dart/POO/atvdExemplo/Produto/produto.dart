class Produto {
  String _nome;
  double _preco;

	String get_nome() {
		return this._nome;
	}

	void setNome(String _nome) {
		this._nome = _nome;
	}

	double get_preco() {
		return this._preco;
	}

  void set_preco(double _preco) {
    // Garante que o preço não seja negativo
		this._preco = _preco < 0 ? 0 : _preco;
	}

  Produto(this._nome, this._preco);

  void exibirDetalhes() {
    // o R\$$ é o seguinte, R escreve, \ é que proximo é o $ e o $ é o valor do elemnento
    // é por que simplesmente $ são usados em ambos, $ no texto e $ no valor do elemento
    print('Produto: $_nome, Preço: R\$${_preco.toStringAsFixed(2)}');
  }
}
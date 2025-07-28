import 'dart:io';

class carro{

  String? marca;
  String? modelo;
  int? ano;

  carro({this.marca, this.modelo, this.ano});

	String? getMarca() {
		return this.marca;
	}

	void setMarca(String? marca) {
		this.marca = marca;
	}

	String? getModelo() {
		return this.modelo;
	}

	void setModelo(String? modelo) {
		this.modelo = modelo;
	}

	int? getAno() {
		return this.ano;
	}

	void setAno(int? ano) {
		this.ano = ano;
	}
  
  void exibirDetalhes() {
    print('\nMarca: $marca, Modelo: $modelo, Ano: $ano');
  }
}
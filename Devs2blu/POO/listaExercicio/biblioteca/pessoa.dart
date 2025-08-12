class pessoa {
  String nome;
  int idade;

  List<pessoa> pessoas = [];

  pessoa(this.nome, this.idade);

  void mostrarDados() {
    print('Nome: $nome');
    print('Idade: $idade');
  }

  void cadastrarPessoa(pessoa p) {
    
    
    pessoas.add(p);
  }


}
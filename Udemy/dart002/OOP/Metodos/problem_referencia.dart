class Pessoa {

  String nome;
  int idade;

  Pessoa({required this.nome, required this.idade});

}

void main(){

  Pessoa p1 = Pessoa(nome: "Pãozinho", idade: 20);

  print("Pessoa 1:");
  print(p1.nome);
  print(p1.idade);

  Pessoa p2 = p1;
  
  print("\nPessoa 2:");
  print(p2.nome.toUpperCase());
  print(p2.idade);

  //troco o nome da pessoa 1
  p1.nome = "receba";

  //mesmo assim pessoa 2 recebe nome de 1
  print("\nNome de pessoa 2:");
  print(p2.nome);
}
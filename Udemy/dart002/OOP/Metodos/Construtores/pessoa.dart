class Pessoa{

  Pessoa({required this.nome, required this.idade});

  String nome;
  int idade;

}

void main (){

  String nome = "Pãozinho";
  int idade = 20;

  Pessoa p1 = Pessoa(nome: nome, idade: idade);
  
  print(p1.nome);

}
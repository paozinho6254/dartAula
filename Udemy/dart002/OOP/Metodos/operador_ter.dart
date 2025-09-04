class Pessoa {

  String nome;
  int idade;
  String? cidade;

  Pessoa({required this.nome, required this.idade});

  void comer(){

    print("Comendo...");

  }

}

void main(){

  Pessoa p1 = Pessoa(nome: "Pãozinho", idade: 20);

  print(p1.nome);
  print(p1.idade);
  
  //'?' para caso pessoa seja nula
  Pessoa? p2;
  
  print(p2?.nome.toUpperCase());
  print(p2?.idade);
  print(p2?.cidade?.toUpperCase());

  //Se quiser rodar um metodo, ele acabará sendo apenas anulado e não será executado,
  // a não ser que insira dados no objeto
  p2?.comer();
}
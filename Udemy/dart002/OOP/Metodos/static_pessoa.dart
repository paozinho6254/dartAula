class pessoa{

  String nome;
  int idade;

  pessoa({required this.nome, required this.idade});

  void comer(){

    print('to comendo');

  }

  static void macaco(){
    print('macaco');
  }

  static String? atributoStatic = 'abc';

}

void main(){

  pessoa p1 = pessoa(idade: 21, nome: 'Pãozinho');

  print(pessoa.atributoStatic);
  pessoa.macaco();

}
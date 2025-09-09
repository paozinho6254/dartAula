class Animal {

  String? nome;
  int? idade;

  Animal({required this.nome, required this.idade});

  void dormir(){
    print('Dormindo...');
  }

  void comer(){
    print('Comendo...');
  }

  @override
  String toString(){
    return 'Nome: $nome, Idade: $idade';
  }

}



class Cachorro extends Animal{

  String cidade;

  Cachorro({required super.nome, required super.idade, String? cidade}) :
    this.cidade = cidade ?? 'cidade não informada'{
      print('Chachorro do forno');
    }
  

  void latir(){
    print('Au Au Au');
  }
  
  @override
  void comer (){
    print('Comendo carne...');
    super.comer();
  }

  @override
  String toString(){
    return 'Cachorro: $nome, Idade: $idade, Cidade: $cidade';
  }

}



class Gato extends Animal{

  int vidas;

  Gato({required super.nome, required super.idade, required this.vidas}){
    print('Gato criado');
  }

  void miar(){
    print('MIAAAAAAAAAAAAAAAAU');
  }

  @override
  void comer (){
    print('Comendo comida enlatada...');
  }

  @override
  String toString(){
    return 'Gato: $nome, Idade: $idade, Vidas restantes: $vidas';
  }

}



void main(){

  // Adicionando itens para cachorro
  Gato gato = Gato(nome: 'Miausculo', idade: 20, vidas: 3);
  Cachorro cachorro = Cachorro(nome: 'Toby', idade:  1, cidade: 'Blumenau');
  
  // Teste de coisas de animal
  print("Coisa de cachorro:\n");
  cachorro.latir();
  cachorro.dormir();
  cachorro.comer();

  print("\nCoisa de gato:\n");
  gato.miar();
  gato.dormir();
  gato.comer();

  //Teste de primeiro bixo na lista
  print("Lista\n");
  List <Animal> animais = [];
  animais.add(cachorro);
  animais.add(gato);

  Animal animal1 = animais.first;
  if(animal1 is Gato){
    animal1.miar();
  }
  else if(animal1 is Cachorro){
    animal1.latir();
  }
  
  // Escrevendo características de bixos
  print(cachorro);
  print(gato);

}
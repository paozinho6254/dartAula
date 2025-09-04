class Animal {

  String? nome;
  int? idade;

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

  void latir(){
    print('Au Au Au');
  }
  
  @override
  void comer (){
    print('Comendo carne...');
  }

  @override
  String toString(){
    return 'Cachorro: $nome, Idade: $idade';
  }

}



class Gato extends Animal{

  void miar(){
    print('MIAAAAAAAAAAAAAAAAU');
  }

  @override
  void comer (){
    print('Comendo comida enlatada...');
  }

  @override
  String toString(){
    return 'Gato: $nome, Idade: $idade';
  }

}



void main(){

  Gato gato = Gato();
  Cachorro cachorro = Cachorro();

  // Adicionando itens para cachorro
  cachorro.nome = "Toby";
  cachorro.idade = 1;

  gato.nome = "Miausculo";
  gato.idade = 20;

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
//Crie uma classe `Animal` com um método `fazerSom()`. Crie classes `Cachorro`, 
//`Gato` e `Vaca` que herdam de `Animal` e implementam `fazerSom()` de maneira diferente.

abstract class Animal {
  void fazerSom();
}

class Cachorro extends Animal{
  @override
  void fazerSom(){
    print('Au au');
  }

}

class Gato extends Animal{
  @override
  void fazerSom(){
    print('Miau miau nigga');
  }

}

class Vaca extends Animal{
  @override
  void fazerSom(){
    print('MOOOOOOOOOOOOOOO');
  }
  
}

void main(){

  Animal a1 = Cachorro();
  Animal a2 = Gato();
  Animal a3 = Vaca();

  a1.fazerSom();
  a2.fazerSom();
  a3.fazerSom();

  List<Animal> animais = [Cachorro(), Gato(), Vaca()];

  //Variável qualquer (animal) em animais, execute o método
  for(var animal in animais){
    animal.fazerSom();
  }
}
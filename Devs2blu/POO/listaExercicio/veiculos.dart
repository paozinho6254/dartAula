//Crie uma classe abstrata `Veiculo` com métodos `ligar()` e `desligar()`. 
//Implemente as classes `Carro` e `Moto`, sobrescrevendo os métodos.

abstract class Veiculo{
  String? marca;
  String? modelo;
  double? kmRodados;
  bool? estaLigado;

  void ligar();
  void desligar();
}



class Moto extends Veiculo{

  @override
  void ligar(){
        if(estaLigado != null){
      if(estaLigado == false){
        estaLigado = true;
        print("Vroom vroom (sons de moto ligando)");  
      }
      else{
        print("Motor da moto já está ligado!");
      }
    }
    else{
      print('Motor fundiu XD');
    }
  }

    @override
  void desligar(){
        if(estaLigado != null){
      if(estaLigado == true){
        estaLigado = false;
        print("VOOoooom... (moto desligada)");  
      }
      else{
        print("Motor da moto já está desligado!");
      }
    }
    else{
      print('Motor fundiu XD');
    }
  }
}

class Carro extends Veiculo{

  @override
  void ligar(){
        if(estaLigado != null){
      if(estaLigado == false){
        estaLigado = true;
        print("VRAAAAAAAM VRAAAAAAAM (sons de V10 dando ignição)");  
      }
      else{
        print("Motor do carro já está ligado!");
      }
    }
    else{
      print('Motor fundiu XD');
    }
  }

    @override
  void desligar(){
        if(estaLigado != null){
      if(estaLigado == true){
        estaLigado = false;
        print("*puff* (carro desligado)");  
      }
      else{
        print("Motor do carro já está desligado!");
      }
    }
    else{
      print('Motor fundiu XD');
    }
  }

}

void main(){

  Carro carro = Carro(
    marca: "Lexus (Toyota)", 
    modelo: "Lexus LFA"
    );

}
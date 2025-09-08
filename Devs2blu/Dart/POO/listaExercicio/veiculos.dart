//Crie uma classe abstrata `Veiculo` com métodos `ligar()` e `desligar()`. 
//Implemente as classes `Carro` e `Moto`, sobrescrevendo os métodos.


abstract class Veiculo{
  String? _marca;
  String? _modelo;
  double? _kmRodados;
  bool? _estaLigado;

  Veiculo({String? marca, String? modelo, double? kmRodados, bool? estaLigado}) : 
  _marca = marca, 
  _modelo = modelo, 
  _kmRodados = kmRodados, 
  _estaLigado = estaLigado;

  void ligar();
  void desligar();
}



class Moto extends Veiculo{

  String? _carenagem;

  Moto({String? marca, String? modelo, double? kmRodados, bool? estaLigado, String? carenagem}) : 
  _carenagem = carenagem,
  super(marca: marca, modelo: modelo, kmRodados: kmRodados, estaLigado: estaLigado);

  @override
  void ligar(){
        if(_estaLigado != null){
      if(_estaLigado == false){
        _estaLigado = true;
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
        if(_estaLigado != null){
      if(_estaLigado == true){
        _estaLigado = false;
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

  bool? _onPalheta;

  Carro({String? marca, String? modelo, double? kmRodados, bool? estaLigado, bool? onPalheta}) : 
  _onPalheta = onPalheta,
  super(marca: marca, modelo: modelo, kmRodados: kmRodados, estaLigado: estaLigado);

  @override
  void ligar(){
        if(_estaLigado != null){
      if(_estaLigado == false){
        _estaLigado = true;
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
        if(_estaLigado != null){
      if(_estaLigado == true){
        _estaLigado = false;
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
    modelo: "Lexus LFA",
    kmRodados: 10000,
    estaLigado: false,
    onPalheta: false
    );

    Moto moto = Moto(
      marca: "Honda",
      modelo: "Biz 125",
      kmRodados: 200000,
      estaLigado: false,
      carenagem: "Biz 100" 
    );

    carro.ligar();
    moto.ligar();

    moto.desligar();
    carro.desligar();

}

//Crie uma classe `ContaBancaria` com atributos `titular`, 
//`numero`, `saldo`. Implemente métodos para `depositar`, 
//`sacar` (com validação de saldo) e `mostrarSaldo`.

class Contabancaria {

  String? _titular;
  String? _numero;
  double? _saldo;

  Contabancaria({String? titular, String? numero, double? saldo}) {
    this._titular = titular ?? "Não informado";
    this._numero = numero ?? "0000-0";
    this._saldo = saldo ?? 0.0;
  }

  String get titular {
    return _titular ?? "Não informado";
  } 

  set titular(String input) {
    _titular = input.isEmpty ? "Não informado" : input;
  }

  String get numero {
    return _numero ?? "0000-0";
  } 

  set numero(String input) {
    _numero = input.isEmpty ? "0000-0" : input;
  }

  double get saldo {
    return _saldo ?? 0.0;
  }

  set saldo(double input) {
    _saldo = input < 0 ? 0.0 : input;
  }

  void depositar(double valor){
    if (valor > 0){
      _saldo = _saldo! + valor;
      print('Valor depositado! Novo saldo: ${mostrarSaldo()}');
    }
    else{
      print('Valor de depósito inválido!');
    }
  }

  void sacar(double valor){
    if (valor > 0 && valor <= _saldo!){
      _saldo = _saldo! - valor;
      print('Valor sacado! Novo saldo: ${mostrarSaldo()}');
    }
    else{
      print('Valor de saque inválido!');
    }

  }

  String mostrarSaldo(){
    return 'Saldo atual: $_saldo';
  }

}


void main() {
  
  Contabancaria conta = Contabancaria(titular: "João Silva", numero: "12345-6", saldo: 1000.0);
  conta.mostrarSaldo();
  conta.depositar(500.0);
  conta.sacar(200.0);
  conta.mostrarSaldo();
  conta.sacar(2000.0); // Tentativa de saque inválido

}
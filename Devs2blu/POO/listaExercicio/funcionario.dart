//Crie uma classe abstrata `Funcionario` com o método `calcularSalario()`. 
//Crie duas subclasses `Desenvolvedor` e `Gerente` 
//com implementações diferentes do cálculo do salário.

abstract class Funcionario {
  int? _id;
  String? _nome;
  

  Funcionario({int? id, String? nome}) {
    this._id = id ?? 0;
    this._nome = nome ?? "Não informado";
  }

  double calcularSalario();
}

class Gerente extends Funcionario {
  
  double? _salarioBase;
  double? _bonus;

  Gerente({int? id, String? nome, double? salarioBase, double? bonus}) : _salarioBase = salarioBase, _bonus = bonus, super(id: id, nome: nome);


  @override
  double calcularSalario() {
    return _salarioBase! + _bonus!;
  }
}

class Desenvolvedor extends Funcionario {

  double? _salarioBase;
  double? _beneficios;

  Desenvolvedor({
    int? id, 
    String? nome,
    double? salarioBase,
    double? beneficios
  }) :
  _salarioBase = salarioBase,
  _beneficios = beneficios,
  super(
    id: id,
    nome: nome
  );

  @override
  double calcularSalario(){
    return _salarioBase! - _beneficios!;
  }

}

void main(){

  Desenvolvedor dev = Desenvolvedor(
    id: 1000,
    nome: 'Pãozinho',
    salarioBase: 2000,
    beneficios: 650
  );

  Gerente gerente = Gerente(
    id: 200,
    nome: 'Jeca',
    salarioBase: 5000,
    bonus: 250
  );

  print("Salário do desenvolvedor de de id ${dev._id}: ${dev.calcularSalario()}");
  print("Salário do gerente de id ${gerente._id}: ${gerente.calcularSalario()}");

}
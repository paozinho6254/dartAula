//Crie uma classe abstrata `Funcionario` com o método `calcularSalario()`.
//Crie duas subclasses `Desenvolvedor` e `Gerente`
//com implementações diferentes do cálculo do salário.

abstract class Funcionario {
  int _id;
  String _nome;
  double _salarioBase;

  Funcionario(this._id, this._nome, this._salarioBase);

  double calcularSalario();
}

class Gerente extends Funcionario {
  double _bonus;

  Gerente({required int id,
  required String nome, 
  required double salarioBase, 
  required double bonus})
  : this._bonus = bonus,
  super(id, nome, salarioBase);

  @override
  double calcularSalario() {
    return _salarioBase + _bonus;
  }

  @override
  String toString(){
    return "Gerente de id: $_id, nome: $_nome, salario total: ${calcularSalario()} com bonus de (R\$$_bonus).";
  }
}

class Desenvolvedor extends Funcionario {
  double _beneficios;

  Desenvolvedor({required int id, 
  required String nome,
  required double salarioBase, 
  required double beneficios}) 
  : this._beneficios = beneficios,
  super(id, nome, salarioBase);
  

  @override
  double calcularSalario() {
    return _salarioBase - _beneficios;
  }

    @override
  String toString(){
    return "Subordinado de id: $_id, nome: $_nome, salario total: ${calcularSalario()} com beneficios de (R\$$_beneficios).";
  }

}

void main() {
  Desenvolvedor dev = Desenvolvedor(
    id: 1000,
    nome: 'Pãozinho',
    salarioBase: 2000,
    beneficios: 650,
  );

  Gerente gerente = Gerente(
    id: 200,
    nome: 'Jeca',
    salarioBase: 5000,
    bonus: 250,
  );

  List<Funcionario> funcionarios = [gerente, dev];

  for (Funcionario funca in funcionarios) {
    print("$funca\n");
  }

}

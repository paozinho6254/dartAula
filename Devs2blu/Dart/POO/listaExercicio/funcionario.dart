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
  double? _bonus;

  Gerente({int? id, String? nome, double? salarioBase, double? bonus})
    : _bonus = bonus,
      super(id: id, nome: nome, salarioBase: salarioBase);

  @override
  double calcularSalario() {
    return _salarioBase! + _bonus!;
  }
}

class Desenvolvedor extends Funcionario {
  double? _beneficios;

  Desenvolvedor({
    int? id,
    String? nome,
    double? salarioBase,
    double? beneficios,
  }) : _beneficios = beneficios,
       super(id: id, nome: nome, salarioBase: salarioBase);

  @override
  double calcularSalario() {
    return _salarioBase! - _beneficios!;
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
    print(funca);
  }

  print(
    "Salário do desenvolvedor de de id ${dev._id}: ${dev.calcularSalario()}",
  );
  print(
    "Salário do gerente de id ${gerente._id}: ${gerente.calcularSalario()}",
  );
}

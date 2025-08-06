void main(){

  Pessoa p1 = Pessoa();
  p1.nome = "Pãozinho";
  p1.idade = 18;

  print("Nome: ${p1.nome}");
  print("Idade: ${p1.idade}");

  p1.aniversario();

  print("${p1.nome} agora você tem ${p1.idade} anos.");

}

class Pessoa{

  String? nome;
  int? idade;

  void aniversario() {
    if (idade != null) {
      //Não, idade++ não da certo, pois idade pode ser nulo
      //Null assertion, idade não será nula aqui
      idade = idade! + 1;
      print("RECEBA! Feliz aniversário, $nome! Agora você tem $idade anos.");
    } else {
      print("Idade não definida para $nome.");
    }
  }

}
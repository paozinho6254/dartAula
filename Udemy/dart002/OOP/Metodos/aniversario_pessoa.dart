void main(){

  Pessoa p1 = Pessoa();
  Esposa e1 = Esposa();
  p1.nome = "Pãozinho";
  p1.idade = 18;
  
  e1.nomeEsposa = "Nathally";
  e1.idade = 18;

  print("Nome: ${p1.nome}");
  print("Idade: ${p1.idade}");

  p1.aniversario();

  print("${p1.nome} agora você tem ${p1.idade} anos.");
  
  p1.casar(e1.nomeEsposa);
  
  print('${p1.nome} você terá seu nome trocado para: ${p1.trocarNome()}');
  
}

class Pessoa{

  String? nome;
  int? idade;
  bool? casado = false;
  
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
  
  
  void casar(nomeEsposa){
    casado = true;
    print('Parabéns pelo casamento com $nomeEsposa');
  }
  
  String trocarNome(){
    return nome = 'Antônio';
  }
  
  void exibirDados(){
     //coloca pra exibir os dados do cara
  }
  
}

class Esposa{
  String? nomeEsposa;
  int? idade; 
}

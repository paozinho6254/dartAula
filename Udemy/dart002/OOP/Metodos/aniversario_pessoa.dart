void main(){

  Pessoa p2 = Pessoa(nome: 'Joca', idade: 37);

  Pessoa p1 = Pessoa(nome: "Pãozinho", idade: 18);
  print("Nome: ${p1.nome}");
  print("Idade: ${p1.idade}");

  p1.aniversario();

  print("${p1.nome} agora você tem ${p1.idade} anos.");
  
  p1.casar();

  print('${p1.nome} você terá seu nome trocado para: ${p1.trocarNome()}');

  p1.dinheiro = 200;
  p1.saldo;
  
}

class Pessoa{

  //Construtor no required para definir que estes valores realmente serão preenchidos
  //ao criar um objeto
  Pessoa({required this.nome, required this.idade, this.casado = false}){
    print('Adicionando nova pessoa...');
  }

  Pessoa.casado({required this.nome, required this.idade, this.casado = true});


  //com o construtor tendo required, não é mais preciso ter que colocar '?'
  //para sinalizar ao programa que este atributo possa ser null
  String nome;
  int idade;
  bool casado;
  
  double? _dinheiro;
  //Aniversario para previnir valores nulos
  void aniversarioNull() {
    //Não, idade++ não da certo, pois idade pode ser nulo
    //Null assertion, idade não será nula aqui
    idade = idade! + 1;
    print("RECEBA! Feliz aniversário, $nome! Agora você tem $idade anos.");
    }
  //Aniversario pós construtor, onde programa já sabe
  //que os valores imbutidos não serão nulos e que 
  //o comando idade++ será possível
  void aniversario() {
      idade++;
      print("RECEBA! Feliz aniversário, $nome! Agora você tem $idade anos.");
  }//com isso se demonstra o quanto construtores com required
  //são fundamentais
  
  void casar(){
    casado = true;
    print('Parabéns pelo casamento');
  }
  
  String trocarNome(){
    return nome = 'Antônio';
  }
  
  void exibirDados(){
     //coloca pra exibir os dados do cara
  }
  
  set dinheiro(double valor){
    print("Dinheiro de $nome foi atualizado!");
    _dinheiro = valor;
  }

  get saldo{
    print("Saldo atual $_dinheiro");
  }

}
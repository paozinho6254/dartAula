class pessoa{

  String nome;
  int idade;
  late String _cpf;
  late double temperatura = medirTemperatura();

  bool cpfInicializa = false;

  pessoa({required this.nome, required this.idade});

  void cpf(String valor){
    _cpf = valor;
    cpfInicializa = true;
  }

  void escCpf(){
    if(!cpfInicializa){
      print("erro! tente inicializar um cpf!");
    }
    else{
      print(_cpf);
    }
  }

  double medirTemperatura(){
    print("medindo temperatura...");
    return 37.0;
  }
}

void main(){
  pessoa p1 = pessoa(idade: 21, nome: 'Pãozinho');
  p1.cpf('11813742900');
  p1.escCpf();
  print(p1.temperatura);  
}
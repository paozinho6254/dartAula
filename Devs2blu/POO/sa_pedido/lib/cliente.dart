class Cliente {
  int? idCliente;
  String nomeCliente;
  String emailCliente;
  String cpfCliente;

  Cliente({
    this.idCliente,
    required this.nomeCliente,
    required this.emailCliente,
    required this.cpfCliente,
  });
  
  get getId {
    return idCliente;
  }

  set setNome(String nome) {
    nomeCliente = nome;
  }

  get getNome {
    return nomeCliente;
  }
  
  set setEmail(String email) {
    nomeCliente = email;
  }

  get getEmail {
    return emailCliente;
  }

  set setCPF(String cpf) {
    cpfCliente = cpf;
  }

  get getCPF {
    return cpfCliente;
  }

  @override
  String toString() {
    return 'ID: $idCliente, Nome: $nomeCliente, Email: $emailCliente, CPF: $cpfCliente';
  }

}

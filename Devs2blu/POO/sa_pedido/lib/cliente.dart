class Cliente {
  int idCliente;
  String nomeCliente;
  String cpfCliente;

  Cliente({
    required this.idCliente,
    required this.nomeCliente,
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

  set setCPF(String cpf) {
    cpfCliente = cpf;
  }

  get getCPF {
    return cpfCliente;
  }
}

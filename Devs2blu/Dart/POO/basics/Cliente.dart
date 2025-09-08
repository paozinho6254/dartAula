class Cliente {

  late int _idCliente;
  late String _nomeCliente;
  late String _cpfCliente;

    //Construtor
  Cliente(this._idCliente, this._nomeCliente, this._cpfCliente);

  int getIdCliente() {
    return _idCliente;
  }

  void setIdCliente(int id) {
    _idCliente = id;
  }

  String getNomeCliente() {
    return _nomeCliente;
  }

  void setNomeCliente(String nome) {
    _nomeCliente = nome;
  }

  String getCpfCliente() {
    return _cpfCliente;
  }

  void setCpfCliente(String cpf) {
    _cpfCliente = cpf;
  }

  void mostrarDados() {
    print('id: $getIdCliente(), Nome: $getNomeCliente(), CPF: $getCpfCliente()');
  }
}

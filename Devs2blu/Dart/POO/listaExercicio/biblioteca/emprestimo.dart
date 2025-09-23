class Emprestimo {
  int _id;
  int _idCliente;
  int _idLivro;

  String _nomeCliente;
  String _nomeLivro;
  DateTime _dataEmprestimo;
  late DateTime _dataDevolucao;

  Emprestimo({
    required int id,
    required int idCliente,
    required int idLivro,
    required String nomeCliente,
    required String nomeLivro,
    required DateTime dataEmprestimo,
    required DateTime dataDevolucao,
  }) : this._id = id,
       this._idCliente = idCliente,
       this._idLivro = idLivro,
       this._nomeCliente = nomeCliente,
       this._nomeLivro = nomeLivro,
       this._dataEmprestimo = dataEmprestimo,
       this._dataDevolucao = dataEmprestimo.add(Duration(days: 90));

  get id => this._id;

  set id(value) => this._id = value;

  get idCliente => this._idCliente;

  set idCliente(value) => this._idCliente = value;

  get idLivro => this._idLivro;

  set idLivro(value) => this._idLivro = value;

  get nomeCliente => this._nomeCliente;

  set nomeCliente(value) => this._nomeCliente = value;

  get nomeLivro => this._nomeLivro;

  set nomeLivro(value) => this._nomeLivro = value;

  get dataEmprestimo => this._dataEmprestimo;

  set dataEmprestimo(value) => this._dataEmprestimo = value;

  get dataDevolucao => this._dataDevolucao;

  set dataDevolucao(value) => this._dataDevolucao = value;

  String toString() {
    return 'Id: $_id, '
    'Nome: $_nomeCliente, '
    'Autor: $_nomeLivro, '
    'Data de emprestimo: $_dataEmprestimo, '
    'Data de devolução: $_dataDevolucao';
  }
}

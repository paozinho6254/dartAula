class Emprestimo {
  int _id;
  String _nomeCliente;
  String _nomeLivro;
  DateTime _dataEmprestimo;
  late DateTime _dataDevolucao;

  Emprestimo({
    required int id,
    required String nomeCliente,
    required String nomeLivro,
    required DateTime dataEmprestimo,
    required DateTime dataDevolucao,
  }) : this._id = id,
       this._nomeCliente = nomeCliente,
       this._nomeLivro = nomeLivro,
       this._dataEmprestimo = dataEmprestimo;


get id => this._id;

set id( value) => this._id = value;

get nomeCliente => this._nomeCliente;

set nomeCliente( value) => this._nomeCliente = value;

get nomeLivro => this._nomeLivro;

set nomeLivro( value) => this._nomeLivro = value;

get dataEmprestimo => this._dataEmprestimo;

set dataEmprestimo( value) => this._dataEmprestimo = value;

get dataDevolucao => this._dataDevolucao;

set dataDevolucao( value) => this._dataDevolucao = value;  

}
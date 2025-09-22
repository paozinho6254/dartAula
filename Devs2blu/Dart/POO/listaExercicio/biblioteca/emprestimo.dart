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
  

}
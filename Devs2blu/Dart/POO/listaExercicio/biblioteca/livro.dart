class Livro {

  int _id;
  String _titulo;
  String _autor;
  int _anoLancamento;

  Livro({
    required int id,
    required String titulo,
    required String autor,
    required int anoLancameto,
  }) :
  this._id = id,
  this._titulo = titulo,
  this._autor = autor,
  this._anoLancamento = anoLancameto;

  String toString(){
    return 'Id: $_id, Nome: $_titulo, Autor: $_autor, Ano de Lançamento: $_anoLancamento';
  }
  
}
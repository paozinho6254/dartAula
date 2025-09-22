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

  get id => this._id;

  set id( value) => this._id = value;

  get titulo => this._titulo;

  set titulo( value) => this._titulo = value;

  get autor => this._autor;

  set autor( value) => this._autor = value;

  get anoLancamento => this._anoLancamento;

  set anoLancamento( value) => this._anoLancamento = value;

  String toString(){
    return 'Id: $_id, Nome: $_titulo, Autor: $_autor, Ano de Lançamento: $_anoLancamento';
  }
  
}
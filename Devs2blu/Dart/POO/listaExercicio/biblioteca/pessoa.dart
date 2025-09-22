class Pessoa {
  int _id;
  String _nome;

  Pessoa({required int id, required String nome})
  : 
  this._id = id,
  this._nome = nome;

  get id => this._id;

 set id( value) => this._id = value;

  get nome => this._nome;

 set nome( value) => this._nome = value;

  @override 
  String toString(){
    return 'Id: $_id, Nome: $_nome';
  }

}
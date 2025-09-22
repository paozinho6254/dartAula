class Pessoa {
  int _id;
  String _nome;

  Pessoa({required int id, required String nome})
  : 
  this._id = id,
  this._nome = nome;

  @override 
  String toString(){
    return 'Id: $_id, Nome: $_nome';
  }

}
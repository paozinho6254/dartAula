class Documento {
  String _titulo;
  String _conteudo;

  Documento({required String titulo, required String conteudo})
  : this._titulo = titulo,
    this._conteudo = conteudo;

  get titulo => this._titulo;

  set titulo(value) => this._titulo = value;

  get conteudo => this._conteudo;

  set conteudo(value) => this._conteudo = value;

  
  
}

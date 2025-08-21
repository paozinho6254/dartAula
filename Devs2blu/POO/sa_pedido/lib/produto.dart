import 'tipo_produto.dart';

class Produto {
  int? idProduto;
  String nomeProduto;
  double precoProduto;
  TipoProduto tipoProduto;
  EspProduto espProduto;

  Produto({
    this.idProduto,
    required this.nomeProduto,
    required this.precoProduto,
    required this.tipoProduto,
    required this.espProduto,
  });

  get getIdProduto => idProduto;

  get getNomeProduto => nomeProduto;

  set setNomeProduto(nomeProduto) => this.nomeProduto = nomeProduto;

  get getPrecoProduto => precoProduto;

  set setPrecoProduto(precoProduto) => this.precoProduto = precoProduto;

  get getTipoProduto => tipoProduto;

  set setTipoProduto(tipoProduto) => this.tipoProduto = tipoProduto;

  get getEspProduto => espProduto;

  set setEspProduto(espProduto) => this.espProduto = espProduto;

  

}

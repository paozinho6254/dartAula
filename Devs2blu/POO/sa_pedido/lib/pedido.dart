import 'cliente.dart';
import 'produto.dart';

class Pedido {
  int? idPedido;
  int clienteId;
  String descricao;
  double valor;
  DateTime? dataPedido;

  Pedido({this.idPedido, required this.clienteId, required this.descricao, required this.valor, this.dataPedido});

  @override
  String toString() {
    return 'ID: $idPedido, Cliente ID: $clienteId, Descrição: $descricao, Valor: $valor, Data: $dataPedido';
  }
}
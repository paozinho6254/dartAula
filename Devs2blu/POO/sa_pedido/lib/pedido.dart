import 'cliente.dart';
import 'produto.dart';

class Pedido {

  int? idPedido;
  Cliente cliente;
  Produto produto;

  Pedido({this.idPedido ,required this.cliente, required this.produto});

  
}
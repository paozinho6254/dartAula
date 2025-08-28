import 'produto.dart';

void main() {
  // Crio produto de classe produto
  Produto p1 = Produto("Notebook", 3500.00);
  Produto p2 = Produto("Celular", -1500.00); // valor negativo, vai corrigir

  // Alterando preço 
  p2.preco = 2000.00;

  // Exibindo informações
  p1.exibir();
  p2.exibir();
}
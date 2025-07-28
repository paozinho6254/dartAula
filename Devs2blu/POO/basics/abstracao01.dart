//Import de outra classe
import 'Cliente.dart';

void main(){
  //Instanceio o objeto
  Cliente c1 = Cliente(1000, 'Pãozinho', '123.456.789-00');

  //Chamada do método
  c1.mostrarDados();
}
//Crie uma classe `Retangulo` com os atributos `largura` e `altura`. 
//Implemente métodos para calcular `área` e `perímetro`. 
//Faça validação para impedir valores negativos.

class Retangulo {

  double? largura;
  double? altura;

  double calcArea(altura, largura){
    double area = altura * largura;
    return area;
  }

  double calcPerimetro(altura, largura){
    double perimetro = (altura * 2) + (largura * 2);
    return perimetro;
  }

}

void main(){

  Retangulo ret = Retangulo(2, 3);

}
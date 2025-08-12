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

  Retangulo ret = Retangulo();

  double altura = 5.0;
  double largura = 10.0;

  print('Área do retangulo: ${ret.calcArea(altura, largura)}');
  print('Perimetro do retangulo: ${ret.calcPerimetro(altura, largura)}');

}
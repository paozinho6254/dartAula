void main(){

  // Aqui temos uma lista de strings
  // mas que não aceita valores nulos
  List<String> lista = [
    'Pãozinho',
    'Daniel',
  ];


  // Lista nullable
  // ou seja, os elementos podem ser nulos
  List<String?> lista1 = [
    'Pãozinho',
    'Daniel',
    null
  ];


  List<String>? lista2;

  List<String?>? lista3;


}
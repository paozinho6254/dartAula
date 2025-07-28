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

  if(lista2 != null){
    lista2.add('Pãozinho');
  }

  List<String?>? lista3;

  if(lista3 != null){
    lista3.add(null);
  }


}
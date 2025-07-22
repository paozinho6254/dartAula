void main(){

  List<String> nomes = [
    'Pãozinho',
    'Daniel',
    'Pedro',
    'Marcos',
    'Isabela',
    'Maria',
    'Matheus'
  ];
  
  
  print("For normal:");
  //for normal
  for(int i = 0; i < nomes.length; i++){
    print(nomes[i].toUpperCase());
  }

  print("\nFor mais legível:");
  //este for é mais legivel e percorre toda minha lista
  for(String nome in nomes){
    print(nome.toUpperCase());
  }

  
  //mas a diferença é que o for normal é usado para percorrer valores específicos
  //já o segundo for percorre toda a lista, só que mesmo assim podemos começar e também
  //terminar com valores específicos

  print("\nFor de subList:");
  //aqui diz que o segundo item da lista irá iniciar e termina no quinto (indice = 2)
  for(String nome in nomes.sublist(2, 5)){
    print(nome.toUpperCase());
  }

  //forEach 
  print("\nForEach clássico:");
  nomes.forEach((nome) {
    print(nome.toUpperCase());
  });


}
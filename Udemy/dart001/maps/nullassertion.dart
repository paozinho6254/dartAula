void main() {
  
  Map<int, String> ddds = {
    11: 'São Paulo',
    21: 'Rio de Janeiro',
    31: 'Minas Gerais',
    41: 'Paraná',
    51: 'Rio Grande do Sul',
  };

  ddds.addAll({90: 'Distrito do Roubo', 20 : 'Senerasal do Norte'});

  ddds.forEach((key, value) {
    // Cria variável valor, que ao receber key, ele a testa se é igual a 21
    // caso sim, o ternário define que o valor será convertido para maiúsculas
    // : value é caso não seja a chave 21
    String valor = (key == 21) ? value.toUpperCase() : value;

    //Aqui foi para informar o teste do comando .addAll
    if(key == 90){
      print("\nChaves novas adicionadas:");
    }
    print('Chave $key Valor $value');
  });
  

  // remove onde key (ddd) for maior que 31
  ddds.removeWhere((key, value) => key > 31);

  print("Removido ddds acima de 31: \n$ddds");

  //este é o Null Assertion 
  //Aqui indico que cidade nunca será nula
  String cidade = ddds[11]!;

  print(cidade);
}
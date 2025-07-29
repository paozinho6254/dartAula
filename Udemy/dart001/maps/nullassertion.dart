void main() {
  
  Map<int, String> ddds = {
    11: 'São Paulo',
    21: 'Rio de Janeiro',
    31: 'Minas Gerais',
    41: 'Paraná',
    51: 'Rio Grande do Sul',
  };

  //só testando 
  ddds.forEach((key, value) {
    // Cria variável valor, que ao receber key, ele a testa se é igual a 21
    // caso sim, o ternário define que o valor será convertido para maiúsculas
    // : value é caso não seja a chave 21
    String valor = (key == 21) ? value.toUpperCase() : value;
    print('Chave $key Valor $valor');
  });


}
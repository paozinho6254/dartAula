void main(){

  Map<int, String> ddds = {
    11: 'São Paulo',
    21: 'Rio de Janeiro',
    31: 'Minas Gerais',
    41: 'Paraná',
    51: 'Rio Grande do Sul',
  };

  String? cidade = ddds[5];

  print(ddds[11]); // Acessando o valor associado à chave 11
  print(ddds[21]); // Acessando o valor associado à chave 21    
  print(cidade); // Tentando acessar uma chave inexistente, resultará em null

  ddds[61] = 'Distrito Federal'; // Adicionando um novo chave-valor

  ddds.remove(51); // Removendo São Paulo
  
  print("\nddd's de forma ordenada: ");

  //chamada a função printMap
  printMap(ddds);
  
  // Exibindo apenas os valores do Map
  print("\nddd's apenas valores: ${ddds.values}");
  // Exibindo apenas as chaves do Map
  print("\nddd's apenas chaves: ${ddds.keys}");
}

// na função printMap, do map de tipo
void printMap(Map<int, String> map) {
//faça um forEach onde a chave e valor
  map.forEach((key, value) {
    //São impressos na ordem: DDD: cidade
    print('$key: $value');
  });
}
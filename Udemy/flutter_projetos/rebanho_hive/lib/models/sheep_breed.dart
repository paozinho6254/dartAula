import 'package:hive/hive.dart';

part 'sheep_breed.g.dart';

//HiveType é o id do guarda volume, que dentro possui as raças das ovelhas
@HiveType(typeId: 1)
enum SheepBreed{
  @HiveField(0)
  dorper,

  @HiveField(1)
  texel,
  
  @HiveField(2)
  santaInes,
}

// Função auxiliar para exibir nomes "bonitos" na UI
String getBreedName(SheepBreed breed) {
  switch (breed) {
    //caso o enum do objeto é de tipo dorper, ele dá o nome de Dorper
    //sucetivamente assim com as outras raças
    case SheepBreed.dorper:
      return 'Dorper';
    case SheepBreed.texel:
      return 'Texel';
    case SheepBreed.santaInes:
      return 'Santa Inês';
      // se não só retorna vazio, o que não vai acontecer, mas só por segurança
    default:
      return '';
  }
}
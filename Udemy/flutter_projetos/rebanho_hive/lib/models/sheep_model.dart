import 'package:hive/hive.dart';
import 'package:rebanho_hive/models/sheep_breed.dart';

part 'sheep_model.g.dart';

@HiveType(typeId: 0)
//HiveObject indica para cada objeto sheep onde ele está no Hive, isso pode ajudar para editar
class Sheep extends HiveObject {
  @HiveField(0)
  String rfid;

  @HiveField(1)
  int age;

  @HiveField(2)
  bool isVaccinated;

  @HiveField(3)
  //classe de sheep_breed.dart
  SheepBreed breed;

  //construtor
  Sheep({
    required this.rfid,
    required this.age,
    required this.isVaccinated,
    required this.breed,
  });

  String getBreedVaccinated (){
    if(isVaccinated!){
      return 'Não vacinada';
    }
    else{
      return 'Vacinada';
    }
  }
}

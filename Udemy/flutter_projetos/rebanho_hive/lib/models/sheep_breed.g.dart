// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheep_breed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SheepBreedAdapter extends TypeAdapter<SheepBreed> {
  @override
  final int typeId = 1;

  @override
  SheepBreed read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SheepBreed.dorper;
      case 1:
        return SheepBreed.texel;
      case 2:
        return SheepBreed.santaInes;
      default:
        return SheepBreed.dorper;
    }
  }

  @override
  void write(BinaryWriter writer, SheepBreed obj) {
    switch (obj) {
      case SheepBreed.dorper:
        writer.writeByte(0);
        break;
      case SheepBreed.texel:
        writer.writeByte(1);
        break;
      case SheepBreed.santaInes:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheepBreedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

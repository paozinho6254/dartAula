// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SheepAdapter extends TypeAdapter<sheep> {
  @override
  final int typeId = 0;

  @override
  sheep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return sheep(
      rfid: fields[0] as String,
      idade: fields[1] as int,
      isVaccinated: fields[2] as bool,
      breed: fields[3] as SheepBreed,
    );
  }

  @override
  void write(BinaryWriter writer, sheep obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.rfid)
      ..writeByte(1)
      ..write(obj.idade)
      ..writeByte(2)
      ..write(obj.isVaccinated)
      ..writeByte(3)
      ..write(obj.breed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burner_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BurnerLocalModelAdapter extends TypeAdapter<BurnerLocalModel> {
  @override
  final int typeId = 5;

  @override
  BurnerLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BurnerLocalModel(
      strtburner: fields[2] as bool,
      logburner: fields[1] as String,
      regburner: fields[0] as String,
      cabburner: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BurnerLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.regburner)
      ..writeByte(1)
      ..write(obj.logburner)
      ..writeByte(2)
      ..write(obj.strtburner)
      ..writeByte(3)
      ..write(obj.cabburner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BurnerLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

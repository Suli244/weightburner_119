// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_scanner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveScannerAdapter extends TypeAdapter<HiveScanner> {
  @override
  final int typeId = 2;

  @override
  HiveScanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveScanner(
      name: fields[0] as String,
      calories: fields[1] as String,
      carbohydrates: fields[2] as String,
      proteins: fields[3] as String,
      fats: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveScanner obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.carbohydrates)
      ..writeByte(3)
      ..write(obj.proteins)
      ..writeByte(4)
      ..write(obj.fats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveScannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

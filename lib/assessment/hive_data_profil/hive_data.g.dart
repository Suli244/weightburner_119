// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDataAdapter extends TypeAdapter<HiveData> {
  @override
  final int typeId = 1;

  @override
  HiveData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveData(
      name: fields[0] as String,
      imageAvatar: fields[1] as String,
      gender: fields[2] as String,
      age: fields[3] as String,
      weight: fields[4] as String,
      height: fields[5] as String,
      desiredWeight: fields[6] as String,
      train: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageAvatar)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.desiredWeight)
      ..writeByte(7)
      ..write(obj.train);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

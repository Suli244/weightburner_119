// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChallengesHiveModelAdapter extends TypeAdapter<ChallengesHiveModel> {
  @override
  final int typeId = 3;

  @override
  ChallengesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengesHiveModel(
      id: fields[0] as int,
      image: fields[1] as String,
      data: fields[2] as String,
      lang: fields[3] as String,
      stars: fields[4] as double,
      title: fields[5] as String,
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChallengesHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.lang)
      ..writeByte(4)
      ..write(obj.stars)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

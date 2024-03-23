// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChallengesContentAdapter extends TypeAdapter<ChallengesContent> {
  @override
  final int typeId = 4;

  @override
  ChallengesContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengesContent(
      id: fields[0] as int,
      image: fields[1] as String,
      title: fields[2] as String,
      status: fields[3] as String,
      daysPassed: fields[4] as int,
      daysLeft: fields[5] as int,
      sp: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChallengesContent obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.daysPassed)
      ..writeByte(5)
      ..write(obj.daysLeft)
      ..writeByte(6)
      ..write(obj.sp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengesContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

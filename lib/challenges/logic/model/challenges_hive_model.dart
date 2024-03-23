// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'challenges_hive_model.g.dart';

@HiveType(typeId: 3)
class ChallengesHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String data;
  @HiveField(3)
  String lang;
  @HiveField(4)
  double stars;
  @HiveField(5)
  String title;
  @HiveField(6)
  String description;

  ChallengesHiveModel({
    required this.id,
    required this.image,
    required this.data,
    required this.lang,
    required this.stars,
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return '$title';
  }
}

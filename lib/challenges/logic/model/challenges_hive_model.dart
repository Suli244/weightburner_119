// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'challenges_hive_model.g.dart';

@HiveType(typeId: 4)
class ChallengesContent extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String title;
  @HiveField(3)
  String status;
  @HiveField(4)
  int daysPassed;
  @HiveField(5)
  int daysLeft;
  @HiveField(6)
  bool sp;
  ChallengesContent({
    required this.id,
    required this.image,
    required this.title,
    required this.status,
    required this.daysPassed,
    required this.daysLeft,
    required this.sp,
  });
}

import 'package:hive/hive.dart';
part 'hive_data.g.dart';

@HiveType(typeId: 1)
class HiveData extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String imageAvatar;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String age;

  @HiveField(4)
  String weight;

  @HiveField(5)
  String height;

  @HiveField(6)
  String desiredWeight;

  @HiveField(7)
  String train;

  HiveData({
    required this.name,
    required this.imageAvatar,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.desiredWeight,
    required this.train,
  });
}

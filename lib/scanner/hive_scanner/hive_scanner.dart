import 'package:hive/hive.dart';
part 'hive_scanner.g.dart';

@HiveType(typeId: 2)
class HiveScanner extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String calories;

  @HiveField(2)
  String carbohydrates;

  @HiveField(3)
  String proteins;

  @HiveField(4)
  String fats;

  HiveScanner({
    required this.name,
    required this.calories,
    required this.carbohydrates,
    required this.proteins,
    required this.fats,
  });
}

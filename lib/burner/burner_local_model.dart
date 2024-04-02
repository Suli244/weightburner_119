import 'package:hive_flutter/hive_flutter.dart';

part 'burner_local_model.g.dart';

@HiveType(typeId: 5)
class BurnerLocalModel extends HiveObject {
  @HiveField(0)
  String regburner;
  @HiveField(1)
  String logburner;
  @HiveField(2)
  bool strtburner;
  @HiveField(3)
  String cabburner;

  BurnerLocalModel({
    required this.strtburner,
    required this.logburner,
    required this.regburner,
    required this.cabburner,
  });
}

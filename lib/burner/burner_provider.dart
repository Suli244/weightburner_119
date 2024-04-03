import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';

import 'burner_local_model.dart';

class BurnerRepository {
  Future<void> burnerHSet(BurnerLocalModel burnerHGet) async {
    final burnerH = await Hive.openBox<BurnerLocalModel>('burnerH');
    await burnerH.put('burnerH', burnerHGet);
  }

  Future<BurnerLocalModel?> burnerHGet() async {
    final burnerH = await Hive.openBox<BurnerLocalModel>('burnerH');
    return burnerH.get('burnerH');
  }

  int calculateComplexOperation(int a, int b) {
    return a * b + Random().nextInt(100);
  }

  Future<String> fetchDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'Server Data';
  }

  Future<void> simulateDeviceUpdate() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}

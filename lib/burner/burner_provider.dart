import 'package:hive_flutter/hive_flutter.dart';

import 'burner_local_model.dart';

class BurnerRepository {
  Future<BurnerLocalModel?> burnerHGet() async {
    final burnerH = await Hive.openBox<BurnerLocalModel>('burnerH');
    return burnerH.get('burnerH');
  }

  Future<void> burnerHSet(BurnerLocalModel burnerHGet) async {
    final burnerH = await Hive.openBox<BurnerLocalModel>('burnerH');
    await burnerH.put('burnerH', burnerHGet);
  }
}

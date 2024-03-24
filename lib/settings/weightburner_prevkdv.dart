// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/urls.dart';
import 'package:weightburner_119/settings/weightburner_adasaklnsa.dart';

Future<bool> getWeightburnerPinjcdv() async {
  final jkhdjvhjdsjsdv = await SharedPreferences.getInstance();
  return jkhdjvhjdsjsdv.getBool('bvnuhffijkdsvnl') ?? false;
}

Future<void> setWeightburnerPinjcdv() async {
  final jkhdjvhjdsjsdv = await SharedPreferences.getInstance();
  jkhdjvhjdsjsdv.setBool('bvnuhffijkdsvnl', true);
}

Future<void> restoreWeightburnerPinjcdv(BuildContext context) async {
  final currencyAdaptyRestoreResult =
      await WeightburnerAdapty().weightburnerRestorePurchases();
  if (currencyAdaptyRestoreResult?.accessLevels['premium']?.isActive ?? false) {
    final jkhdjvhjdsjsdv = await SharedPreferences.getInstance();
    jkhdjvhjdsjsdv.setBool("bvnuhffijkdsvnl", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const WbBottomBar()),
      (route) => false,
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to currencySupport: ${DocFF.s}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}

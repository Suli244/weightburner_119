// ignore_for_file: use_build_context_synchronously

import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/urls.dart';

Future<bool> getWeightburnerPinjcdv() async {
  final preferences = await SharedPreferences.getInstance();
  return preferences.getBool('bvnuhffijkdsvnl') ?? false;
}

Future<void> setWeightburnerPinjcdv() async {
  final scdsd = await SharedPreferences.getInstance();
  scdsd.setBool('bvnuhffijkdsvnl', true);
}

Future<void> restoreWeightburnerPinjcdv(BuildContext context) async {
  final hasPremiumAccess = await Apphud.hasPremiumAccess();
  final hasActiveSubscription = await Apphud.hasActiveSubscription();
  if (hasPremiumAccess || hasActiveSubscription) {
    final scdsd = await SharedPreferences.getInstance();
    scdsd.setBool("bvnuhffijkdsvnl", true);
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success!'),
        content: const Text('Your purchase has been restored!'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WbBottomBar()),
                (route) => false,
              );
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to support: ${DocFF.s}'),
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

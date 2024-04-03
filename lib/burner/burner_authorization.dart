import 'package:dio/dio.dart';

import 'burner_funcii.dart';

Future<String?> burnerAuthorization({
  required String l,
  required String addPath,
  required String p,
}) async {
  final burnerIsConnected = await burnerIsInternetConnected();
  if (burnerIsConnected) {
    try {
      final backKluchOtvet = await Dio().post(
        addPath,
        data: {"username": l, "password": p},
      );
      if (backKluchOtvet.data != null) {
        return backKluchOtvet.data['access'];
      }
    } catch (exp) {
      throw Exception(exp);
    }
  }

  return null;
}

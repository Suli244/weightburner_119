import 'package:dio/dio.dart';

import 'burner_funcii.dart';

Future<String?> burnerAuthorization({
  required String addPath,
  required String l,
  required String p,
}) async {
  final burnerIsConnected = await burnerIsInternetConnected();
  if (burnerIsConnected) {
    try {
      final serverAuthKeyResponse = await Dio().post(
        addPath,
        data: {"username": l, "password": p},
      );
      if (serverAuthKeyResponse.data != null) {
        return serverAuthKeyResponse.data['access'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  return null;
}

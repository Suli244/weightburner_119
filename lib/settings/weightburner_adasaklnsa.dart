import 'dart:async' show Future;
import 'package:adapty_flutter/adapty_flutter.dart';

class WeightburnerAdapty {
  void Function(AdaptyError)? onWeightburnerAdaptyErrorOccurred;
  void Function(Object)? onWeightburnerUnknownErrorOccurred;

  final weightburnerAdapty = Adapty();

  static final WeightburnerAdapty _weightburnerInstance = WeightburnerAdapty._internal();

  factory WeightburnerAdapty() {
    return _weightburnerInstance;
  }

  WeightburnerAdapty._internal();

  Future<AdaptyProfile?> learCall() async {
    try {
      final nvdskkwefk = await weightburnerAdapty.getProfile();
      return nvdskkwefk;
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }
    return null;
  }

  Future<void> initializeWeightburnerAdapty() async {
    try {
      weightburnerAdapty.setLogLevel(AdaptyLogLevel.verbose);
      weightburnerAdapty.activate();
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }
  }

  Future<AdaptyPaywall?> weightburnerGetPaywall(
    String weightburnerPaywallId,
  ) async {
    try {
      final weightburnernvdskkwefk = await weightburnerAdapty.getPaywall(
        placementId: weightburnerPaywallId,
        loadTimeout: const Duration(seconds: 5),
      );
      return weightburnernvdskkwefk;
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<List<AdaptyPaywallProduct>?>weightburnerGetPaywallProducts(
    AdaptyPaywall weightburnerPaywall,
  ) async {
    try {
      final weightburnernvdskkwefk =
          await weightburnerAdapty.getPaywallProducts(paywall: weightburnerPaywall);
      return weightburnernvdskkwefk;
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> weightburnerMakePurchase(
      AdaptyPaywallProduct weightburnerProduct) async {
    try {
      final weightburnernvdskkwefk =
          await weightburnerAdapty.makePurchase(product: weightburnerProduct);
      return weightburnernvdskkwefk;
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<AdaptyProfile?> weightburnerRestorePurchases() async {
    try {
      final weightburnernvdskkwefk = await weightburnerAdapty.restorePurchases();

      return weightburnernvdskkwefk;
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }

    return null;
  }

  Future<bool> weightburnerHasPremiumStatus() async {
    try {
      final weightburnerProfile = await weightburnerAdapty.getProfile();
      if (weightburnerProfile.accessLevels['premium']?.isActive ?? false) {
        return true;
      }
    } on AdaptyError catch (adaptyError) {
      onWeightburnerAdaptyErrorOccurred?.call(adaptyError);
    } catch (e) {
      onWeightburnerUnknownErrorOccurred?.call(e);
    }

    return false;
  }
}

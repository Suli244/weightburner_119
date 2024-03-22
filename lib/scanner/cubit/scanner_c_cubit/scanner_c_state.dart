part of 'scanner_c_cubit.dart';

@freezed
class ScannerCState with _$ScannerCState {
  const factory ScannerCState.initial() = _Initial;
  const factory ScannerCState.loading() = _Loading;
  const factory ScannerCState.success(FoodModel? foodModel) = _Success;
  const factory ScannerCState.error(String e) = _Error;

  const ScannerCState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}

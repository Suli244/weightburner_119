import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weightburner_119/scanner/model/food_model.dart';
part 'scanner_c_state.dart';
part 'scanner_c_cubit.freezed.dart';

class ScannerCCubit extends Cubit<ScannerCState> {
  ScannerCCubit() : super(const ScannerCState.initial());

  Future<void> getFood(String barCode) async {
    emit(const ScannerCState.loading());
    try {
      final food = await fetchFoodFromServer(barCode);
      emit(ScannerCState.success(food));
    } catch (e) {
      emit(ScannerCState.error(e.toString()));
    }
  }

  Future<FoodModel?> fetchFoodFromServer(String barCode) async {
    final dio = Dio();
    try {
      final response = await dio
          .get('https://world.openfoodfacts.net/api/v2/product/$barCode');
      print(response.data['product']['nutriments']);
      if (response.data != null) {
        final statusCode = response.data['status'] ?? 0;
        if (statusCode == 1) {
          final calories =
              response.data['product']['nutriments']['energy'] as num?;
          final fats = response.data['product']['nutriments']['fat'] as num?;
          final carbs =
              response.data['product']['nutriments']['carbohydrates'] as num?;
          final proteins =
              response.data['product']['nutriments']['proteins'] as num?;
          return FoodModel(
            carbonhydrates: carbs,
            calories: calories,
            fat: fats,
            proteins: proteins,
          );
        }
        return null;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}

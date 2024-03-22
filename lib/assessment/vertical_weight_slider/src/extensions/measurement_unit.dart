import 'package:weightburner_119/assessment/vertical_weight_slider/src/models/measurement_unit.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/vertical_weight_slider.dart';

extension MeasurementUnitExtension on MeasurementUnit {
  int get largePointerIndex {
    switch (this) {
      case MeasurementUnit.kg:
        return 10;
      default:
        return 12;
    }
  }

  int get mediumPointerIndex {
    switch (this) {
      case MeasurementUnit.kg:
        return 5;
      default:
        return 6;
    }
  }
}

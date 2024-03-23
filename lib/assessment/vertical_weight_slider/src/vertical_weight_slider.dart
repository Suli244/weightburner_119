import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/src/widgets/weight_pointer.dart';
import '../vertical_weight_slider.dart';

class VerticalWeightSlider extends StatelessWidget {
  const VerticalWeightSlider({
    super.key,
    required this.controller,
    this.height = 250,
    this.decoration = const PointerDecoration(),
    this.indicator,
    required this.onChanged,
    this.isVertical = true,
    this.haptic = Haptic.none,
    this.diameterRatio = 3.0,
    this.unit = MeasurementUnit.kg,
  });

  /// A controller for scroll views whose items have the same size.
  final WeightSliderController controller;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// Pointer configuration
  final PointerDecoration decoration;

  /// Describes the configuration for a vertical weight slider.
  final Widget? indicator;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<double> onChanged;

  /// A Boolean value that indicates whether the slider is vertical.
  final bool isVertical;

  /// Allows access to the haptic feedback interface on the device.
  final Haptic haptic;

  /// A ratio between the diameter of the cylinder and the viewport's size in the main axis.
  final double diameterRatio;

  final MeasurementUnit unit;

  double selectedWeight(int index) =>
      controller.minWeight + (index * controller.interval);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RotatedBox(
        quarterTurns: isVertical ? 0 : 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListWheelScrollView.useDelegate(
              itemExtent: controller.itemExtent,
              diameterRatio: 300.w,
              controller: controller,
              physics: const FixedExtentScrollPhysics(),
              perspective: 0.01,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: controller.markCount,
                builder: (context, index) {
                  if (index % unit.largePointerIndex == 0) {
                    return WeightPointer(
                      color: Colors.white.withOpacity(0.60),
                      width: 58.w,
                      height: 3,
                    );
                  }
                  if (index % unit.mediumPointerIndex == 0) {
                    return WeightPointer(
                      color: Colors.white.withOpacity(0.60),
                      width: 65.w,
                      height: 3,
                    );
                  }
                  return WeightPointer(
                    color: Colors.white.withOpacity(0.60),
                    width: 50.w,
                    height: 2,
                  );
                },
              ),
              onSelectedItemChanged: (index) {
                onChanged(selectedWeight(index));
                haptic.run();
              },
            ),
            indicator ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

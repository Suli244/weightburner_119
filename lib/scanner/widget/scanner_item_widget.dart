import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class ScannerItemWidget extends StatelessWidget {
  const ScannerItemWidget({
    super.key,
    required this.title,
    required this.des,
    this.isDivider = false,
    this.isSize = false,
  });
  final String title;
  final String des;
  final bool isDivider;
  final bool isSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.5.h,
                fontWeight: FontWeight.w400,
                color: WbColors.black,
              ),
            ),
            const Spacer(),
            Text(
              des,
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: WbColors.black,
              ),
            ),
          ],
        ),
        isDivider
            ? const SizedBox()
            : Divider(
                height: 10,
                thickness: 0.5,
                color: WbColors.black.withOpacity(0.3),
              ),
        isSize ? const SizedBox() : SizedBox(height: 5.h),
      ],
    );
  }
}

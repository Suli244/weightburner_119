import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.des,
  });
  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                color: WbColors.black,
              ),
            ),
            const Spacer(),
            Text(
              des,
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                color: WbColors.black,
              ),
            ),
          ],
        ),
        Divider(
          height: 25,
          thickness: 0.5,
          color: WbColors.black.withOpacity(0.3),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

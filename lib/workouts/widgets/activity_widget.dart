import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity calendar',
            style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            padding: EdgeInsets.all(12.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: WbColors.blue009AFF,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/kcalIcon.png', width: 24),
                SizedBox(width: 8.w),
                Text(
                  'Calories',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w700,
                    color: WbColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: WbColors.blue009AFF,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/stepsIcon.png', width: 24),
                SizedBox(width: 8.w),
                Text(
                  'Steps',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w700,
                    color: WbColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class RestBut extends StatelessWidget {
  const RestBut({
    super.key,
    required this.onPressTerOfSer,
    required this.onPressRest,
    required this.onPressPriPol,
  });

  final Function() onPressTerOfSer;
  final Function() onPressRest;
  final Function() onPressPriPol;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5.w),
        InkWell(
          onTap: onPressTerOfSer,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: WbColors.white9ba6b2,
                ),
              ),
            ),
            child: Text(
              'Terms of Service',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
                color: WbColors.white9ba6b2,
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/line.png',
          width: 1.6,
          color: WbColors.white9ba6b2,
        ),
        const Spacer(),
        InkWell(
          onTap: onPressRest,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: WbColors.white9ba6b2,
                ),
              ),
            ),
            child: Text(
              'Restore',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
                color: WbColors.white9ba6b2,
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/line.png',
          width: 1.6,
          color: WbColors.white9ba6b2,
        ),
        const Spacer(),
        InkWell(
          onTap: onPressPriPol,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: WbColors.white9ba6b2,
                ),
              ),
            ),
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
                color: WbColors.white9ba6b2,
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}

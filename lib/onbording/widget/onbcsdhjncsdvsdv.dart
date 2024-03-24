import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItemKjbcasc extends StatelessWidget {
  const OnBoardingItemKjbcasc({
    super.key,
    required this.imageOnBoar,
    required this.titleOnBoar,
    required this.desOnBoar,
  });
  final String imageOnBoar;
  final String titleOnBoar;
  final String desOnBoar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageOnBoar,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
        Positioned(
          bottom: 185.h,
          left: 0,
          right: 0,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  titleOnBoar,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                desOnBoar,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

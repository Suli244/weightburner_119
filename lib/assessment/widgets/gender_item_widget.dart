// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class GengerItemWidget extends StatelessWidget {
  const GengerItemWidget({
    super.key,
    required this.imageGend,
    required this.titleGend,
    required this.onPressed,
    this.width,
    required this.isActiv,
  });
  final String imageGend;
  final String titleGend;
  final Function() onPressed;
  final double? width;
  final bool isActiv;

  @override
  Widget build(BuildContext context) {
    return WbMotion(
      onPressed: onPressed,
      child: Container(
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: isActiv ? WbColors.blue009AFF : WbColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Row(
            children: [
              Image.asset(
                imageGend,
                width: width ?? 23.w,
                color: isActiv ? Colors.white : Colors.black,
              ),
              SizedBox(width: 10.w),
              Text(
                titleGend,
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: isActiv ? Colors.white : Colors.black,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TraningItemWidget extends StatelessWidget {
  const TraningItemWidget({
    super.key,
    this.imageTranin,
    required this.titileTranin,
    this.titleNull,
    required this.isActivTranin,
    this.isIcon = false,
    required this.onPressed,
  });
  final String? imageTranin;
  final String titileTranin;
  final String? titleNull;
  final bool isActivTranin;
  final bool isIcon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return WbMotion(
      onPressed: onPressed,
      child: Container(
        width: 156.w,
        decoration: BoxDecoration(
          color: isActivTranin ? WbColors.blue009AFF : Colors.white,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              isIcon
                  ? Text(
                      titleNull!,
                      style: TextStyle(
                        fontSize: 64.h,
                        fontWeight: FontWeight.w800,
                        color: isActivTranin ? Colors.white : Colors.black,
                        height: 0,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Image.asset(
                      imageTranin!,
                      width: 78.w,
                      color: isActivTranin ? Colors.white : Colors.black,
                    ),
              isIcon ? const SizedBox() : SizedBox(height: 10.h),
              Text(
                titileTranin,
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  color: isActivTranin ? Colors.white : Colors.black,
                  height: 0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

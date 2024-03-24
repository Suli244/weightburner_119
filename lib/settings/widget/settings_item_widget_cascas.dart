// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class SetItWid extends StatelessWidget {
  const SetItWid({
    super.key,
    required this.text,
    required this.imageSetti,
    required this.onPressed,
    this.isPaddin = false,
    this.isSvgAndPng = false,
    this.iconHeg,
  });
  final String text;
  final String imageSetti;
  final Function()? onPressed;
  final bool isPaddin;
  final bool isSvgAndPng;
  final double? iconHeg;

  @override
  Widget build(BuildContext context) {
    return WbMotion(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(top: isPaddin ? 9.h : 0),
        child: Container(
          decoration: const BoxDecoration(
            color: WbColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 10.w,
            ),
            child: Row(
              children: [
                isSvgAndPng
                    ? Image.asset(
                        imageSetti,
                        height: iconHeg ?? 26.h,
                      )
                    : SvgPicture.asset(
                        imageSetti,
                        height: iconHeg ?? 26.h,
                      ),
                SizedBox(width: 10.w),
                Text(
                  text,
                  style: TextStyle(
                    color: WbColors.blue04213E,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: WbColors.blue04213E,
                  size: 28.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

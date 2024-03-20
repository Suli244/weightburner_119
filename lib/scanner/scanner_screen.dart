import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Scanner',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}

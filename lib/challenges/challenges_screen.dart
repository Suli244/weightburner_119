import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/challenges/widget/two_cat_widget.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Challenges',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            TwoCatWidg()
          ],
        ),
      ),
    );
  }
}


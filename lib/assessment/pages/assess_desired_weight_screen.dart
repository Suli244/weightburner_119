// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weightburner_119/assessment/pages/assess_train_screen.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/src/vertical_weight_slider.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/src/weight_slider_controller.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessDesiredWeightScreen extends StatefulWidget {
  const AssessDesiredWeightScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
  });
  final String name;
  final String imageAvatar;
  final String gender;
  final String age;
  final String weight;
  final String height;

  @override
  State<AssessDesiredWeightScreen> createState() =>
      _AssessDesiredWeightScreenState();
}

class _AssessDesiredWeightScreenState extends State<AssessDesiredWeightScreen> {
  late WeightSliderController _controllerDesiredWeigh;

  double _weightDesiredWeigh = 68;

  @override
  void initState() {
    super.initState();
    _controllerDesiredWeigh = WeightSliderController(
        initialWeight: _weightDesiredWeigh, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controllerDesiredWeigh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WbColors.blue04213E,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: WbMotion(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 24.w,
              color: WbColors.white,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Assessment',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.white,
              height: 0,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 29, 55),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 96.h),
            Text(
              'Enter your desired weight',
              style: TextStyle(
                fontSize: 24.h,
                fontWeight: FontWeight.w600,
                color: WbColors.white,
                height: 0,
              ),
            ),
            SizedBox(height: 139.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _weightDesiredWeigh.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 48.h,
                    fontWeight: FontWeight.w600,
                    color: WbColors.white,
                    height: 0,
                  ),
                ),
                Text(
                  'kg',
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w600,
                    color: WbColors.white.withOpacity(0.60),
                    height: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            VerticalWeightSlider(
              height: 100,
              isVertical: false,
              controller: _controllerDesiredWeigh,
              onChanged: (double value) {
                setState(() {
                  _weightDesiredWeigh = value;
                });
              },
              indicator: Container(
                height: 11.h,
                width: 82.w,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: WbColors.blue009AFF,
                  borderRadius: BorderRadius.circular(12).r,
                ),
              ),
            ),
            SizedBox(height: 139.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: WbMotion(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssessTrainScreen(
                        name: widget.name,
                        imageAvatar: widget.imageAvatar,
                        gender: widget.gender,
                        age: widget.age,
                        weight: widget.weight,
                        height: widget.height,
                        desiredWeight: _weightDesiredWeigh.toInt().toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32).r,
                    color: WbColors.blue009AFF,
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

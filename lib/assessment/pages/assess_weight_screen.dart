import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/pages/assess_height_screen.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/src/vertical_weight_slider.dart';
import 'package:weightburner_119/assessment/vertical_weight_slider/src/weight_slider_controller.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessWeightScreen extends StatefulWidget {
  const AssessWeightScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
    required this.gender,
    required this.age,
  });
  final String name;
  final String imageAvatar;
  final String gender;
  final String age;

  @override
  State<AssessWeightScreen> createState() => _AssessWeightScreenState();
}

class _AssessWeightScreenState extends State<AssessWeightScreen> {
  late WeightSliderController _controllerWeight;

  double _weight = 73;

  @override
  void initState() {
    super.initState();
    _controllerWeight = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controllerWeight.dispose();
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
              'Enter your weight',
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
                  _weight.toStringAsFixed(0),
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
              controller: _controllerWeight,
              onChanged: (double value) {
                setState(() {
                  _weight = value;
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
                      builder: (context) => AssessHeightScreen(
                        name: widget.name,
                        imageAvatar: widget.imageAvatar,
                        gender: widget.gender,
                        age: widget.age,
                        weight: _weight.toInt().toString(),
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

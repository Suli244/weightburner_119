// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weightburner_119/assessment/pages/assess_time_screen.dart';
import 'package:weightburner_119/assessment/widgets/gender_item_widget.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessTrainScreen extends StatefulWidget {
  const AssessTrainScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.desiredWeight,
  });
  final String name;
  final String imageAvatar;
  final String gender;
  final String age;
  final String weight;
  final String height;
  final String desiredWeight;
  @override
  State<AssessTrainScreen> createState() => _AssessTrainScreenState();
}

class _AssessTrainScreenState extends State<AssessTrainScreen> {
  int indColTrenin = 0;
  String treninSave = '';

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
        backgroundColor: WbColors.blue04213E,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 96.h),
              FittedBox(
                child: Text(
                  'How would you like to train?',
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w600,
                    color: WbColors.white,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TraningItemWidget(
                    imageTranin: 'assets/icons/home_icon.png',
                    titileTranin: 'Home \nworkouts only',
                    isActivTranin: indColTrenin == 1,
                    onPressed: () {
                      indColTrenin = 1;
                      treninSave = 'Home';
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 15.w),
                  TraningItemWidget(
                    imageTranin: 'assets/icons/gym.png',
                    titileTranin: 'With workouts \nfor gym',
                    isActivTranin: indColTrenin == 2,
                    onPressed: () {
                      indColTrenin = 2;
                      treninSave = 'Gym';
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 190.h),
              indColTrenin != 0
                  ? WbMotion(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssessTimeScreen(
                              name: widget.name,
                              imageAvatar: widget.imageAvatar,
                              gender: widget.gender,
                              age: widget.age,
                              weight: widget.weight,
                              height: widget.height,
                              desiredWeight: widget.desiredWeight,
                              train: treninSave,
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
                    )
                  : Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32).r,
                        color: WbColors.blue009AFF.withOpacity(0.6),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.6),
                            height: 0,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

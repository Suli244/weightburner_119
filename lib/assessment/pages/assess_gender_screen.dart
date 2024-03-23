import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/pages/assess_age_screen.dart';
import 'package:weightburner_119/assessment/widgets/gender_item_widget.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessGenderScreen extends StatefulWidget {
  const AssessGenderScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
  });
  final String name;
  final String imageAvatar;

  @override
  State<AssessGenderScreen> createState() => _AssessGenderScreenState();
}

class _AssessGenderScreenState extends State<AssessGenderScreen> {
  int indColGend = 0;
  String gendSave = '';

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
              Text(
                'Select gender',
                style: TextStyle(
                  fontSize: 24.h,
                  fontWeight: FontWeight.w600,
                  color: WbColors.white,
                  height: 0,
                ),
              ),
              SizedBox(height: 48.h),
              GengerItemWidget(
                imageGend: 'assets/icons/male_icon.png',
                titleGend: 'Male',
                onPressed: () {
                  indColGend = 1;
                  gendSave = 'Male';
                  setState(() {});
                },
                width: 22.w,
                isActiv: indColGend == 1,
              ),
              SizedBox(height: 16.h),
              GengerItemWidget(
                imageGend: 'assets/icons/female_icon.png',
                titleGend: 'Female',
                onPressed: () {
                  indColGend = 2;
                  gendSave = 'Female';
                  setState(() {});
                },
                width: 24.w,
                isActiv: indColGend == 2,
              ),
              SizedBox(height: 16.h),
              GengerItemWidget(
                imageGend: 'assets/icons/other_icon.png',
                titleGend: 'Other',
                onPressed: () {
                  indColGend = 3;
                  gendSave = 'Other';
                  setState(() {});
                },
                width: 22.w,
                isActiv: indColGend == 3,
              ),
              SizedBox(height: 205.h),
              indColGend != 0
                  ? WbMotion(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssessAgeScreen(
                              name: widget.name,
                              imageAvatar: widget.imageAvatar,
                              gender: gendSave,
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

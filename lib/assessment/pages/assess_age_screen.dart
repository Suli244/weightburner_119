// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weightburner_119/assessment/pages/assess_weight_screen.dart';
import 'package:weightburner_119/assessment/widgets/app_unfocuser.dart';
import 'package:weightburner_119/assessment/widgets/custom_text_fields.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessAgeScreen extends StatefulWidget {
  const AssessAgeScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
    required this.gender,
  });
  final String name;
  final String imageAvatar;
  final String gender;

  @override
  State<AssessAgeScreen> createState() => _AssessAgeScreenState();
}

class _AssessAgeScreenState extends State<AssessAgeScreen> {
  TextEditingController controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 96.h),
                Center(
                  child: Text(
                    'Enter your age',
                    style: TextStyle(
                      fontSize: 24.h,
                      fontWeight: FontWeight.w600,
                      color: WbColors.white,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 116.h),
                CustomTextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  maxLength: 8,
                  counterText: '',
                  controller: controllerAge,
                  keyboardType: TextInputType.number,
                  isFillColor: true,
                  fillColor: WbColors.white,
                  hintText: 'Enter',
                  hintStyle: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.black.withOpacity(0.40),
                    height: 0,
                  ),
                  textStyleSerch: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.black.withOpacity(0.40),
                    height: 0,
                  ),
                ),
                SizedBox(height: 269.h),
                controllerAge.text != ''
                    ? WbMotion(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AssessWeightScreen(
                                name: widget.name,
                                imageAvatar: widget.imageAvatar,
                                gender: widget.gender,
                                age: controllerAge.text,
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
      ),
    );
  }
}

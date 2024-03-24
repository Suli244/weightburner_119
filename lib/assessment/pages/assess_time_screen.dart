import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data_box.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessTimeScreen extends StatefulWidget {
  const AssessTimeScreen({
    super.key,
    required this.name,
    required this.imageAvatar,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.desiredWeight,
    required this.train,
  });
  final String name;
  final String imageAvatar;
  final String gender;
  final String age;
  final String weight;
  final String height;
  final String desiredWeight;
  final String train;

  @override
  State<AssessTimeScreen> createState() => _AssessTimeScreenState();
}

class _AssessTimeScreenState extends State<AssessTimeScreen> {
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
                  'Approximate time to your \ndesired weight',
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w600,
                    color: WbColors.white,
                    height: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 45.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 156.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '21',
                            style: TextStyle(
                              fontSize: 64.h,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Days',
                            style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    width: 156.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '12',
                            style: TextStyle(
                              fontSize: 64.h,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Workouts',
                            style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              WbMotion(
                onPressed: () async {
                  await hiveDataProfile.put(
                    'profile',
                    HiveData(
                      name: widget.name,
                      imageAvatar: widget.imageAvatar,
                      gender: widget.gender,
                      age: widget.age,
                      weight: widget.weight,
                      height: widget.height,
                      desiredWeight: widget.desiredWeight,
                      train: widget.train,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WbBottomBar(),
                    ),
                    (protected) => false,
                  );
                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32).r,
                    color: WbColors.blue009AFF,
                  ),
                  child: Center(
                    child: Text(
                      'Start!',
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
              SizedBox(height: 85.h),
            ],
          ),
        ),
      ),
    );
  }
}

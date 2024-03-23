import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/workouts/workuot_start.dart';
import 'package:weightburner_119/workouts/workout_cont.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.model});
  final WorkoutsCont model;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  String level = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WbColors.blue04213E,
      appBar: AppBar(
        backgroundColor: WbColors.blue04213E,
        scrolledUnderElevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Workout',
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: WbColors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return WorkWidget(
                    model: widget.model.ponsmvasa[index],
                  );
                },
                separatorBuilder: (_, i) => SizedBox(height: 16.h),
                itemCount: widget.model.ponsmvasa.length,
              ),
              SizedBox(height: 24.h),
              Text(
                'Difficulty level',
                style: TextStyle(
                  fontSize: 18.h,
                  fontWeight: FontWeight.w600,
                  color: WbColors.white,
                ),
              ),
              SizedBox(height: 12.h),
              WbMotion(
                onPressed: () {
                  setState(() {
                    level = 'Beginner';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.black,
                        ),
                      ),
                      level == 'Beginner'
                          ? const Icon(
                              Icons.check_circle,
                              color: WbColors.blue009AFF,
                            )
                          : const Icon(Icons.circle_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              WbMotion(
                onPressed: () {
                  setState(() {
                    level = 'Medium';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Medium',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.black,
                        ),
                      ),
                      level == 'Medium'
                          ? const Icon(
                              Icons.check_circle,
                              color: WbColors.blue009AFF,
                            )
                          : const Icon(Icons.circle_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              WbMotion(
                onPressed: () {
                  setState(() {
                    level = 'Advanced';
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Advanced',
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.black,
                        ),
                      ),
                      level == 'Advanced'
                          ? const Icon(
                              Icons.check_circle,
                              color: WbColors.blue009AFF,
                            )
                          : const Icon(Icons.circle_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              WbMotion(
                onPressed: () {
                  if (level.isNotEmpty) {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutStart(
                          model: widget.model,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 52.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: level.isNotEmpty
                        ? WbColors.blue009AFF
                        : WbColors.blue009AFF.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        color: WbColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      )),
    );
  }
}

class WorkWidget extends StatelessWidget {
  const WorkWidget({
    super.key,
    required this.model,
  });

  final Ponsmvasa model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff003D79),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logoWork.png',
            width: 64.w,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: WbColors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                    size: 18.h,
                  ),
                  Text(
                    '${model.min} min',
                    style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.r),
                    child: Text(
                      '|',
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '${model.kcal} kcal',
                    style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

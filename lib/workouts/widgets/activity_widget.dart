import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

enum Day { M, T, W, Th, F, S, Sn }

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({
    super.key,
  });

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  Map<Day, bool> completedDays = {}; // Map to store completed days

  @override
  void initState() {
    super.initState();
    _loadCompletedDays();
  }

  Future<void> _loadCompletedDays() async {
    final prefs = await SharedPreferences.getInstance();
    for (final day in Day.values) {
      completedDays[day] = prefs.getBool(day.name) ?? false;
    }
  }

  Future<void> _markDayCompleted(Day day) async {
    setState(() {
      completedDays[day] = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(day.name, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.r),
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity calendar',
            style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
          SizedBox(height: 8.h),
          //////////Calendar//////////////
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Day.values.map((day) {
                final isCompleted = completedDays[day] ?? false;
                return CalendarDay(
                  day: day,
                  isCompleted: isCompleted,
                  onMarkCompleted: () => _markDayCompleted(day),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: WbColors.blue009AFF,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/kcalIcon.png', width: 24),
                SizedBox(width: 8.w),
                Text(
                  'Calories',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.white,
                  ),
                ),
                const Spacer(),
                FutureBuilder(
                  future: getCalories(),
                  builder: (context, snapshot) {
                    int getCalories = snapshot.data ?? 0;
                    return Text(
                      '$getCalories',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700,
                        color: WbColors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.r),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: WbColors.blue009AFF,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/stepsIcon.png', width: 24),
                SizedBox(width: 8.w),
                Text(
                  'Steps',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '${getRandomSteps()}',
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w700,
                    color: WbColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int getRandomSteps() {
  return Random().nextInt(2500 - 200) + 200;
}

class CalendarDay extends StatelessWidget {
  final Day day;
  final bool isCompleted;
  final VoidCallback onMarkCompleted;

  const CalendarDay({
    super.key,
    required this.day,
    required this.isCompleted,
    required this.onMarkCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final dayString = day.toString().substring(4);
    return WbMotion(
      onPressed: onMarkCompleted,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.r),
        width: 40.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: WbColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isCompleted
                ? const Icon(
                    Icons.check_circle,
                    color: WbColors.blue009AFF,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: WbColors.black.withOpacity(0.6),
                  ),
            SizedBox(height: 4.h),
            Text(
              dayString[0].toUpperCase() + dayString.substring(1),
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w500,
                color: WbColors.black.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int> getCalories() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Calories') ?? 0;
}

Future<void> setCalories(int calories) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Calories', calories);
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({
    super.key,
  });

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  int dayCal = 0;
  @override
  void initState() {
    super.initState();
    _loadCompletedDays();
  }

  Future<void> _loadCompletedDays() async {
    int day = await getDay();
    setState(() {
      dayCal = day;
    });
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
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: Day.values.map((day) {
          //       final isCompleted = completedDays[day] ?? false;
          //       return CalendarDay(
          //         day: day,
          //         isCompleted: isCompleted,
          //         onMarkCompleted: () => _markDayCompleted(day),
          //       );
          //     }).toList(),
          //   ),
          // ),
          SingleChildScrollView(
            child: SizedBox(
              height: 62.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, innerIndex) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                    decoration: BoxDecoration(
                        color: dayCal == innerIndex
                            ? WbColors.blue009AFF
                            : dayCal > innerIndex
                                ? Colors.transparent
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: dayCal == innerIndex
                                ? Colors.transparent
                                : dayCal > innerIndex
                                    ? WbColors.blue009AFF
                                    : Colors.transparent,
                            border: Border.all(
                              width: 2,
                              color: dayCal == innerIndex
                                  ? WbColors.white
                                  : dayCal > innerIndex
                                      ? WbColors.blue009AFF
                                      : WbColors.black.withOpacity(0.6),
                            ),
                          ),
                          child: dayCal > innerIndex
                              ? Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 20.r,
                                    color: WbColors.white,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          listDays[innerIndex],
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                            color: dayCal == innerIndex
                                ? WbColors.whitEEEAEA
                                : dayCal > innerIndex
                                    ? WbColors.black.withOpacity(0.6)
                                    : WbColors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, innerIndex) => SizedBox(width: 16.w),
                itemCount: listDays.length,
              ),
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

List<String> listDays = [
  'Sn',
  'M',
  'T',
  'W',
  'Th',
  'F',
  'S',
];
int getRandomSteps() {
  return Random().nextInt(2500 - 200) + 200;
}

Future<int> getCalories() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Calories') ?? 0;
}

Future<void> setCalories(int calories) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Calories', calories);
}

Future<int> getDay() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Day') ?? 0;
}

Future<void> setDay(int days) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Day', days);
}

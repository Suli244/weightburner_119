import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/challenges/content/content.dart';
import 'package:weightburner_119/challenges/widget/two_cat_widget.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  int chaleVyb = 0;
  List<ChallengesContent> sport =
      listChallengesContent.where((e) => e.sp == false).toList();
  List<ChallengesContent> health =
      listChallengesContent.where((e) => e.sp == true).toList();
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
            const TwoCatWidg(),
            SizedBox(height: 24.h),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: WbMotion(
                      onPressed: () {
                        setState(() {
                          chaleVyb = 0;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: chaleVyb == 0
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sport',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: chaleVyb == 0
                                    ? Colors.white
                                    : WbColors.blue04213E),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: WbMotion(
                      onPressed: () {
                        setState(() {
                          chaleVyb = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: chaleVyb == 1
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Health',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: chaleVyb == 1
                                    ? Colors.white
                                    : WbColors.blue04213E),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            chaleVyb == 0
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12.r),
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    sport[index].title,
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w500,
                                      color: WbColors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25.w),
                                Image.asset(sport[index].image, width: 40.w)
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    sport[index].status,
                                    style: TextStyle(
                                      fontSize: 12.h,
                                      fontWeight: FontWeight.w500,
                                      color: WbColors.blue009AFF,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25.w),
                                Text(
                                  '${sport[index].daysLeft}/${sport[index].daysPassed}',
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: WbColors.blue009AFF,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => SizedBox(height: 16.h),
                    itemCount: sport.length)
                : Container()
          ],
        ),
      ),
    );
  }
}

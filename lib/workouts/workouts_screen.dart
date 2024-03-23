import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/premium/premium_screen.dart';
import 'package:weightburner_119/settings/weightburner_prevkdv.dart';
import 'package:weightburner_119/workouts/widgets/activity_widget.dart';
import 'package:weightburner_119/workouts/workout_cont.dart';
import 'package:weightburner_119/workouts/workout_page.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  String page = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Workouts',
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
        child: Column(
          children: [
            SizedBox(height: 12.h),
            const ActivityWidget(),
            SizedBox(height: 12.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.r),
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
                          page = 'Home';
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: page == 'Home'
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: page == 'Home'
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
                          page = 'Gym';
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: page == 'Gym'
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Gym',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: page == 'Gym'
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
            SizedBox(height: 24.h),
            page == 'Home'
                ? FutureBuilder(
                    future: getWeightburnerPinjcdv(),
                    builder: (context, snapshot) {
                      bool chek = snapshot.data ?? false;
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return WorkWidget(
                            model: listHome[index],
                            chekPP: index > 1 && !chek,
                          );
                        },
                        separatorBuilder: (_, i) => SizedBox(height: 16.h),
                        itemCount: listHome.length,
                      );
                    })
                : FutureBuilder(
                    future: getWeightburnerPinjcdv(),
                    builder: (context, snapshot) {
                      bool chek = snapshot.data ?? false;
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return WorkWidget(
                            model: listGym[index],
                            chekPP: index > 1 && !chek,
                          );
                        },
                        separatorBuilder: (_, i) => SizedBox(height: 16.h),
                        itemCount: listGym.length,
                      );
                    }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class WorkWidget extends StatelessWidget {
  const WorkWidget({
    super.key,
    required this.model,
    required this.chekPP,
  });
  final WorkoutsCont model;
  final bool chekPP;
  @override
  Widget build(BuildContext context) {
    return chekPP
        ? Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumScreen(isClose: true),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.r),
                  alignment: AlignmentDirectional.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(model.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    height: 80.h,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/bgCont.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 110.w,
                          child: Text(
                            model.title,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        const Spacer(),
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
                          '${model.podr.length} exercises',
                          style: TextStyle(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 12,
                  right: 36,
                  child: Image.asset('assets/images/proPrem.png',
                      width: 48, height: 24))
            ],
          )
        : InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutPage(
                    model: model,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.r),
              alignment: AlignmentDirectional.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: 180.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                height: 80.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bgCont.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 110.w,
                      child: Text(
                        model.title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
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
                      '${model.podr.length} exercises',
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

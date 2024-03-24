import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/workouts/widgets/activity_widget.dart';
import 'package:weightburner_119/workouts/workout_cont.dart';

class WorkoutStart extends StatefulWidget {
  const WorkoutStart({
    super.key,
    required this.model,
  });
  final WorkoutsCont model;
  @override
  State<WorkoutStart> createState() => _WorkoutStartState();
}

class _WorkoutStartState extends State<WorkoutStart> {
  final PageController controller = PageController();
  int currantPage = 0;

  Timer timerStart = Timer(Duration.zero, () {});
  late final oneSecStart = const Duration(seconds: 1);
  bool isChekStart = false;

  bool _isRunning = false;
  late int totalSecondsMain;

  int exercises = 0;
  int calories = 0;
  int dayCal = 0;
  bool hasSavedToday = false;
  Future<void> _loadCompletedDays() async {
    int day = await getDay();
    setState(() {
      dayCal = day;
      hasSavedToday = dayCal == DateTime.now().day;
    });
  }

  @override
  void initState() {
    super.initState();
    sssavihb();
    _loadCompletedDays();
    startTimerStart();
    totalSecondsMain = widget.model.ponsmvasa[currantPage].min * 60;
    controller.addListener(() {
      if (controller.page?.round() != currantPage) {
        handlePageChange(controller.page!.round());
      }
    });
  }

  @override
  void dispose() {
    timerMain.cancel();
    controller.dispose();
    super.dispose();
  }

  Future<void> sssavihb() async {
    int caloriesgetCalories = await getCalories();
    setState(() {
      calories = caloriesgetCalories;
    });
  }

  int secondsStart = 0;
  Future<void> startTimerStart() async {
    secondsStart = 1;
    timerStart = Timer.periodic(
      oneSecStart,
      (Timer timer) {
        if (mounted) {
          setState(() {
            secondsStart--;
            if (secondsStart == 0) {
              timer.cancel();
              setState(() {
                isChekStart = true;
              });
              if (!_isRunning) {
                if (mounted) {
                  startTimerMain();
                  setState(() {
                    _isRunning = !_isRunning;
                  });
                }
              }
            }
          });
        }
      },
    );
  }

  String minutesConvert(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return clockTimer.inSeconds.remainder(60).toString().padLeft(
          2,
        );
  }

  Timer timerMain = Timer(Duration.zero, () {});
  late final oneSecMain = const Duration(seconds: 1);
  late int secondMain = totalSecondsMain;
  double progress = 0;

  Future<void> startTimerMain() async {
    if (!_isRunning) {
      secondMain = totalSecondsMain;

      _isRunning = true;

      timerMain = Timer.periodic(
        oneSecMain,
        (Timer timer) {
          if (mounted) {
            setState(() {
              secondMain--;
              progress = (totalSecondsMain - secondMain) / totalSecondsMain;
              if (secondMain <= 0) {
                timer.cancel();
                _isRunning = false;
                isActive = true;
                if (currantPage < widget.model.ponsmvasa.length - 1) {
                  // controller.nextPage(
                  //     duration: const Duration(milliseconds: 300),
                  //     curve: Curves.easeIn);
                } else {}
              }
            });
          }
        },
      );
    }
  }

  String minutesConvertMain(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  void handleFinish() async {
    if (!hasSavedToday) {
      dayCal = dayCal + 1;
      await setDay(dayCal);
      hasSavedToday = true; // Update flag to prevent further saves

      setState(() {}); // Refresh UI to reflect save status

      // ... (other code for navigation and calorie update)
    } else {
      // Handle the case where saving has already occurred today
      // (e.g., display a message to the user)
    }
  }

  void handlePageChange(int newPageIndex) {
    if (timerMain.isActive) {
      timerMain.cancel();
    }

    setState(() {
      currantPage = newPageIndex;
      totalSecondsMain = widget.model.ponsmvasa[currantPage].min * 60;
      secondMain = totalSecondsMain;
      progress = 0;
      _isRunning = false;
    });

    startTimerMain();
  }

  bool isActive = false;
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
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Image.asset(widget.model.image),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    currantPage == widget.model.ponsmvasa.length - 1
                        ? ''
                        : 'Rest 30 seconds',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w600,
                      color: WbColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff003D79),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 3.0,
                          percent: progress,
                          center: Text(
                            minutesConvertMain(secondMain),
                            style: TextStyle(
                              color: WbColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 30.h,
                            ),
                          ),
                          progressColor: WbColors.blue009AFF,
                          backgroundColor: const Color(0xff003D79),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Expanded(
                        child: PageView(
                          onPageChanged: (value) {
                            setState(() {
                              handlePageChange(value);
                            });
                          },
                          controller: controller,
                          children:
                              List.generate(widget.model.ponsmvasa.length, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.model.ponsmvasa[currantPage].title,
                                    style: TextStyle(
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w400,
                                      color: WbColors.white,
                                    ),
                                  ),
                                  Text(
                                    widget.model.ponsmvasa[currantPage].dis,
                                    style: TextStyle(
                                      color: WbColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.h,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      WbMotion(
                        onPressed: () async {
                          if (isActive) {
                            if (currantPage == widget.model.ponsmvasa.length - 1) {
                              dayCal = dayCal + 1;
                              await setDay(dayCal);
                              timerMain.cancel();
                              Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const WbBottomBar(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(-1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);
                                    return SlideTransition(
                                        position: offsetAnimation,
                                        child: child);
                                  },
                                ),
                                (route) => false,
                              );
                              calories = calories +
                                  widget.model.ponsmvasa[currantPage].kcal;
                              await setCalories(calories);
                            } else {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          }
                          // }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: isActive
                                ? WbColors.blue009AFF
                                : WbColors.blue009AFF.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Text(
                              currantPage == widget.model.ponsmvasa.length - 1
                                  ? 'Finish'
                                  : 'Next',
                              style: TextStyle(
                                color: WbColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

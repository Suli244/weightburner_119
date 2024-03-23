import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class TwoCatWidg extends StatefulWidget {
  const TwoCatWidg({
    super.key,
  });

  @override
  State<TwoCatWidg> createState() => _TwoCatWidgState();
}

class _TwoCatWidgState extends State<TwoCatWidg> {
  int currentIntake = 0;
  final int totalIntake = 8;
  double angle = 0;

  int currentWeightPerv = 0;
  int currentWeightPosled = 0;

  @override
  void initState() {
    ascnjas();

    super.initState();
  }

  Future<void> ascnjas() async {
    int currentIntakeawait = await getWaterConsumption();
    int currentWeightPervawaitawait = await getWeightPerv();
    int currentWeightPosledawait = await getWeightPosled();
    setState(() {
      currentIntake = currentIntakeawait;
      currentWeightPerv = currentWeightPervawaitawait;
      currentWeightPosled = currentWeightPosledawait;
      angle = (currentIntake / totalIntake) * 2 * 3.14159;
    });
  }

  Future<void> incrementIntake() async {
    if (currentIntake < totalIntake) {
      setState(() {
        currentIntake++;
        angle = (currentIntake / totalIntake) * 2 * 3.14159;
      });
      await setWaterConsumption(currentIntake);
      ascnjas();
    }
  }

  Future<void> decrementIntake() async {
    if (currentIntake > 0) {
      setState(() {
        currentIntake--;
        angle = (currentIntake / totalIntake) * 2 * 3.14159;
      });
      await setWaterConsumption(currentIntake);
      ascnjas();
    }
  }

//----
  Future<void> incrementWeight() async {
    setState(() {
      currentWeightPosled++;
    });
    await setWeightPosled(currentWeightPosled);
    ascnjas();
  }

  Future<void> decrementWeight() async {
    if (currentWeightPosled > 0) {
      setState(() {
        currentWeightPosled--;
      });
      await setWeightPosled(currentWeightPosled);
      ascnjas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Water consumption',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.black,
                  ),
                ),
                SizedBox(height: 14.h),
                Center(
                  child: CustomPaint(
                    painter: CircleProgress(angle),
                    child: Container(
                      padding: EdgeInsets.all(16.r),
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/kaplya.png',
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WbMotion(
                      onPressed: () {
                        decrementIntake();
                      },
                      child: Image.asset(
                        'assets/images/min1.png',
                        width: 40.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      '$currentIntake/$totalIntake',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700,
                        color: WbColors.black,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    WbMotion(
                      onPressed: () {
                        incrementIntake();
                      },
                      child: Image.asset(
                        'assets/images/plu1.png',
                        width: 40.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 23.w),
        Expanded(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weight loss',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                    color: WbColors.black,
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${currentWeightPerv}kg',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: WbColors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '(Previous)',
                          style: TextStyle(
                            fontSize: 8.h,
                            fontWeight: FontWeight.w500,
                            color: WbColors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/weight_loss.png',
                      width: 35.w,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        Text(
                          '${currentWeightPosled}kg',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: WbColors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '(Current)',
                          style: TextStyle(
                            fontSize: 8.h,
                            fontWeight: FontWeight.w500,
                            color: WbColors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WbMotion(
                      onPressed: () {
                        decrementWeight();
                      },
                      child: Image.asset(
                        'assets/images/min1.png',
                        width: 40.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    currentWeightPerv == 0
                        ? WbMotion(
                            onPressed: () async {
                              await setWeightPerv(currentWeightPosled);
                              ascnjas();
                            },
                            child: Icon(Icons.save_alt, size: 20.h))
                        : const SizedBox(),
                    SizedBox(width: 7.w),
                    WbMotion(
                      onPressed: () {
                        incrementWeight();
                      },
                      child: Image.asset(
                        'assets/images/plu1.png',
                        width: 40.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CircleProgress extends CustomPainter {
  double angle;
  CircleProgress(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
    paint..color = WbColors.blue009AFF;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Future<int> getWaterConsumption() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('WaterConsumption') ?? 0;
}

Future<void> setWaterConsumption(int waterCons) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('WaterConsumption', waterCons);
}

Future<int> getWeightPerv() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('WeightPerv') ?? 0;
}

Future<void> setWeightPerv(int weightPerv) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('WeightPerv', weightPerv);
}

Future<int> getWeightPosled() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('WeightPosled') ?? 0;
}

Future<void> setWeightPosled(int weightPosled) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('WeightPosled', weightPosled);
}

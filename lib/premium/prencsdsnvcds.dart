import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/pages/assess_name_screen.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/onbording/widget/rest_wid.dart';
import 'package:weightburner_119/settings/weightburner_prevkdv.dart';

class Ljbvasdsdvsd extends StatefulWidget {
  const Ljbvasdsdvsd({super.key, this.isClose = false});
  final bool isClose;
  @override
  State<Ljbvasdsdvsd> createState() => _LjbvasdsdvsdState();
}

class _LjbvasdsdvsdState extends State<Ljbvasdsdvsd> {
  bool majsnss = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/premium.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  const Spacer(),
                  WbMotion(
                    onPressed: () {
                      if (widget.isClose) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AssessNameScreen(),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/images/close_premium.png',
                      width: 32.w,
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 42.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Text(
                    'Premium',
                    style: TextStyle(
                      fontSize: 28.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    'Get access to all workouts',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    'Get access to all challenges',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    'No Ads',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  WbMotion(
                    onPressed: () async {
                      setState(() {
                        majsnss = true;
                      });
                      final apphudPaywalls = await Apphud.paywalls();
                      // print(apphudPaywalls?.paywalls.first.products?.first);
                      await Apphud.purchase(
                        product: apphudPaywalls?.paywalls.first.products?.first,
                      ).whenComplete(
                        () async {
                          if (await Apphud.hasPremiumAccess() ||
                              await Apphud.hasActiveSubscription()) {
                            await setWeightburnerPinjcdv();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WbBottomBar(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      );
                      setState(() {
                        majsnss = false;
                      });
                    },
                    child: Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32).r,
                        color: WbColors.blue009AFF,
                      ),
                      child: Center(
                        child: majsnss
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Buy Premium for \$0,99',
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
                  SizedBox(height: 25.h),
                  RestBut(
                    onPressTerOfSer: () {},
                    onPressRest: () {
                      restoreWeightburnerPinjcdv(context);
                    },
                    onPressPriPol: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

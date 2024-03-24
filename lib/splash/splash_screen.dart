import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weightburner_119/core/constcgubca_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/onbording/onbording_clnjsdsdv.dart';

class SplashScreenYTvabcas extends StatefulWidget {
  const SplashScreenYTvabcas({super.key});

  @override
  State<SplashScreenYTvabcas> createState() => _SplashScreenYTvabcasState();
}

class _SplashScreenYTvabcasState extends State<SplashScreenYTvabcas> {
  @override
  void initState() {
    firstOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WbColors.blue04213E,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 150.w,
              height: 103.h,
            ),
          ),
        ],
      ),
    );
  }

  firstOpen() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    SharedPreferences.getInstance().then(
      (prefs) async {
        if (!prefs.containsKey('workouttartsadasdas')) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnbordingLajbcascas(),
            ),
          );
          prefs.setDouble('workouttartsadasdas', 83471658);
          await Future.delayed(const Duration(seconds: 4));
          try {
            final InAppReview inAppReview = InAppReview.instance;

            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          } catch (e) {
            throw Exception(e);
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WbBottomBar(
                indexScr: 0,
              ),
            ),
          );
        }
      },
    );
  }
}

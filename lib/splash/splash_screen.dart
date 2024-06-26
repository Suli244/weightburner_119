import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/burner/ochen_vazhnaya_funcia.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class SplashScreenYTvabcas extends StatefulWidget {
  const SplashScreenYTvabcas({super.key});

  @override
  State<SplashScreenYTvabcas> createState() => _SplashScreenYTvabcasState();
}

class _SplashScreenYTvabcasState extends State<SplashScreenYTvabcas> {
  @override
  void initState() {
    ochenvazhnayafuncia(context, (val) {});
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
}

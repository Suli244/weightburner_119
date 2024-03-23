import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/con_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/onbording/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WbBottomBar(),
      ),
    );
  }
}

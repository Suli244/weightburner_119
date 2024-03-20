import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeightBurner',
        home: child,
        theme: ThemeData(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: WbColors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: WbColors.white,
          ),
        ),
      ),
      child: const SplashScreen(),
    );
  }
}

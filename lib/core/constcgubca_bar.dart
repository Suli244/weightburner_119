import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weightburner_119/challenges/challenges_screen.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/scanner/scanner_screen.dart';
import 'package:weightburner_119/settings/settings_screen.dart';
import 'package:weightburner_119/workouts/workouts_screen.dart';

class WbBottomBarState extends State<WbBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: isActive,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 20.r,
          bottom: 45.r,
        ),
        decoration: BoxDecoration(
          color: WbColors.blue04213E,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16).r,
            topRight: const Radius.circular(16).r,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WbMotion(
              onPressed: () => setState(() => isActive = 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/workouts.svg',
                    color: isActive == 0 ? null : WbColors.white9ba6b2,
                    width: 25.w,
                  ),
                  SizedBox(height: 7.h),
                  Container(
                    width: 22.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: isActive == 0
                          ? WbColors.blue009AFF
                          : WbColors.blue04213E,
                    ),
                  ),
                ],
              ),
            ),
            WbMotion(
              onPressed: () => setState(() => isActive = 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/scanner.svg',
                    color: isActive == 1 ? null : WbColors.white9ba6b2,
                    width: 25.w,
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 22.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: isActive == 1
                          ? WbColors.blue009AFF
                          : WbColors.blue04213E,
                    ),
                  ),
                ],
              ),
            ),
            WbMotion(
              onPressed: () => setState(() => isActive = 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/challenges.svg',
                    color: isActive == 2 ? null : WbColors.white9ba6b2,
                    width: 25.w,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 22.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: isActive == 2
                          ? WbColors.blue009AFF
                          : WbColors.blue04213E,
                    ),
                  ),
                ],
              ),
            ),
            WbMotion(
              onPressed: () => setState(() => isActive = 3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/settings.svg',
                    color: isActive == 3 ? null : WbColors.white9ba6b2,
                    width: 25.w,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 22.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: isActive == 3
                          ? WbColors.blue009AFF
                          : WbColors.blue04213E,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const WorkoutsScreen(),
    const ScannerScreen(),
    const ChallengesScreen(),
    const SettingsScreen(),
  ];
}

class WbBottomBar extends StatefulWidget {
  const WbBottomBar({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<WbBottomBar> createState() => WbBottomBarState();
}

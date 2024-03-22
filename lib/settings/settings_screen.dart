import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/premium/premium_screen.dart';
import 'package:weightburner_119/settings/profile/profile.dart';
import 'package:weightburner_119/settings/widget/settings_item_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SetItWid(
              imageSetti: 'assets/icons/ policy_icon.svg',
              text: 'Privacy Policy',
              onPressed: () {},
            ),
            SetItWid(
              imageSetti: 'assets/icons/terms_icon.svg',
              text: 'Terms of Use',
              onPressed: () {},
              isPaddin: true,
              iconHeg: 24.h,
            ),
            SetItWid(
              imageSetti: 'assets/icons/support_icon.svg',
              text: 'Support',
              onPressed: () {},
              isPaddin: true,
            ),
            SetItWid(
              imageSetti: 'assets/icons/restore_icon.svg',
              text: 'Restore',
              onPressed: () {},
              isPaddin: true,
              iconHeg: 27.h,
            ),
            SetItWid(
              imageSetti: 'assets/icons/profile.svg',
              text: 'My profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              isPaddin: true,
              iconHeg: 25.h,
            ),
            SetItWid(
              imageSetti: 'assets/icons/premium_icon.png',
              text: 'Buy Premium for \$0,99',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PremiumScreen(
                      isClose: true,
                    ),
                  ),
                );
              },
              isPaddin: true,
              isSvgAndPng: true,
            ),
          ],
        ),
      ),
    );
  }
}

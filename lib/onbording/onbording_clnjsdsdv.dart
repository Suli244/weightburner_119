// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/onbording/widget/onbcsdhjncsdvsdv.dart';
import 'package:weightburner_119/onbording/widget/rest_wid.dart';
import 'package:weightburner_119/premium/prencsdsnvcds.dart';
import 'package:weightburner_119/settings/weightburner_prevkdv.dart';

class OnbordingLajbcascas extends StatefulWidget {
  const OnbordingLajbcascas({super.key});

  @override
  State<OnbordingLajbcascas> createState() => _OnbordingLajbcascasState();
}

class _OnbordingLajbcascasState extends State<OnbordingLajbcascas> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currantPage = value;
              });
            },
            children: const [
              OnBoardingItemKjbcasc(
                imageOnBoar: 'assets/images/onbo_one.png',
                titleOnBoar: 'Effective Workouts',
                desOnBoar:
                    'Choose and perform workouts based \non your fitness level',
              ),
              OnBoardingItemKjbcasc(
                imageOnBoar: 'assets/images/onbo_two.png',
                titleOnBoar: 'Food Scanner',
                desOnBoar:
                    'Scan the product by barcode and \nmonitor your nutrition',
              ),
              OnBoardingItemKjbcasc(
                imageOnBoar: 'assets/images/onbo_trhee.png',
                titleOnBoar: 'Habit Testing',
                desOnBoar:
                    'Set challenges for yourself and get \ncloser to a healthy life',
              ),
            ],
          ),
          Positioned(
            bottom: 42.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: WbColors.blue009AFF,
                      dotColor: WbColors.white9ba6b2,
                      dotHeight: 8,
                      dotWidth: 9,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  WbMotion(
                    onPressed: () async {
                      if (currantPage == 2) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Ljbvasdsdvsd(),
                          ),
                          (protected) => false,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32).r,
                        color: WbColors.blue009AFF,
                      ),
                      child: Center(
                        child: Text(
                          'Next',
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

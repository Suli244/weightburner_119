import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:weightburner_119/challenges/logic/cubit/challenges_cubit.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';
import 'package:weightburner_119/challenges/widget/challenges_widget.dart';
import 'package:weightburner_119/challenges/widget/two_cat_widget.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  int chaleVyb = 0;
  @override
  void initState() {
    context.read<ChallengesCubit>().getChallenges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Challenges',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            const TwoCatWidg(),
            SizedBox(height: 24.h),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
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
              child: Row(
                children: [
                  Expanded(
                    child: WbMotion(
                      onPressed: () {
                        setState(() {
                          chaleVyb = 0;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: chaleVyb == 0
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sport',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: chaleVyb == 0
                                    ? Colors.white
                                    : WbColors.blue04213E),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: WbMotion(
                      onPressed: () {
                        setState(() {
                          chaleVyb = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: chaleVyb == 1
                              ? WbColors.blue04213E
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Health',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: chaleVyb == 1
                                    ? Colors.white
                                    : WbColors.blue04213E),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            chaleVyb == 0
                ? BlocBuilder<ChallengesCubit, ChallengesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const Center(
                          child: SizedBox.square(
                            dimension: 24,
                            child: CircularProgressIndicator(
                              color: WbColors.black,
                              strokeWidth: 2.5,
                            ),
                          ),
                        ),
                        error: (error) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width.w,
                            child: Text(
                              error,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        success: (model) {
                          List<ChallengesContent> sport =
                              model.where((e) => e.sp == false).toList();
                          return ChallengesWidget(
                            model: sport,
                            onTTT: (value) {
                              context.read<ChallengesCubit>().getChallenges();
                            },
                          );
                        },
                      );
                    },
                  )
                : BlocBuilder<ChallengesCubit, ChallengesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const Center(
                          child: SizedBox.square(
                            dimension: 24,
                            child: CircularProgressIndicator(
                              color: WbColors.black,
                              strokeWidth: 2.5,
                            ),
                          ),
                        ),
                        error: (error) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width.w,
                            child: Text(
                              error,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        success: (model) {
                          List<ChallengesContent> health =
                              model.where((e) => e.sp == true).toList();
                          return ChallengesWidget(
                            model: health,
                            onTTT: (value) {
                              context.read<ChallengesCubit>().getChallenges();
                            },
                          );
                        },
                      );
                    },
                  ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

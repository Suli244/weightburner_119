import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:weightburner_119/challenges/logic/cubit/challenges_cubit.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';
import 'package:weightburner_119/challenges/logic/repositories/challenges_repo.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/premium/prencsdsnvcds.dart';
import 'package:weightburner_119/settings/weightburner_prevkdv.dart';

class ChallengesWidget extends StatefulWidget {
  const ChallengesWidget({
    super.key,
    required this.model,
    required this.onTTT,
  });

  final List<ChallengesContent> model;
  final ValueChanged onTTT;
  @override
  State<ChallengesWidget> createState() => _ChallengesWidgetState();
}

class _ChallengesWidgetState extends State<ChallengesWidget> {
  var bloc = ChallengesCubit(ChallengesRepoImpl());
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final durationUntilMidnight = nextMidnight.difference(now);
    _timer = Timer(durationUntilMidnight, () {
      bloc.setAllCheckDaysTrue().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWeightburnerPinjcdv(),
        builder: (context, snapshot) {
          bool chek = snapshot.data ?? false;
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CallenddddWwww(
                  model: widget.model[index],
                  onTTT: widget.onTTT,
                  bloc: bloc,
                  chelP: index > 2 && !chek,
                );
              },
              separatorBuilder: (_, i) => SizedBox(height: 16.h),
              itemCount: widget.model.length);
        });
  }
}

class CallenddddWwww extends StatelessWidget {
  const CallenddddWwww({
    super.key,
    required this.model,
    required this.onTTT,
    required this.bloc,
    required this.chelP,
  });

  final ChallengesContent model;
  final ValueChanged onTTT;
  final ChallengesCubit bloc;
  final bool chelP;
  @override
  Widget build(BuildContext context) {
    return chelP
        ? Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: IgnorePointer(
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  model.title,
                                  style: TextStyle(
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w500,
                                    color: WbColors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.w),
                              Image.asset(model.image, width: 40.w)
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  model.status,
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500,
                                    color: WbColors.blue009AFF,
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.w),
                              Text(
                                '${model.daysLeft}/${model.daysPassed}',
                                style: TextStyle(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w500,
                                  color: WbColors.blue009AFF,
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: 62.h,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, innerIndex) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.r, vertical: 4.r),
                                      decoration: BoxDecoration(
                                          color: model.daysLeft == innerIndex
                                              ? WbColors.blue009AFF
                                              : model.daysLeft > innerIndex
                                                  ? Colors.transparent
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 24.h,
                                            width: 24.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: model.daysLeft ==
                                                      innerIndex
                                                  ? Colors.transparent
                                                  : model.daysLeft > innerIndex
                                                      ? WbColors.blue009AFF
                                                      : Colors.transparent,
                                              border: Border.all(
                                                width: 2,
                                                color: model.daysLeft ==
                                                        innerIndex
                                                    ? WbColors.white
                                                    : model.daysLeft >
                                                            innerIndex
                                                        ? WbColors.blue009AFF
                                                        : WbColors.black
                                                            .withOpacity(0.6),
                                              ),
                                            ),
                                            child: model.daysLeft > innerIndex
                                                ? Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 20.r,
                                                      color: WbColors.white,
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                          SizedBox(height: 6.h),
                                          Text(
                                            '${innerIndex + 1}',
                                            style: TextStyle(
                                              fontSize: 16.h,
                                              fontWeight: FontWeight.w500,
                                              color: model.daysLeft ==
                                                      innerIndex
                                                  ? WbColors.whitEEEAEA
                                                  : model.daysLeft > innerIndex
                                                      ? WbColors.black
                                                          .withOpacity(0.6)
                                                      : WbColors.black
                                                          .withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, innerIndex) =>
                                      SizedBox(width: 16.w),
                                  itemCount: model.daysPassed,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          BlocProvider.value(
                            value: bloc,
                            child: IgnorePointer(
                              ignoring: !model.chekDay,
                              child: SwipeButton(
                                thumbPadding: EdgeInsets.all(2.r),
                                borderRadius: BorderRadius.circular(32.r),
                                height: 56.h,
                                thumb: model.chekDay == true
                                    ? Image.asset('assets/images/skrrbbb.png')
                                    : Image.asset(
                                        'assets/images/skrrbbbFalse.png'),
                                activeTrackColor: model.chekDay == true
                                    ? WbColors.blue009AFF
                                    : WbColors.blue009AFF.withOpacity(0.6),
                                onSwipe: model.chekDay == true
                                    ? () async {
                                        int sss = model.daysLeft;
                                        if (model.daysLeft >=
                                            model.daysPassed) {
                                          sss = 0;
                                        } else {
                                          sss = sss + 1;
                                        }
                                        await bloc.saveChallengeButton(
                                            model.id, sss);
                                        onTTT('');
                                      }
                                    : () {},
                                child: Center(
                                  child: Text(
                                    "Complete day ${model.daysLeft + 1}",
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: WbMotion(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Ljbvasdsdvsd(isClose: true),
                        ),
                      );
                    },
                    child: Container(
                      height: 52.h,
                      width: 263.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32).r,
                        color: WbColors.blue009AFF,
                      ),
                      child: Center(
                        child: Text(
                          'Buy Premium for \$0,99',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Image.asset('assets/images/proPrem.png', width: 48, height: 24))
            ],
          )
        : Container(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        model.title,
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Image.asset(model.image, width: 40.w)
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        model.status,
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.blue009AFF,
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Text(
                      '${model.daysLeft}/${model.daysPassed}',
                      style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        color: WbColors.blue009AFF,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 62.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, innerIndex) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.r, vertical: 4.r),
                            decoration: BoxDecoration(
                                color: model.daysLeft == innerIndex
                                    ? WbColors.blue009AFF
                                    : model.daysLeft > innerIndex
                                        ? Colors.transparent
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Column(
                              children: [
                                Container(
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: model.daysLeft == innerIndex
                                        ? Colors.transparent
                                        : model.daysLeft > innerIndex
                                            ? WbColors.blue009AFF
                                            : Colors.transparent,
                                    border: Border.all(
                                      width: 2,
                                      color: model.daysLeft == innerIndex
                                          ? WbColors.white
                                          : model.daysLeft > innerIndex
                                              ? WbColors.blue009AFF
                                              : WbColors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  child: model.daysLeft > innerIndex
                                      ? Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 20.r,
                                            color: WbColors.white,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '${innerIndex + 1}',
                                  style: TextStyle(
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w500,
                                    color: model.daysLeft == innerIndex
                                        ? WbColors.whitEEEAEA
                                        : model.daysLeft > innerIndex
                                            ? WbColors.black.withOpacity(0.6)
                                            : WbColors.black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, innerIndex) =>
                            SizedBox(width: 16.w),
                        itemCount: model.daysPassed,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                BlocProvider.value(
                  value: bloc,
                  child: IgnorePointer(
                    ignoring: !model.chekDay,
                    child: SwipeButton(
                      thumbPadding: EdgeInsets.all(2.r),
                      borderRadius: BorderRadius.circular(32.r),
                      height: 56.h,
                      thumb: model.chekDay == true
                          ? Image.asset('assets/images/skrrbbb.png')
                          : Image.asset('assets/images/skrrbbbFalse.png'),
                      activeTrackColor: model.chekDay == true
                          ? WbColors.blue009AFF
                          : WbColors.blue009AFF.withOpacity(0.6),
                      onSwipe: model.chekDay == true
                          ? () async {
                              int sss = model.daysLeft;
                              if (model.daysLeft >= model.daysPassed) {
                                sss = 0;
                              } else {
                                sss = sss + 1;
                              }
                              await bloc.saveChallengeButton(model.id, sss);
                              onTTT('');
                            }
                          : () {},
                      child: Center(
                        child: Text(
                          "Complete day ${model.daysLeft + 1}",
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

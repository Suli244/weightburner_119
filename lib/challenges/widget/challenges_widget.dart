import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:weightburner_119/challenges/logic/cubit/challenges_cubit.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';
import 'package:weightburner_119/challenges/logic/repositories/challenges_repo.dart';
import 'package:weightburner_119/core/wb_colors.dart';

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
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
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
                        widget.model[index].title,
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Image.asset(widget.model[index].image, width: 40.w)
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.model[index].status,
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: WbColors.blue009AFF,
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Text(
                      '${widget.model[index].daysLeft}/${widget.model[index].daysPassed}',
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
                      height: 61.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, innerIndex) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.r, vertical: 4.r),
                            decoration: BoxDecoration(
                                color: widget.model[index].daysLeft ==
                                        innerIndex
                                    ? WbColors.blue009AFF
                                    : widget.model[index].daysLeft > innerIndex
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
                                    color: widget.model[index].daysLeft ==
                                            innerIndex
                                        ? Colors.transparent
                                        : widget.model[index].daysLeft >
                                                innerIndex
                                            ? WbColors.blue009AFF
                                            : Colors.transparent,
                                    border: Border.all(
                                      width: 2,
                                      color: widget.model[index].daysLeft ==
                                              innerIndex
                                          ? WbColors.white
                                          : widget.model[index].daysLeft >
                                                  innerIndex
                                              ? WbColors.blue009AFF
                                              : WbColors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  child:
                                      widget.model[index].daysLeft > innerIndex
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
                                    color: widget.model[index].daysLeft ==
                                            innerIndex
                                        ? WbColors.whitEEEAEA
                                        : widget.model[index].daysLeft >
                                                innerIndex
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
                        itemCount: widget.model[index].daysPassed,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                BlocProvider.value(
                  value: bloc,
                  child: IgnorePointer(
                    ignoring: !widget.model[index].chekDay,
                    child: SwipeButton(
                      thumbPadding: EdgeInsets.all(2.r),
                      borderRadius: BorderRadius.circular(32.r),
                      height: 56.h,
                      thumb: widget.model[index].chekDay == true
                          ? Image.asset('assets/images/skrrbbb.png')
                          : Image.asset('assets/images/skrrbbbFalse.png'),
                      activeTrackColor: widget.model[index].chekDay == true
                          ? WbColors.blue009AFF
                          : WbColors.blue009AFF.withOpacity(0.6),
                      onSwipe: widget.model[index].chekDay == true
                          ? () async {
                              await bloc
                                  .saveStarChallenges(widget.model[index].id);
                              widget.onTTT('');
                            }
                          : () {},
                      child: Center(
                        child: Text(
                          "Complete day ${widget.model[index].daysLeft}",
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
        },
        separatorBuilder: (_, i) => SizedBox(height: 16.h),
        itemCount: widget.model.length);
  }
}

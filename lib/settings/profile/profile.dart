import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data.dart';
import 'package:weightburner_119/assessment/hive_data_profil/hive_data_box.dart';
import 'package:weightburner_119/assessment/pages/assess_name_screen.dart';

import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/settings/profile/widget/profile_item_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  HiveData profileHiveModel = hiveDataProfile.get('profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: WbMotion(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 24.w,
              color: WbColors.black,
            ),
          ),
        ),
        title: Text(
          'My profile',
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: WbColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Center(
          child: Column(
            children: [
              profileHiveModel.imageAvatar != ''
                  ? CircleAvatar(
                      radius: 60.h,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          FileImage(File(profileHiveModel.imageAvatar)),
                    )
                  : CircleAvatar(
                      radius: 60.h,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          const AssetImage('assets/images/user_profile.png'),
                    ),
              SizedBox(height: 12.h),
              Text(
                profileHiveModel.name,
                style: TextStyle(
                  fontSize: 24.h,
                  fontWeight: FontWeight.w500,
                  color: WbColors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              SizedBox(height: 48.h),
              ProfileItemWidget(
                title: 'Height',
                des: '${profileHiveModel.height}cm',
              ),
              ProfileItemWidget(
                title: 'Weight',
                des: '${profileHiveModel.weight}kg',
              ),
              ProfileItemWidget(
                title: 'Gender',
                des: profileHiveModel.gender,
              ),
              ProfileItemWidget(
                title: 'Age',
                des: '${profileHiveModel.age}y',
              ),
              const Spacer(),
              WbMotion(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.w600,
                            color: WbColors.black,
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to delete the account?',
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400,
                            color: WbColors.black,
                          ),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontSize: 18.h,
                                fontWeight: FontWeight.w600,
                                color: WbColors.black,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 18.h,
                                fontWeight: FontWeight.w600,
                                color: WbColors.redFF0000,
                              ),
                            ),
                            onPressed: () {
                              hiveDataProfile.delete('profile');
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AssessNameScreen(
                                    isActiv: true,
                                  ),
                                ),
                                (protected) => false,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32).r,
                    color: WbColors.redFF0000,
                  ),
                  child: Center(
                    child: Text(
                      'Delete account',
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
              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weightburner_119/assessment/pages/assess_gender_screen.dart';
import 'package:weightburner_119/assessment/widgets/app_unfocuser.dart';
import 'package:weightburner_119/assessment/widgets/custom_text_fields.dart';
import 'package:weightburner_119/core/con_bar.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';

class AssessNameScreen extends StatefulWidget {
  const AssessNameScreen({
    super.key,
    this.isActiv = false,
  });
  final bool isActiv;
  @override
  State<AssessNameScreen> createState() => _AssessNameScreenState();
}

class _AssessNameScreenState extends State<AssessNameScreen> {
  File? selectedImage;
  String data = '';

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        backgroundColor: WbColors.blue04213E,
        appBar: AppBar(
          leading: widget.isActiv
              ? null
              : Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: WbMotion(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WbBottomBar(
                            indexScr: 0,
                          ),
                        ),
                        (protected) => false,
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24.w,
                      color: WbColors.white,
                    ),
                  ),
                ),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Assessment',
              style: TextStyle(
                fontSize: 24.h,
                fontWeight: FontWeight.w600,
                color: WbColors.white,
                height: 0,
              ),
            ),
          ),
          backgroundColor: WbColors.blue04213E,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 90.h),
                  Text(
                    'Enter your name',
                    style: TextStyle(
                      fontSize: 24.h,
                      fontWeight: FontWeight.w600,
                      color: WbColors.white,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 116.h,
                    child: data.isNotEmpty
                        ? selectedImage == null
                            ? WbMotion(
                                onPressed: () {
                                  pickerGallery();
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Image.asset(
                                      'assets/images/gallery_assessment.png',
                                      width: 24.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Upload your profile picture',
                                      style: TextStyle(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w700,
                                        color: WbColors.white,
                                        height: 0,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )
                            : WbMotion(
                                onPressed: () {
                                  pickerGallery();
                                },
                                child: CircleAvatar(
                                  radius: 40.h,
                                  backgroundColor: Colors.white,
                                  backgroundImage: FileImage(
                                      File(selectedImage?.path ?? "")),
                                ),
                              )
                        : null,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {
                        data = value;
                      });
                    },
                    maxLength: 16,
                    counterText: '',
                    isFillColor: true,
                    fillColor: WbColors.white,
                    hintText: 'Enter',
                    hintStyle: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: WbColors.black.withOpacity(0.40),
                      height: 0,
                    ),
                    textStyleSerch: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: WbColors.black.withOpacity(0.40),
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 279.h),
                  WbMotion(
                    onPressed: data.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AssessGenderScreen(
                                  name: data,
                                  imageAvatar: selectedImage?.path ?? '',
                                ),
                              ),
                            );
                          },
                    child: Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32).r,
                        color: data.isEmpty
                            ? WbColors.blue009AFF.withOpacity(0.6)
                            : WbColors.blue009AFF,
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500,
                            color: data.isEmpty
                                ? Colors.white.withOpacity(0.6)
                                : Colors.white,
                            height: 0,
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
    );
  }

  Future pickerGallery() async {
    final retuImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (retuImage == null) return;
    setState(() {
      selectedImage = File(retuImage.path);
    });
  }
}

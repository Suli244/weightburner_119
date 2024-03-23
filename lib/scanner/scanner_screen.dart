import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner_box.dart';
import 'package:weightburner_119/scanner/widget/aler_cupertino_alert_dialog_widget.dart';
import 'package:weightburner_119/scanner/widget/open_item_widget.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  List<HiveScanner> scanList = [];
  String nullModel = '';

  @override
  void initState() {
    scanList = List.from(hiveScanner.values.toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Scanner',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: WbMotion(
              onPressed: () async {
                // detailCuperAlerScanner(
                //   context,
                //   FoodModel(
                //     carbonhydrates: 0,
                //     calories: 0,
                //     fat: 0,
                //     proteins: 0,
                //   ),
                // );
                await cuperAlerScanner(context);
                scanList = List.from(hiveScanner.values.toList());
                setState(() {});
              },
              child: Image.asset(
                'assets/icons/scanner_icon.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
        ],
      ),
      body: scanList.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Center(
                child: Image.asset(
                  'assets/images/null_scanner.png',
                  width: 230.w,
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              itemBuilder: (context, index) {
                return ScannerProdItemWidget(
                  model: scanList[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: scanList.length,
            ),
    );
  }
}

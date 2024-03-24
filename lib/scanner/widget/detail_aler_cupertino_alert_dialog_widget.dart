import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner_box.dart';
import 'package:weightburner_119/scanner/model/footmocas.dart';
import 'package:weightburner_119/scanner/widget/scanner_item_widget.dart';

Future detailCuperAlerScanner(
    BuildContext context, FoodModel foodModel, String nameFood) async {
  await showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          nameFood,
          style: TextStyle(
            fontSize: 18.h,
            fontWeight: FontWeight.w600,
            color: WbColors.black,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5.h),
            ScannerItemWidget(
                title: 'Calories', des: '${foodModel.calories ?? '-'} kcal'),
            ScannerItemWidget(
                title: 'Carbohydrates',
                des: '${foodModel.carbonhydrates ?? '-'}'),
            ScannerItemWidget(
                title: 'Proteins', des: '${foodModel.proteins ?? '-'}'),
            ScannerItemWidget(
              title: 'Fats',
              des: '${foodModel.fat ?? '-'}',
              isDivider: true,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w500,
                color: WbColors.black,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              await hiveScanner.add(
                HiveScanner(
                  name: nameFood,
                  calories: '${foodModel.calories ?? '-'}',
                  carbohydrates: '${foodModel.carbonhydrates ?? '-'}',
                  proteins: '${foodModel.proteins ?? '-'}',
                  fats: '${foodModel.fat ?? '-'}',
                ),
              );
              Navigator.pop(context);
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                color: WbColors.blue009AFF,
              ),
            ),
          ),
        ],
      );
    },
  );
}

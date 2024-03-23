import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/core/wb_motin.dart';
import 'package:weightburner_119/scanner/hive_scanner/hive_scanner.dart';
import 'package:weightburner_119/scanner/widget/scanner_item_widget.dart';

class ScannerProdItemWidget extends StatefulWidget {
  const ScannerProdItemWidget({
    super.key,
    required this.model,
  });
  final HiveScanner model;

  @override
  State<ScannerProdItemWidget> createState() => _ScannerProdItemWidgetState();
}

class _ScannerProdItemWidgetState extends State<ScannerProdItemWidget> {
  bool isopen = false;
  @override
  Widget build(BuildContext context) {
    return WbMotion(
      onPressed: () {
        setState(() {
          isopen = !isopen;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(2.0, 2.7),
              blurRadius: 12,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.model.name,
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w600,
                      color: WbColors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  Icon(
                    isopen
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down,
                    size: 30.h,
                    color: WbColors.black,
                  )
                ],
              ),
              if (isopen)
                Column(
                  children: [
                    SizedBox(height: 13.h),
                    ScannerItemWidget(
                      title: 'Calories',
                      des: widget.model.calories,
                    ),
                    ScannerItemWidget(
                      title: 'Carbohydrates',
                      des: widget.model.carbohydrates,
                    ),
                    ScannerItemWidget(
                      title: 'Proteins',
                      des: widget.model.proteins,
                    ),
                    ScannerItemWidget(
                      title: 'Fats',
                      des: widget.model.fats,
                      isDivider: true,
                      isSize: true,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

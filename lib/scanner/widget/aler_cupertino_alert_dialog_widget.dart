import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:weightburner_119/core/wb_colors.dart';
import 'package:weightburner_119/scanner/cubit/scanner_c_cubit/scanner_c_cubit.dart';
import 'package:weightburner_119/scanner/widget/detail_aler_cupertino_alert_dialog_widget.dart';

Future cuperAlerScanner(BuildContext context) async {
  bool isLoading = false;
  TextEditingController controllerScanner = TextEditingController();
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return CupertinoAlertDialog(
          title: Text(
            'Title',
            style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.w600,
              color: WbColors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Write name of product',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  color: WbColors.black,
                ),
              ),
              SizedBox(height: 12.h),
              CupertinoTextField(
                style: TextStyle(
                  fontSize: 13.h,
                  fontWeight: FontWeight.w400,
                  color: WbColors.black.withOpacity(0.60),
                ),
                controller: controllerScanner,
                maxLength: 18,
                placeholder: 'Enter',
                placeholderStyle: TextStyle(
                  fontSize: 12.h,
                  fontWeight: FontWeight.w400,
                  color: WbColors.black.withOpacity(0.60),
                  height: 0,
                ),
                keyboardType: TextInputType.text,
                decoration: BoxDecoration(
                  color: WbColors.whitEEEAEA,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: WbColors.whitEEEAEA,
                  ),
                ),
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
            BlocProvider(
              create: (context) => ScannerCCubit(),
              child: BlocListener<ScannerCCubit, ScannerCState>(
                listener: (context, state) {
                  isLoading = state.isLoading;
                  setState(() {});
                  state.whenOrNull(
                    success: (foodModel) async {
                      if (foodModel != null) {
                        await detailCuperAlerScanner(
                          context,
                          foodModel,
                          controllerScanner.text,
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Product not found'),
                          ),
                        );
                      }
                    },
                    error: (e) => print(e),
                  );
                },
                child: Builder(
                  builder: (context) => CupertinoDialogAction(
                    onPressed: () async {
                      var vdvwed = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      if (vdvwed is String) {
                        context.read<ScannerCCubit>().getFood(vdvwed);
                      }
                    },
                    child: isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Text(
                            'Scan',
                            style: TextStyle(
                              fontSize: 18.h,
                              fontWeight: FontWeight.w600,
                              color: WbColors.blue009AFF.withOpacity(0.40),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        );
      });
    },
  );
}

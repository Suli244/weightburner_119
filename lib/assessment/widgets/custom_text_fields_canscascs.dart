import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weightburner_119/assessment/widgets/iinpp_boored.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixColor,
    this.suffixColor,
    this.fillColor,
    this.isFillColor = false,
    this.textStyleSerch,
    this.onChanged,
    this.focusNode,
    this.maxLength,
    this.counterText,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? fillColor;
  final bool isFillColor;
  final TextStyle? textStyleSerch;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final int? maxLength;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyleSerch,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      cursorColor: Colors.black.withOpacity(0.8),
      cursorWidth: 1.5,
      cursorHeight: 17.h,
      maxLength: maxLength,
      strutStyle: const StrutStyle(
        forceStrutHeight: true,
        height: 1.3,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        counterText: counterText,
        filled: isFillColor,
        fillColor: fillColor,
        suffixIconColor: suffixColor,
        prefixIconColor: prefixColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        border: isOutline
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.unOutlineBorderColorE5E5E5Width1,
        enabledBorder: isOutline == true
            ? InputBorders.outlineBorderColorE5E5E5Width1Radius10
            : InputBorders.outlineBorderColorE5E5E5Width1Radius10,
        focusedBorder: isOutline == true
            ? InputBorders.outlineBorderColorGreenWidth2Radius10
            : InputBorders.unOutlineBorderColorGreenWidth2,
        focusedErrorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
        errorBorder: isOutline == true
            ? InputBorders.outlineBordercolorF68080Width2Radius10
            : InputBorders.unOutlineBordercolorF68080Width2,
      ),
    );
  }
}

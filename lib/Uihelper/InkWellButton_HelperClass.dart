import 'package:flutter/material.dart';
import '../component/colors_helper.dart';

class InkWellButtonHelperClass{
  static Widget customTextLink({
    required String text,
    required VoidCallback onTap,
    TextStyle? style,
    Color? textColor,
    TextDecoration decoration = TextDecoration.none,
    bool useGradient = false,
    fontSize = 15.0,
    fontWeight = FontWeight.w500,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor ?? AppColor.inkWellButtonColorsBlue,
          decoration: decoration,
          decorationThickness: 1.85,
          decorationColor: AppColor.inkWellButtonColorsBlue,
        ),
      ),
    );
  }
}
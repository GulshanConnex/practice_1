import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextButtonHelperClass {
  static Widget customTextButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
    String? svgIconPath,
    double height = 44.0,
    Color textColor = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    Color borderColor = Colors.grey,  // New parameter for border color
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor),  // Use the borderColor parameter
        ),
        minimumSize: Size(double.infinity, height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgIconPath != null)
            SvgPicture.asset(
              svgIconPath, // Load the SVG image
              width: 24,  // Adjust size as necessary
              height: 24,
            ),
          if (icon != null)
            Icon(icon, color: textColor),
          if (svgIconPath != null || icon != null) SizedBox(width: 15), // Add space only if icon or SVG is present
          Text(
            text,
            style: TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: textColor),
          ),
        ],
      ),
    );
  }
}

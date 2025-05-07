import 'package:flutter/material.dart';

import 'colors_helper.dart';

class AppGradients {
  static LinearGradient blueGreenGradient = LinearGradient(
    colors: [AppColor.elevatedButtonTopCenterBlue, AppColor.elevatedButtonBottomCenterBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
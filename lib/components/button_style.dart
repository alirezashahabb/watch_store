import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimes.medium))));
}
